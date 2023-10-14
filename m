Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D46CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BB960B69;
	Sat, 14 Oct 2023 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43BB960B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiXD5GVjeNl5; Sat, 14 Oct 2023 15:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3896760B2B;
	Sat, 14 Oct 2023 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3896760B2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA58C1BF2A6
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A359560B2B
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 15:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A359560B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkNYJJ2P17rF for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 15:13:02 +0000 (UTC)
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com
 [203.205.221.191])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFF6160B1A
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 15:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF6160B1A
Received: from localhost.localdomain ([101.5.168.179])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 334924E5; Sat, 14 Oct 2023 23:12:52 +0800
X-QQ-mid: xmsmtpt1697296372tucy2ajhx
Message-ID: <tencent_0D8E30000E63F8AF28CBDFCD8FFFBE122007@qq.com>
X-QQ-XMAILINFO: M4rXzlpNAA0NlJSoP4JxCkS/vmcrqVgKjd6eecAkao5OP9frByJdBKusQBxs6s
 U9QnJxpLKB+GVdW9Po6zCKVIFbHIvtvYsrFK1jEAJT0euwuYBp96fVocAADV3h9JCik8uHCQNw+S
 piBtxMmtWm3u5n+fBjgPx+4f+PE55qb5n2PGYpsLq38+9bj4+Svf+7GGMAYJbl5tVErKeQJXdACk
 RwUM3u4xrleJIPyKHfbgwfXSsIF9BQv60nnTcjHYbgWSDdM6fBh42Rc2+vqzGvrZhe8PBrs++4+b
 6jlJCYtksl0tvuRpG773CB+xe8XvQWoOvaBZwJGf5Bb8Er907Cnywz9y+haBn4pBPbDp83KXi7lq
 NYeCqALoOReQI1A5OfL533XTeXrJNKV6+Vjr/L7i34PWOqwlVZDG2FBKI/FIiEw/zsjjtcEfWV2M
 JPdOICQYebLy4ZBDio/iG+Wxl52ljLEpog5M1wfyctOYofl25gYnLUqaEUwa5pob6SttxuMxTrDk
 CfNSXQTEjPzRyL1jqvLEjfJbHPByYrsExPWH769vzRJ3oVACU/gzgDf3NEyC9Dy99slSSlgaZ1Xd
 cSaS+tDdtmrri60TQDJn4FU5bHeQKv0aTI8X0mrSh0gWDaPbfCh6K31RskN5IsS2anPECJHEgwkT
 Sarv5bCcdeWfYIZiSVAUf/4r6vwBeI04DqmtEq1o6eAisLR2+G5hyOKulLG4CjVo2HrjDvV7bnqo
 bR6sXirkpQYoxa+fDZswhmlj9viCVXyWcKdJ84t9552yskZiNWpCgGneTQfY+fZ5QM8LpgMl01TA
 UyiN7VuKxIHbmEmmcuOKvwbJ9Vp2rx1fTSsbmgp2H77rzbRbQbTma3AnzTW0IGnMmrY/txWA1Nzu
 EFUAE+haYBwSdHjXbtC8wJb2QGjqb0Vx2V0u+pZRpV+UqcsdOnW1Rj5r1mmxQhRoE4L2k0LCrMmP
 nrsyW/T8dxA+NgJ8DSQZO4egevSKlcpmjJ4KZxhAGZ9Zlood21EpGH5lI/VR33We3HrJ93uBeyn0
 +tONnEbVZ5376abBOvWIBeAUsH80jo20Sn01kbuA4gjOJwcWyRsHW6ZbfX7RR3fWJQchxd8mZ5fJ
 XNO+O4AB7lgLAkp7gL4nhYEP3kleTU+jt9y3Gk
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 23:11:40 +0800
X-OQ-MSGID: <20231014151140.27313-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1697296374; bh=mAcyMs854dW5pwBX2mQjkt4zeRGSt/ibOdOyp9YihTU=;
 h=From:To:Cc:Subject:Date;
 b=sxyl8/YMe3zoa2GPBZGh08D/NZOlSxFWxmE3qLd51ZOeFAFmj7Oi1wyXVPpGvVGFy
 td00v5m9SFw0jW8VEsL0SV3KsE7gP0eZX3tv1os6X4Hs1IyxqZNdn+AhRB2vSm4BIw
 UXMnuwhQNTTGTGN4Es65n9wBF78M63qYB91BZ1TQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=sxyl8/YM
Subject: [Buildroot] [PATCH 1/1] package/wiringX: add GPIO library wiringX
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
From: Hanyuan Zhao via buildroot <buildroot@buildroot.org>
Reply-To: Hanyuan Zhao <hanyuan-z@qq.com>
Cc: Samuel Martin <s.martin49@gmail.com>, Hanyuan Zhao <hanyuan-z@qq.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wiringX is a cross-platform GPIO interface that allows
developers to control the GPIO of various platforms with
generic and uniform functions. By using wiringX, the same
code will run on all platforms supported by wiringX.

https://github.com/wiringX/wiringX

Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 package/Config.in                             |  1 +
 ...ed-time-type-error-when-compiling-by.patch | 47 +++++++++++++++++++
 package/wiringx/Config.in                     | 18 +++++++
 package/wiringx/wiringx.hash                  |  3 ++
 package/wiringx/wiringx.mk                    | 12 +++++
 5 files changed, 81 insertions(+)
 create mode 100644 package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
 create mode 100644 package/wiringx/Config.in
 create mode 100644 package/wiringx/wiringx.hash
 create mode 100644 package/wiringx/wiringx.mk

diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..b13f91263a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -651,6 +651,7 @@ endmenu
 	source "package/wf111/Config.in"
 	source "package/wilc-driver/Config.in"
 	source "package/wipe/Config.in"
+	source "package/wiringx/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
 endmenu
diff --git a/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch b/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
new file mode 100644
index 0000000000..43f2afc7a3
--- /dev/null
+++ b/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
@@ -0,0 +1,47 @@
+From 3185311331f8fb90ce5dd9376e8b35bff4bb083f Mon Sep 17 00:00:00 2001
+From: Hanyuan Zhao <hanyuan-z@qq.com>
+Date: Sat, 14 Oct 2023 14:46:15 +0800
+Subject: [PATCH] Fix the undeclared time type error when compiling by
+ buildroot
+
+Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
+---
+ src/wiringx.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/wiringx.c b/src/wiringx.c
+index e831caa..b424c5b 100644
+--- a/src/wiringx.c
++++ b/src/wiringx.c
+@@ -119,8 +119,8 @@ static void delayMicrosecondsHard(unsigned int howLong) {
+ 	tLong.tv_sec  = howLong / 1000000;
+ 	tLong.tv_usec = howLong % 1000000;
+ #else
+-	tLong.tv_sec  = (__time_t)howLong / 1000000;
+-	tLong.tv_usec = (__suseconds_t)howLong % 1000000;
++	tLong.tv_sec  = (time_t)howLong / 1000000;
++	tLong.tv_usec = (suseconds_t)howLong % 1000000;
+ #endif
+ 	timeradd(&tNow, &tLong, &tEnd);
+ 
+@@ -135,7 +135,7 @@ EXPORT void delayMicroseconds(unsigned int howLong) {
+ 	long int uSecs = howLong % 1000000;
+ 	unsigned int wSecs = howLong / 1000000;
+ #else
+-	long int uSecs = (__time_t)howLong % 1000000;
++	long int uSecs = (time_t)howLong % 1000000;
+ 	unsigned int wSecs = howLong / 1000000;
+ #endif
+ 
+@@ -147,7 +147,7 @@ EXPORT void delayMicroseconds(unsigned int howLong) {
+ #ifdef _WIN32
+ 		sleeper.tv_sec = wSecs;
+ #else
+-		sleeper.tv_sec = (__time_t)wSecs;	
++		sleeper.tv_sec = (time_t)wSecs;
+ #endif
+ 		sleeper.tv_nsec = (long)(uSecs * 1000L);
+ 		nanosleep(&sleeper, NULL);
+-- 
+2.34.1
+
diff --git a/package/wiringx/Config.in b/package/wiringx/Config.in
new file mode 100644
index 0000000000..9c1e7d168e
--- /dev/null
+++ b/package/wiringx/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_WIRINGX
+	bool "wiringX"
+	help
+	  wiringX is a cross-platform GPIO interface that allows
+	  developers to control the GPIO of various platforms with
+	  generic and uniform functions. By using wiringX, the same
+	  code will run on all platforms supported by wiringX.
+
+	  Supported vendors:
+
+	  allwinner = <a10, a31s, h3, h5>
+	  amlogic = <s805, s905>
+	  broadcom = <bcm2711, bcm2835, bcm2836>
+	  nXP = <imx6dqrm, imx6sdlrm>
+	  rockchip = <rk3399>
+	  samsung = <exynos5422>
+
+	  https://wiringx.org/
diff --git a/package/wiringx/wiringx.hash b/package/wiringx/wiringx.hash
new file mode 100644
index 0000000000..b98e707326
--- /dev/null
+++ b/package/wiringx/wiringx.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  62a0bae8f749ad934f1309cdb9df1dbc79a6ce2abc8c6da11040673564c8fb0b  wiringx-54030cd9b68ef895439e1444f418524e16cbb4c1.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/wiringx/wiringx.mk b/package/wiringx/wiringx.mk
new file mode 100644
index 0000000000..b72046ab60
--- /dev/null
+++ b/package/wiringx/wiringx.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wiringX
+#
+################################################################################
+
+WIRINGX_VERSION = 54030cd9b68ef895439e1444f418524e16cbb4c1
+WIRINGX_SITE = $(call github,wiringX,wiringX,$(WIRINGX_VERSION))
+WIRINGX_LICENSE = MPL-2.0
+WIRINGX_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
