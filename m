Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D533BC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA9360E4C;
	Fri, 18 Sep 2026 18:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWbaxO4Dk1kr; Fri, 18 Sep 2026 18:50:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A150E60E57
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757418;
	b=reV025b2j11wITmI9RcMjV0hmAyQufgWAneawAc4bHQw3SKaS3uYygL67qCf2VFry5ra
	 xMhfsmgvH41OpnJ5CMt5fc7YY608KNsDS9nlTWh9jESEjneFwdyXtXR/FkRm72tjILX4I
	 H8EwVNC47g/vLLgu+XMsKFEi34/Kmkja6IqXmOv+Ww7doyNJ0AhXbm4UIxu9cufIQPYU+
	 5VcGbJlQSZ8At4C1brLDdRV6iTW2MdfwiDroPtdUViTloa3H2XOtP2gmkVsdKzxLIG2Bo
	 FXQyaYgt+toC4Xu66UBZKexu612zbDFrTNom3r/xDr08q6lkSD8t0cSfRnzoHUpDZ1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=TSH8f5aI39tiAP3rDScEwm0iC+gS59YZsWGYO8yWhOkHmWvIwIB+0H7VKSS331+Btiuj
	 M7mAz/IkfOLSsFrUFSVaQzG+rANVwIF87AmoqrrdprD1sQgthlWF7VEa9Q+pgG8NECBSZ
	 IEqZeaFi0vLxVm10TSxfSgkzNuovVMYfPEuNhJ5Hs8/OJ8CCRYmxqNTDh2U7OyECFrFf1
	 5LMlcnA7ujwtycK0wsjvGJTutSlE1PEfU1iWz1wVexXXuZFCGVAk9tJTgyXXxafQv74oW
	 3v3DhSmJ5tklyC6/7WkV7zdh3B9fvB728hgD+PO4uBNRczYZEZ7iZQCQTGWnMOTvL4w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757418;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sHNOx9v9IF9rZ9Pti7r6T8dDInsIHCn59qr60mG0KUjwJQ4L9AzVUGFaKi+m2V39v
	 2OtFN32wRfh6LY5mk8rS5p1J/mtyGjWxwtlu/CQDzfL9L70eTBT8Z++xlqgeMzc/7f
	 B+F825JANcVJcQ4q3hj/k0v+5Pt+RVQCC5lS7CBfhtWteoOZ9wbE0jMYDcWeoVrsl5
	 P2+obr/9cbI3itVVaHwqRRa75RKUtuPiwXHyNNNkvo9hiATEJjohN78/pmWMFNWr7i
	 3TX2vrBzxog4DMbHoV/dnisvJ15SXRnhAppsvvtsvet0zNT1wsVIuXG9FPTEh5XtD2
	 DKVIITkE2fImA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A150E60E57;
	Fri, 18 Sep 2026 18:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F3E237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E3E40CBF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CulDPF8lPTQB for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3D22E40CD5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757416;
 b=oOyYHoIK5ceY7EHfW5szlaYAwcnG3zzm0vURx2TZRbAKv1H80ubiwqP22m9/4IVHZqQe
 CTxtp9N7bfl7Nya6HA2OfKioK51WV+lxaAtRjDMDU8+Ou0eX1rjUT+9L1PxLCwsL6PdHU
 vJpTkJekojrVIGeITxNBhZM7smaX22UapCu3TiMwHJGqR0MpKkAryuw6CIpc5urA0enM0
 KT2shWvU99AQasQa7B/Q5XoagSpQSB45nLtaO7CzUXTN9ZflVf63/OiPv9EIkak7Fb4+H
 3cXNzgn7bhqsSzX1+MWjBZynDsfHc19khkFwxR0Fr6ZpwhIr/L2VRmv5BD1bWWpyIiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757416;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=Q6OF5R6G8KimuysqEwCCGODOpRj1lCjKH24EfeszKrAWNSbCO7v/z5DAYy2TLq0T//zV
 XfYcJ3dAccNkBA5L0YU/aIqBM/hjvezC2b8TGAPLRli4JGm0TnIR1/9ioAHrDK0T4iSkM
 f83qmTvtFqyM2Q2+4z4tM3YxeAXqEwQyPcJkVQgSX9TBAcm+bIzsovr5VTEQrMQ7zS8nk
 V2XLms9kM3NVt4NHIpzbcX18WLhohGPOwuDJXJyHUv+5ET+q0GzFTMZkyHWrb29Yj1NiT
 BOH4Il+qq4fQUfmj75kPFgeyTJOGUPSPEDEzeIXbhJoD0KFg985wIFiIbNSEr9p/nqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GesoCWgX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GesoCWgX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D22E40CD5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756934;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GesoCWgXPV7/ge5T8FqBMTWmfDapSDV8vLHIy3XqHSC6QkxDhV2tQcdR5KK0TnNMJ
 rFbZoMZYpiGla0Gl5qqckRnUUlaSyTSWEzpQWplXN4BQImPABwCbfDzhMpDYF9cIsl
 rPaTBOoj+Fr2FeGh8078nPpZGzHBsD3RjEOc4KM4B/4vL6jil0A9Mn7L/VPS0Hl/Mw
 0Os5d+uNbQfdYWOZYc0TSbg9mtysnAPQjvDdjkPivIszV5ED/p5/AsSRbivGBDB6Hv
 Ve6twc5XCegmBjle6Xyj3wqzofz1qSLwkqd11mBP4NTV5LsYWjrG+MrxBvwQMbMGjS
 jRjCHighllaqw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:WdESqCNyiVOG+rLByDd1fzTOwm133+wld8hhkzw22dvnK+J+EzHHwbMz4F9022EA3Zpt+XC0FrDwHf3RPIDRzbp3wlTA4CfOnNd3ZKGludWicDX5BEGTE7Pt9B0Fmm8MRJ7VGb0ZzP6VOSgy+0zqkpvzysha/d7K++iJ849m5FsNNf2rja6iW2ZCmPRza9klopLdhgdiqe9XH+HZcybnIIDFLe90AO8hy7KBRXxNaY68z7QGdAIAdS5QdJwQPQ8MXJ2yWbVs6WbxnaiOyqCznBcaYJ3USh7lDl9XdjO1V3j6VkERNjqdjigQWOw++7utlnUnACvXPRxhAOWiVofu0ueta9ifoFLy+w6i0bcgfULG0x4QbS9OxHMtclFAOXB9tJnDFcAEDlLfUrba2mrGsUUAWFO+E2AthWu2t3yX+TIfFkz9M+OYRZ3/yoxmNlWMQXMHKOljn3UcDU2pwmwQoMma21LkdFVAOwS5pjtEgFz5dmU+Kh8tZ+Wn8zBnSJHCHG/JXaBVDxu5k6kLsN/4upMq8Lre+7ongE+kwxunqNNJKxIVTeb7spPIm2VBF9DIk+kdS46Dmf/t7fzKrZdRzP81EK+Ezvd8HeiObeBctNj5j0
 cA83b1ANIG7DiKiLDfEYtJe5lJhjko2f9TlJqF1MDTNLGmpvA5KxQMRsjJ8MwVguIyTkhpH4w=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0226BA4C4728;
 Fri, 18 Sep 2026 20:42:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWt-000000007cB-3kj4;
 Fri, 18 Sep 2026 18:41:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:51 +0200
Message-ID: <20260918184140.3631274-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 29/77] package/nmap: bump version to 7.991
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
