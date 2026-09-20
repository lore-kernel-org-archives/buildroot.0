Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63982C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1A740E54;
	Sun, 20 Sep 2026 17:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZSa_oKciEme; Sun, 20 Sep 2026 17:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3073F40E98
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924393;
	b=Slg+QoXxoNLXe4WMHjrME9s4zcmexgAsztAzI3b1of58DHlbj+4ppfKisTkQENJs951l
	 ReihzdKLSSyK7PcuuCdIFZim8TEHQS8Bedu0/5ZBOMrG6a5sDrsEU2pqf5NzdX2xGZXBg
	 bCkChoKbB8Cx3RG88uOfe5IDWZau5ZfKKV2xBVI6zY8EeVqZaFe8KrSc/4ZKRqbnoQGiM
	 Bk+FrqT1r0h/r3QIiCrhrRjAWaGjBhl3a0RqcdMCwqbyyiJyy+oeNokHoLORPSNc1piJe
	 zLPAIztH4n5BOiLtXl73GS5u9gi2K5T1FyqEakLWtXsK8Vo/ozZPwPf+NqqUXf+wqfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=bFQf2I71NSb+5M5BP2ttOHQalOuLMVjLEXFJtJSycfUnp56iYCeuHJ+9ZQQEJ71Vlwgu
	 38Aa8pj2vkpMoqr3KZvD9QpxNdlwM7q/ums+TRLH6P/Nx2GDceNXwHu7IjLXw3uEnn9AU
	 8V4s42XNtzXXfQc9VRDcGaQKR/UIRWZpkzNBBZ/lOPfmmWGh79L97c+o3T0lyb+MXQmPi
	 VE1HJ/7kQTvb+BN4tW1k5HhXIzCFh2XO4EGezl6dWsg0Pwf1otnGwfFRd6ktziiB9e4Lf
	 eDO+yEC/j3T1aoZWUDiFfhkRPo9gDUvMR/Ce693Yi1Y4TH6amxknRdIieXM4d8X8vhw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924393;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lalsv5/a6862oFq9xUxoN1mXe0V5/6PTSz4jdRwtqoRSuJ6gJtBGwEMWXN5BeHFhC
	 yHQSP35C4xYMN8FAeFWKnQ82BItDwZDy8hW57qhFftWPK1iSI5mnZ1Nd2Wd9SBTBKO
	 0+7/JrobzVcjm+7phRX9ch3uGWWv9JAOf98uhdwyDk1BwPazXmy4enZxzUHo2dTU8A
	 SMmufAm9RHudOXbihCk5rEqjXHdBMEOYzOav+f6fGjvaayrynf0G8OZOwwVrK0Dlpk
	 dUcLVHSn7fsI3kvm8tzLnVchYWBrvvRjN3wIc+4fnj2lWFn1UR//cfNtzlHSOQfdo0
	 IhrBRrQDOucHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3073F40E98;
	Sun, 20 Sep 2026 17:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B27BA37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99519606F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HT1Rit5l-2NC for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7EAF1605F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924389;
 b=dYN2S17Nbnmt+impH8OUDIGzMOe5gIyOyASCLQdDzm0JPFEQ8oIY6x/cxKEna68j3BPP
 VjdbQpbVj6Euixd7pTd9Wrrh3UwETncZWTgkidgNm+R2A36uqtH94/jTrZ7QRdJf6IHNU
 pDqsTJF+GLnnH66EjmxOHAAEtMBGV0v9G8sopf6WMgFSUNtoAAjo/YVQSJtUkaEZZ8F+o
 tw5YLJXfdFwNqBSkvmPXYHc6wH2mC4QlduyBKMnkxlGPxKSWqp4btIYxXKLwk31xb+gQt
 oBDA705hwQF4D778FlM22BOWTPfzs8E+0bZvAasOOTJUKzTVwe7Ge5Gid2hOAFWxtTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924389;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=OKrCCXZiLpYy/9ZFhUbQU2zJ1TEk0OAKdbtDX81mhZJj3bsOaHAs2qEELYF/FEtsGp3v
 slY2NHw7CgJTCQAMhdDyJS3xqyz0ecYILNtvKBWU/tH3Gm4WY9Mne642tzsuvNI0lrjgd
 lM0i2qTHxPSs0VGZ/UIkjngAmyjTBbMxmQfxZgFfDtA8SUBAsbRf3HiUH3ORRP0ayOnz4
 9JZEZZOr3oqOAEBnUDF88K8DH0k7F+0JoGlE1xGmsDZd+0LiFxCe8aB99QrNImnTm+X3n
 ChP8Kj+2Jnvf3HKMkKAFn6w+Z1xqGZWB6e353JgwUiPypvFBqw28HNfHy46D75gSzKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="BsgWd/Sj"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BsgWd/Sj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EAF1605F9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924148;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BsgWd/SjQNXf1Ig/Uf54ESIHE1TgIvlDdVlHimU6sYxooRpXLtZSMPvWBB1vjt9IK
 bKze/nGw8YiR9z2E6rd38eWn6dREfDbByEwTFwObura3zUJUo00UglKsmvmQ/dQZaV
 00Iyi2VFCMBDMryZN0CWcnqEUYJeHd1Eq8Vs+EhIPhZcYzMhScSvNFZ2xNptkpCvDR
 t0/ddxswDKZxGAbPesHcyxW0vH/oJb88xhYHBEtsctdcpttv/xXOvGI/A+5ycO15Gw
 FjsLkv+ksTYiSg161TLnI/rYjh1pOYLDYa3qB5+6NsIqanMCLJUwmvcIZgKAXlhUck
 JbQex4VgfQAlw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:TsxBgSGv+RnPqADaFxlqrudW34jT/7dTzxUo8u7dXXMXtdcGT67PcVRWKHcojGEpIFJMizXpzwoiAaEJolyGcHeLyqxGCnZhQkOwzMIB2Uc147kR4dCWeg5y9+6OSZ2uL+/xZ1XuxBDJVefiP4jk3/ioabcZq7wUPjuNEGL4+po9XEt+FwR5K9SH5BRZTeqw/j/PS7zeDQONsElNbRUdJoAZKqKW+DTE2/k0fybjL9G6GGX7csl6i7fytLzGk2/YmbrMT2RkVhkMJuFSnrx6HSENbCiGZkyqAWMcrd5K+yg9NnDUhVMHQIBwW6jJsfzBDxn2e7fVEawOnKIuaV2WqeeCx2K1D/jvrAwanVHoprzjjD6UASSHIPpX+/AQKbWf3hes0BTSPiBaftR7u3q7qwGvBv/mBX6AFUzfoMmW4aUtE6lNM/U2dlih0B/FtG2CootD3KKAfKMpd66K0u5fLB98mH0TkPIvJZJgCRYDh18klOnVzEMgufIe2B7eTdP8qF37gcFQH+RPviIrprA69sEUCoFfbK3vv7F9jZ35ZMUvEhGcfOi/oUjBU1SHilNhoujiuMuSM5eKpYx9kYoQ2c6d7i/i1XFIPtaekUV4h5z/yK
 Z26b/OcxStfjLl8sj/lG1nxZYhYGDzi5+vnNh9lb7rmpLa6SvehebCB6J77FOTNuhQJ76Cpg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D34D2A4C487B;
 Sun, 20 Sep 2026 19:09:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1X-000000000o7-0RkS;
 Sun, 20 Sep 2026 17:08:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:18 +0200
Message-ID: <20260920170815.240247-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v5 11/67] package/nmap: bump version to 7.991
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
