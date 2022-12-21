Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D50C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B489610D9;
	Wed, 21 Dec 2022 21:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B489610D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSLst8xJKqIK; Wed, 21 Dec 2022 21:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9CC610D6;
	Wed, 21 Dec 2022 21:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9CC610D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9809B1BF2F5
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ECA482056
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ECA482056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bs5suFdmdC5b for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 21:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492DA82026
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 492DA82026
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 21:16:48 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout01.t-online.de (Postfix) with SMTP id 8AD371BF3E
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 22:16:45 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p86SC-0kCUT30; Wed, 21 Dec 2022 22:16:44 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36854)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p86SC-0007sQ-0Y
 for buildroot@buildroot.org; Wed, 21 Dec 2022 22:16:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 22:16:44 +0100
Message-Id: <20221221211644.2760390-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671657404-2F7FF535-FF5C4A03/0/0 CLEAN NORMAL
X-TOI-MSGID: 73fb8975-3026-48a2-9bca-ea15f80ad6b6
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: 5.{4, 10,
 15}.x / 6.{0, 1}.x series
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1bca082cbf..b5c65eded4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c7bbb6be99..8d85dc4c6f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb  linux-6.1.tar.xz
-sha256  08d3118d6b755769f166de6babed54964393a7c0928029bef11bf55559a72da4  linux-6.0.13.tar.xz
+sha256  a3e61377cf4435a9e2966b409a37a1056f6aaa59e561add9125a88e3c0971dfb  linux-6.1.1.tar.xz
+sha256  d484eb3d4f88be14b42507a85ad4b0932e92e7a742acbce74e8be007124a6820  linux-6.0.15.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  40590843c04c85789105157f69efbd71a4efe87ae2568e40d1b7258c3f747ff3  linux-5.15.83.tar.xz
-sha256  1ba9bf57b6bf36d76447d5044b80b746cb5fd61d981c811603dc763b7789cea7  linux-5.10.159.tar.xz
-sha256  5eefc5037415f31c942d3cfa430b96c2a273246cf7e51db1e51b1d89887f0593  linux-5.4.227.tar.xz
+sha256  2c0bae29fac98e0a9408914a4551b2971365ac0000351cb255d6bd9aa0849808  linux-5.15.85.tar.xz
+sha256  7aaaf6d0bcd8a2cfa14ad75f02ca62bb2de08aad3bee3eff198de49ea5254079  linux-5.10.161.tar.xz
+sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  1f6de11306cc9f82fe1d4dd03565cdf43906fa6f77302913d942fd63b77b500c  linux-4.9.336.tar.xz
 sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cd36c7c763..60bbe5b768 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -399,11 +399,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.336"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.227"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.159"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.83"	if BR2_KERNEL_HEADERS_5_15
-	default "6.0.13"	if BR2_KERNEL_HEADERS_6_0
-	default "6.1"		if BR2_KERNEL_HEADERS_6_1
+	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.161"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.85"	if BR2_KERNEL_HEADERS_5_15
+	default "6.0.15"	if BR2_KERNEL_HEADERS_6_0
+	default "6.1.1"		if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
