Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BAAC3600B
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADC3606F7;
	Tue, 25 Mar 2025 18:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 186dHhER-bfC; Tue, 25 Mar 2025 18:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4265860723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4265860723;
	Tue, 25 Mar 2025 18:28:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC35AC0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C256D403EB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vu6S68BAJoDV for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060BB40399
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060BB40399
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E853982BC8; Tue, 25 Mar 2025 18:28:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 19:27:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64b7774fc5c3e74616d41848991be633a31587a0
X-Git-Newrev: 2ac8b4f2f2614623f88194644dc2f16a07caf7f1
X-Patchwork-Hint: ignore
Message-Id: <20250325182829.E853982BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Intel Xe firmware
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ac8b4f2f2614623f88194644dc2f16a07caf7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install the firmware files used by the xe driver.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
[Julien: add LICENSE.xe license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index af36b8a6b1..2daeeb53b4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	help
 	  Firmware files for the Intel i915 video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_XE
+	bool "Intel Xe video card firmware"
+	help
+	  Firmware files for the Intel Xe video cards.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	bool "AMD Radeon video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 29a191d335..637b06be92 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -43,3 +43,4 @@ sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENS
 sha256  93d681cbd8ef106f2c9470aa835aa4176bfb7010ba168e6b467db6a5b4dee024  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
+sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fac5733ad4..e9c20339e1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XE),y)
+LINUX_FIRMWARE_DIRS += xe
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.xe
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
