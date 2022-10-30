Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D53C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D77402B5;
	Sun, 30 Oct 2022 20:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D77402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEVBSXauP2_S; Sun, 30 Oct 2022 20:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3F9402B9;
	Sun, 30 Oct 2022 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3F9402B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB5B31BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979AC60803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979AC60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdDNnmoa_ex5 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA85760670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA85760670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A24F487667; Sun, 30 Oct 2022 20:36:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:36:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146e5a1b218b154f844058e24ccc94a3e341c34e
X-Git-Newrev: ad62fa3acb4faff72385e841af700f09985ce07e
X-Patchwork-Hint: ignore
Message-Id: <20221030203614.A24F487667@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad62fa3acb4faff72385e841af700f09985ce07e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8192eu/Config.in      | 13 +++++++++++++
 package/rtl8192eu/rtl8192eu.hash |  2 ++
 package/rtl8192eu/rtl8192eu.mk   | 23 +++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f82a23b83e..8dbd0e0ebb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1411,6 +1411,7 @@ F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
diff --git a/package/Config.in b/package/Config.in
index d691471877..1f4cfa7cfd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ endmenu
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
+	source "package/rtl8192eu/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
diff --git a/package/rtl8192eu/Config.in b/package/rtl8192eu/Config.in
new file mode 100644
index 0000000000..4d71b711c3
--- /dev/null
+++ b/package/rtl8192eu/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RTL8192EU
+	bool "rtl8192eu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A standalone driver for the RTL8192EU USB Wi-Fi adapter.
+
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
+	  config option enabled.
+
+	  https://github.com/clnhub/rtl8192eu-linux
+
+comment "rtl8192eu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
new file mode 100644
index 0000000000..f616def194
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  75b523ff1cda54d7cd8734a043b2d145231ab81fcc13d3edcd80e00d59201409  rtl8192eu-1e15b6d451731bc4d3ffd587194dc4bd0f286ac0.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
new file mode 100644
index 0000000000..0e8ffea5cb
--- /dev/null
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8192eu
+#
+################################################################################
+
+RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
+RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
+RTL8192EU_LICENSE = GPL-2.0
+RTL8192EU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8192EU=m \
+	USER_EXTRA_CFLAGS="-Wno-error"
+
+define RTL8192EU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
