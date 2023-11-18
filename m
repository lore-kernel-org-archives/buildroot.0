Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C6AC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F9D9400EC;
	Sat, 18 Nov 2023 15:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F9D9400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mJSw57GkG7Q; Sat, 18 Nov 2023 15:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45E394044B;
	Sat, 18 Nov 2023 15:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E394044B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D922E1BF593
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFC1D4044B
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFC1D4044B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sepVXFd0jjkq for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:00:58 +0000 (UTC)
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 963AE400EC
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 963AE400EC
Received: from localhost.localdomain ([120.245.20.22])
 by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
 id DA9938CB; Sat, 18 Nov 2023 22:54:41 +0800
X-QQ-mid: xmsmtpt1700319281tpz9l3ug1
Message-ID: <tencent_757F73E3FFB48495C31F20C1B8F0CBDBD205@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntuj7PEgvq3EKgSTBsamB6/YkFIVvRak2u3e+KR82S/QRiPgyaI23O
 T59Ukf0sjftgdiLWZlNs9T6xoVJMe3PCUssi/ZvRdzXRtgbT4hARrz1oMAETTQnKCX610FZ4EaNE
 ULEMypP9TtLtrqGgr0Ut1K4ja2Uhg44JlyN332/NwF1jLLuId7YvytaxzuEGfGHBUgwYNHnxRs4G
 E3G83PeKf5j+erLJvSeB3q2n69K5hktWB+RF7DnoMc+/yGfpZGm7JCXxXVKBIrX3AGkKuzqq1soO
 hWR0bFk+x/6vV49Tq6Fu7LCaVxzKxqMS1H6NJt+ViWL+zTstuwWCAvW0HuaVd1jWXks9Kvn5zb5t
 2wbdM0X6LfZx5pUm9/9B4HFYbJh/4vtLfu8aeRwkmKvyeA0sFonOnMxZX/U4HWSJ320bIToakRO9
 psZMAP8hcBvfRNGvfIB6GHDJBQAsoMk9El+bXzSQv/VGvhYpZeI1opgX4ajf0K8WAJFFXAb1P6+2
 Ay0r87wkdtAajwrVKW8Y2LwAbrziBA1SEyTKBgzNk36o9VC2QNnsIEgDp+SIFtv1msJ6pldx1aXH
 ksBNN8G5EYusS+AxmS+xq+UVjJENydLHTZ0zFWu4He5vtR82shi89qrLFpM2hXNSH7hQDdmq6YNZ
 fpSGzawj/y617GqpPs6oKpyUWE5YFr8YMYUFCFMznAOyHY/0tloAsQjCKW6Swse0VLQL43Blz6tm
 58rni/9HArCFaY1excQ4drkuP/Iek+WUPyVv106KaCblXnHcfjA0KMtyjrE29x32XyrxMc8fp0+f
 e48u2bpIUb7GZdp8bc8Aeouc3PxoQ+lwLaFeqHtnkoAcrBZMoiVRBHQq02A8yslx2AhoV/XDUzpp
 w12wJpz5rKLyF9XgvhEkGvtVQWmoWMsUEC/Ujuh8K00vuALi40jxbbpZ9oUZIePPfu7uiYj4n6s0
 HcE/TKVf1E1dB0Ups027ePJeYHeOzNbFkFDZjFRodCW/GpH3husElv+7PUDG2og21T/7MlBDRMj9
 Qk5Kcz2x/mVIQclMGk7d2GCvkvwxGErPCWTQUIWWDim/o3JUj4DAHHnDv52TQmSV08eMAVKX5iZJ
 3lUCW/
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 22:53:55 +0800
X-OQ-MSGID: <20231118145354.30465-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700319648; bh=Nww3iJjKfxAtS9FISPbICfTaulExpqmR1RZA71P4KlM=;
 h=From:To:Cc:Subject:Date;
 b=AmttanCgDEUedLRH5zVOO7au3PDjbp1TVtpXAuIENv4MPJgjNTS1VgVaaFsDQTCoX
 aMkcOsBGxHSLD9DPB90vSRsr91Cnzm4mIMQ5nY+kes8t7hQxXrX6R88kCiv+Y4NnHZ
 3Q3ZKuCaiLFArYpARXF1q4A/yVHyAj4Gw8tBh9tM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=AmttanCg
Subject: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO library
 wiringX
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Hanyuan Zhao <hanyuan-z@qq.com>
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
index 9c037f2ef4..b46bb4654e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,6 +654,7 @@ endmenu
 	source "package/wf111/Config.in"
 	source "package/wilc-driver/Config.in"
 	source "package/wipe/Config.in"
+	source "package/wiringx/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
 endmenu
diff --git a/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch b/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
new file mode 100644
index 0000000000..fe0fd56f82
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
index 0000000000..04b944b217
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
2.39.3 (Apple Git-145)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
