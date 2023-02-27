Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82003C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07760402C2;
	Mon, 27 Feb 2023 21:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07760402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJLVA1OJQkXi; Mon, 27 Feb 2023 21:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0093C402C8;
	Mon, 27 Feb 2023 21:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0093C402C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9871BF28C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7CA881430
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7CA881430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEfJ8jK_SlkB for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:08:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FED181432
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FED181432
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:08:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.73]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1oTogU2oHN-013PBL
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 22:08:23 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 22:08:23 +0100
Message-Id: <20230227210823.10437-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:0IEqrJwuAXE0grHDKfZzzK7HdnQD/Yd7lYOKIv2egphzxEGetfw
 2sfM6jL9ovxLRF5hhaD9edoNRfeScd069PccscB93MjwhVAFwI03vcxp3KHoGr/HOuw/xfr
 XQoEbhZF90NMVhwHVLZ7G1QRRpvR9W+d4cItARkEPr1AumEkT30CA6GxK0Og6lws9O5EU1S
 cmwf2OLCSwf50Fn+ienYA==
UI-OutboundReport: notjunk:1;M01:P0:ABsb3VyQ9n4=;4KttF1cdg+cj3j/lN7gBEXIf8vJ
 rxIFy8d8gjKnzIdsCYO71Sq8t5wao7pFOgZ6X/4zpbttmYC4poq8ILj+/2U/Q6HebZjMIJFuB
 cQcz4EYP/y6A7xeKtisyqdWg1np700NfpZoGaM8dBpxu8YVdUfv4pinT/qiHd9sQTyO8EOaH+
 xVa1svymqhAiPZFlYtawS6VcQKx49FVL2egOGDEs1JXz95PrWZxkklME30jKjuFlVC7PHwm3I
 36AXZw4in2QyZBKSa4V7RURdYHPtUXggH8xopmflo6D27mByyZe44SJv45QWY+YuPkcH/Wbm6
 usnpUabd1DRNNA8cbxtIGFZNhwa0spN/MQONMMPUBfevIYaGK9qIHLEde3xk/9lgafNaJdqCI
 DlTGlS9mUe/0iVGz7mgL4y0SaQYaJqvlJytc+IrGVbckN4l2fTdy1R/KfdlKw/am3zfdcrpN3
 p/vwD8YrvLiv7mkN6YkFDN2zcbPEeKSAzqb4Fv1Z1t2kjlLa+caVIJqo7g8B3t3Yojd3wFFrE
 ArNwatFcvhpMKw3vo8g4JXJhjgnyXw00nY5R+C1fiMzftI1kydu+Q/HZrdAvpFjGw2sp8Qs1X
 8wUzEYO0JSnVrB4dL75EB9GmUIPnA4QGOeHArLpXgON40cPf6xHSngXKfiri0YEHs7dSKircw
 NaQelb1pMVPoDV+OAYkYdxqjvlDG+EQ0C2hIwDTQDCDavS5/31yE0yGmmfol8MRbTpY2zKWlA
 YO1R2Yy9zm5o33IlVtUeldbwH1NVEBcnNhYq4/PLJ0993aFYYCxfLsjeusu6JoJOC2P0TqiyE
 A0Qje9xXv2wK4mAsyepBdve2M4kkcMbXOqD8oqM1SZsX5vMki/RLo/F9YFpDGNRuIVGtNhhLg
 84JKLU8FbXX/dhgkY50DcTN4kxOUF33tiDA5/t1q5Pi+84XPNDNgzOrMd99+KtnNwTQ93/B7r
 OeZBXsV4rwCKGZWwYAoaEcQWZCM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677532103; i=ps.report@gmx.net;
 bh=MXVIEsZCZ2ZwcOPNbnC67rMhFI1usr4JfhVjk/fReic=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=kvxUmy1gJ1omu3LUPrze18LHwh7WUt7wXs7K6ceRrXL0kvQtMqhdqv2sOEoV51ub8
 d2HCfuZSuMGNn1qH+GIgoln6Y7RjTTygspEpns65RsLLdIc42nhL0bfsH2dtdZ446L
 MMicrB9bxGyVSWb6K1kVRP4kx6+NHy/hEIB/r5TqTKJaDmwjIhrAJ4YSK/1yLSIIke
 8krfCprWAz8khaOYfGQ5qYAh0KilxEPaPAiTi/hHBBs/b8l02BMoENgJGtoK+AiRnR
 FLdX+fpiEkoiGIIrrZwOrnUSaLzJkJwy1JaAhnAT8d8mC5JmrLAQCrmht4X/gnvltO
 rnGpwIq/1cxEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kvxUmy1g
Subject: [Buildroot] [PATCH v1] package/speechd: fix gettext version mismatch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
  BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
  SPEECHD_GETTEXTIZE

Fixes:

  -  http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992537f92d3

  Making all in po
  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.19 but the autoconf macros are from gettext version 0.20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index dee94a6752..ec62980986 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
 SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
+SPEECHD_GETTEXTIZE = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
 SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
 SPEECHD_CONF_OPTS = --without-kali
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
