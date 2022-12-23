Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817FCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E1E840C1A;
	Fri, 23 Dec 2022 09:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E1E840C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcW8Hm_p0x9T; Fri, 23 Dec 2022 09:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F0EF40C22;
	Fri, 23 Dec 2022 09:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F0EF40C22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3381BF973
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676F961136
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 676F961136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNaoKRCIubE3 for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8669661132
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8669661132
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7266286DD2; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:27:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1381a4d2884cd7abdda45253b871cddd995a3e4b
X-Git-Newrev: 183de9155b138497783717383418544da00e0da7
X-Patchwork-Hint: ignore
Message-Id: <20221223093614.7266286DD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=183de9155b138497783717383418544da00e0da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for USB rtl8821cu wifi cards.

Similar to rtl8821au and rtl8812au-aircrack-ng packages.

https://github.com/morrownr/8821cu-20210118

Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8821cu/Config.in      | 10 ++++++++++
 package/rtl8821cu/rtl8821cu.hash |  3 +++
 package/rtl8821cu/rtl8821cu.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a200edb7f5..5eed4a8455 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -564,6 +564,7 @@ F:	package/mosh/
 F:	package/nerdctl/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
+F:	package/rtl8821cu/
 F:	package/runc/
 F:	package/tini/
 F:	support/testing/tests/package/test_docker_compose.py
diff --git a/package/Config.in b/package/Config.in
index 999feae08a..0c77f7c022 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,6 +588,7 @@ endmenu
 	source "package/rtl8723ds-bt/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8821cu/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
new file mode 100644
index 0000000000..a5a7b9d255
--- /dev/null
+++ b/package/rtl8821cu/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8821cu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8821CU
+	bool "rtl8821cu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8821cu wifi driver
+
+	  https://github.com/brektrou/rtl8821CU
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
new file mode 100644
index 0000000000..efb9871472
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
+sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
new file mode 100644
index 0000000000..18222e0014
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# rtl8821cu
+#
+################################################################################
+
+RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_LICENSE = GPL-2.0
+RTL8821CU_LICENSE_FILES = LICENSE
+
+RTL8821CU_USER_EXTRA_CFLAGS = \
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-DCONFIG_IOCTL_CFG80211 \
+	-DRTW_USE_CFG80211_STA_EVENT \
+	-Wno-error
+
+RTL8821CU_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_GENERIC=n \
+	CONFIG_RTL8821CU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
