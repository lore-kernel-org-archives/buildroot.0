Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE00D5E37F
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828E8606C7;
	Sat,  9 Nov 2024 20:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_6Wk9KbVaaB; Sat,  9 Nov 2024 20:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A01606C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A01606C9;
	Sat,  9 Nov 2024 20:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 378D3D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 318714066D
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HkDu4D7bF1s for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 20:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1582E405E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1582E405E5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CA1C85F2B; Sat,  9 Nov 2024 20:49:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 21:34:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df7dfb804457a62c7751eec6555ad75158e3e3d
X-Git-Newrev: 805e38c550b87b60fa32e8b97f0bd7abe3d14447
X-Patchwork-Hint: ignore
Message-Id: <20241109204916.0CA1C85F2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/superiotool: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=805e38c550b87b60fa32e8b97f0bd7abe3d14447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/superiotool/Config.in        |  8 ++++++++
 package/superiotool/superiotool.hash |  3 +++
 package/superiotool/superiotool.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d70e46e8d..11a4ccb293 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1522,6 +1522,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/superiotool/
 F:	package/tailscale/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index 15b35fb55d..6a80ecd471 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ endmenu
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali-utgard/Config.in"
 	source "package/sunxi-mali-utgard-driver/Config.in"
+	source "package/superiotool/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/superiotool/Config.in b/package/superiotool/Config.in
new file mode 100644
index 0000000000..e27ac99bf0
--- /dev/null
+++ b/package/superiotool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SUPERIOTOOL
+	bool "superiotool"
+	depends on BR2_x86_64 || BR2_i386
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  Super I/O detection tool.
+
+	  https://www.coreboot.org/Superiotool
diff --git a/package/superiotool/superiotool.hash b/package/superiotool/superiotool.hash
new file mode 100644
index 0000000000..985e54b2a2
--- /dev/null
+++ b/package/superiotool/superiotool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e22afdbac40068ba687fd975f03f6b958599a32e70f539d9d0c74d16a63d7cea  coreboot-24.05.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  util/superiotool/COPYING
diff --git a/package/superiotool/superiotool.mk b/package/superiotool/superiotool.mk
new file mode 100644
index 0000000000..a73be1d6e7
--- /dev/null
+++ b/package/superiotool/superiotool.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# superiotool
+#
+################################################################################
+
+SUPERIOTOOL_VERSION = 24.05
+SUPERIOTOOL_SOURCE = coreboot-$(SUPERIOTOOL_VERSION).tar.xz
+SUPERIOTOOL_SITE = https://coreboot.org/releases
+SUPERIOTOOL_SUBDIR = util/superiotool
+SUPERIOTOOL_LICENSE = GPL-2.0+
+SUPERIOTOOL_LICENSE_FILES = util/superiotool/COPYING
+SUPERIOTOOL_DEPENDENCIES = pciutils
+
+SUPERIOTOOL_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-I$(@D)/src/commonlib/bsd/include \
+	-DPCI_SUPPORT \
+	-DSUPERIOTOOL_VERSION=\\\"$(SUPERIOTOOL_VERSION)\\\"
+
+SUPERIOTOOL_CONFIGURE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(SUPERIOTOOL_CFLAGS)"
+
+define SUPERIOTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
+		-C $(@D)/$(SUPERIOTOOL_SUBDIR) superiotool
+endef
+
+define SUPERIOTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SUPERIOTOOL_CONFIGURE_OPTS) \
+		-C $(@D)/$(SUPERIOTOOL_SUBDIR) install \
+		PREFIX=/usr DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
