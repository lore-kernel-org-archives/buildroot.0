Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88434C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4212D60F03;
	Sun, 14 Jan 2024 08:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4212D60F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61d69kooCNKf; Sun, 14 Jan 2024 08:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3760EED;
	Sun, 14 Jan 2024 08:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB3760EED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55F391BF578
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D35983542
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D35983542
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dPAXO2AZqvI for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DAD48356E
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DAD48356E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DB09860F8; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 09:45:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 279d3dca35171aacff62ece7ddf71c43bd969785
X-Git-Newrev: a14221b76b963f14703861e6b4ff2d9d3065ecea
X-Patchwork-Hint: ignore
Message-Id: <20240114084701.7DB09860F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for V4L
 cx23885 devices
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a14221b76b963f14703861e6b4ff2d9d3065ecea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0c48a03e49..920c0a2ef1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -631,6 +631,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
 	  Firmware files for Conexant Cx23100/101/102 USB broadcast
 	  A/V decoder needed by the Linux CX231XX driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CX23885
+	bool "Conexant Cx23885/7/8 PCIe broadcast A/V decoder"
+	help
+	  Firmware files for Conexant Cx23885/7/8 PCIe broadcast
+	  A/V decoder needed by the Linux CX23885 driver.
+
 endmenu
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0e05f94cb2..c09dbc523e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -850,6 +850,12 @@ LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX23885),y)
+LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
