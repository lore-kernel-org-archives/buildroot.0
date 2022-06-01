Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D804DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A473409D5;
	Wed,  1 Jun 2022 19:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJzfB38n0aYF; Wed,  1 Jun 2022 19:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84960405BB;
	Wed,  1 Jun 2022 19:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EDB11BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7B4405BB
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3otiZnhxkJN for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5685040179
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA9B8868C9; Wed,  1 Jun 2022 19:41:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 21:34:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4141e017e199b4da088c33ce1f301d160ad23ed2
X-Git-Newrev: dd018f78de99ea78633694dba011f155849dde32
X-Patchwork-Hint: ignore
Message-Id: <20220601194145.EA9B8868C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8723ds: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd018f78de99ea78633694dba011f155849dde32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package adds a driver for Realtek RTL8723DS wifi chip.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/rtl8723ds/Config.in    | 10 ++++++++++
 package/rtl8723ds/rtl8723ds.mk | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 096ca94f4e..fe840f33f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -181,6 +181,7 @@ F:	package/python-web2py/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
+F:	package/rtl8723ds/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/Config.in b/package/Config.in
index 8892134133..4ab61713e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -566,6 +566,7 @@ endmenu
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
+	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
new file mode 100644
index 0000000000..ef7dd39a68
--- /dev/null
+++ b/package/rtl8723ds/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8723DS
+	bool "rtl8723ds"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8723bs wifi driver
+
+	  https://github.com/lwfinger/rtl8723ds
+
+comment "rtl8723ds needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
new file mode 100644
index 0000000000..da25ffe9a7
--- /dev/null
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8723ds
+#
+################################################################################
+
+RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
+RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_LICENSE = GPL-2.0
+
+RTL8723DS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8723DS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+define RTL8723DS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
