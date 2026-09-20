Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0591C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6873140EB9;
	Sun, 20 Sep 2026 17:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpG94cQJLLkI; Sun, 20 Sep 2026 17:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 828D440DE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924368;
	b=Q8SN9TMd3pFLNsNtIKMdg6alzM3cwimlCHOhyhHgdakvu8C2o91ttKc+RzQHmYMz1Fu7
	 csaapuKweRrBN/nBLG6IllhNuCMllScLbiYghreERzaE414FrQeEiV/O52p7t/9uPb9fj
	 LkiolSpCdywHpDTWzXb+hZ7Oi7T26leTvjrYQvnDVT+Qm+sEpXgFc8ZdvQSQV4PaH+ysj
	 RyKeTk69lQt5REeb8fjRgCO/Alc2O+nwjCu3NyYKp/p/vcZcVW4BftsiLdAprxOVInUkn
	 EISYcHom9i3jJRSuS3UeEK2WDgpSrROOdxsrhj8WxiyIB+HJfOYT81GoF5Wq6UAK9EA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924368;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=T/daTuqsUdI3HDNaxHpeDH8TwE5W3CbpFFumWMRBCi3mu7ZrXy9QLJ2oaq9gHTlLxflV
	 iEPPAtEQlcv1W3m+YwH/w0BSyCSNYMjPbPqVdFGp2K4J71IdiOHroAA/Go5EiBE//qYey
	 3VB1j6mSG3kzwbmiB6R6NxhsPQaZ24gylby3Vw5g9uLnVSbql/GgjOsp+8QRHQKbyNBnj
	 DansZhyrUlMboeHBjCOGt8dwnt3/Anl6KguhDej/b5bpYAsObPe65MD1VDQ6JcB5uqRVC
	 IaimX6dtqi/4KmV/tjREFKmYzmPo5DGdsnp1UJEpUrjqrgkKXFxZEq3KJFCbvhvNAXg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924368;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g6pcyzkOth/DNyAoQbfAH3aQGTwgWh0daDf425GfClt44hkg51HMRSUF/21azqMNY
	 DyNPH6mK3OaHij2ZDraaz7OA5BrYEx0dCcqu6ZdH8El4Ci/Mjaa4fK6W1CbBHkb+GE
	 2jhbMEvCOS5lHBt/djjD2uBVa6s0AaDexd2+w0+I5ef8Ayg8Iw/0qTTI96Zmr2KINy
	 KDhVp+dINK7eMMuT1LO6/GOzMeHhJ1pi/bnPbUCQ1/AjRiqL4+MPKDPMYBp+aM36LO
	 U4Y7wpTUKXnliSbggQs606fAoNN52RorV5cAhkH+dhHrp8X/4fqPDZ4pBnLP7qZs/v
	 Eqyu5dE0DoJCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828D440DE9;
	Sun, 20 Sep 2026 17:12:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 352E337A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F8B606F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foCa5YbWW4f9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 546D7605F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924365;
 b=Bj9/ueV8LALsPEWrewqGBxcxLsoweIzoxms2zIZ5/mnOreZhMi/4i5lE/hHqig1ngUog
 TOfo/YKTl+HR/ZKOZfqR9IVRptohWGarOwUndLTvQbhpIifomGx+j9TzWJgN8VGJmiq1G
 NQC7MuDr9nQZLjWpgj+74CtxXcrBryY6FF4s091EIFvwKR8OtcW5lFj4qbzQWNPqVQSIQ
 zV+otnrnNfkK1CaqLsjF7Wxnz6tYkzbT6+xADgC40n0z4fGEbsA4w06L0BLpFM6iQTML6
 LcPNEAnyEmdTXKBo1DrcHVHNwa5YutwGBXlN2Updh6yw8JNkofzRaDWrZt9CfpnvCqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924365;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=QRLzTDdOHx7mANRWP+BD9rLSBnU/jwDOSohxKFEhN6myshjCIswvFirlCewhtszD6mgu
 qqMiIzoligfb2Qpb7KJ/wqtwyrqHh5d9eIFN6DSjV8utH2iAG2PEHxLOgAMvz+SMQC077
 c5cYksKlPWSFus6b2E6Q0C++bFSKfSmEUdw/SdY3NpsrZrWmKmlEiCOV3cKIM5Nufl48o
 feyR5rbl397bRs6ZuyUbWUCz6Y32Co7o0Bt0IYc3yljcnCrmiMWRglgzQm9ZOrXF6YMpC
 8vGSrh5yb+27SJ+hf1EHvbiW5GV0Le6NBcnLv8cmkLjpKtB35WCskMKm+aPwnWbY0Dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AEFDbB2E; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AEFDbB2E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 546D7605F9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924148;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AEFDbB2EJaN4ROT+YAJ1nYv3B3Ynthuep+pj+0BegHv2vyuwJwRD1oLL/TG1nli0V
 BBt9nlvoFe9VjR73Oqs5NCvJVdx5l7KdO4IXt048qEsB0xsCU4X9E0tgjP7vsXr4WR
 Ll4RS0wl8AJW3urpf89xwaAG1EBVUOHJUE4nFQlX8QgMZsOAAlHwYnlh7HlEtiR8Cg
 dXlHr8JJudNCuRts14o6SEaDpq1v0IW/+H1hRJ+HxfwqzOb42N4Ab9nOj3FeULzAUj
 kKaquttgOCmVVTgPi+xt13bfaQuLqOsTZsXisQDrlvDxOfGRmJ5VYqNy83QDACigW+
 nRKVlr+qq/2vw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:SPINQf8DlX3wD1FIf4LqHIu+JyewPWZw123iT+vO8CCTTB+Ae5OjNfKHezR+EGD+13dcKnB7VfGAuvbK27TqAojLufKBoHzaIdy1/dbsrML04PPgI6tjsz5zx/E9lsGDRjg9KvpHAyFsZ/eTIAv0qFyPv/nSPc0hoakKhmFvYSVa5m4q8fhqEq4dSj39WjHGRjRR86ecIiy/6SBZNkcWtHCzAWrS9jS3N/hRE9iayyBx6XX/0b81I1GKMcA1vFGBqTHwS+jIqfA6bd0/CkACIiDwV80dRfYBwhurraT9hqIpCDq/j7Y4xk76TkWy6MknV5jtLewJs9Pg+bus/c7z7nZx7BYazgwjK5TDWZdzHMuXDvuTwx1CbHnZVjVXoBd2P3Yvgtq4w6E4n5qUCYuuGj/6YSuwPr1pNHL07PC/sQM76QzDb1ZVUwcf3Z/4xDDQxiz7xW96ulYYziricSKlfv4lgSI0uy37GuOF9cQnqreQRqbaBfxDttaPmKHyvw28msNDLk1ptAj50GR3/q4igS6XjLDgyLh5EcqvW5yaE5vEhO+KiY5bB2JLn6sLSVgoTouVe6zW0K3zUEvLdRcGIDeLIR3FIQy2JY/w04j6sap5rk
 gFbIsu9GRj+eUlmDeYNQ205pRc/GVZvIPKVXAdSBiRzpGdob2OaJwVHPcePrpvZNXvZMbK87usjZXDkVo/Q26bbD7+YnQTgXgULZvAR/VBAQV5Px4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 670E0A4C487A;
 Sun, 20 Sep 2026 19:09:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1X-000000000o7-06D0;
 Sun, 20 Sep 2026 17:08:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:17 +0200
Message-ID: <20260920170815.240247-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 10/67] package/libp11: bump version to 0.4.20
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

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
