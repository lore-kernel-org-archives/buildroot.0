Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61608599D;
	Fri, 28 Feb 2025 17:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTfSDp3eocJf; Fri, 28 Feb 2025 17:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04AF85F78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04AF85F78;
	Fri, 28 Feb 2025 17:23:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CFB68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FE64838E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tcsmdj0zPs2 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04694485AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04694485AB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F329B8017D; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Feb 2025 19:16:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 544249ff7761db2df61783c8731e834574df957a
X-Git-Newrev: 63f047971f994a92a89c94aa4c96e33afcad9592
X-Patchwork-Hint: ignore
Message-Id: <20250228163047.F329B8017D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wlr-randr: new package
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
Content-Type: multipart/mixed; boundary="===============4826160513309713942=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4826160513309713942==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=63f047971f994a92a89c94aa4c96e33afcad9592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Utility to manage outputs of a Wayland compositor.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Fiona:
  - fix build with uClibc
  - update to 0.5.0 with move to gitlab.freedesktop.org
]
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: reorder DEVELOPERS entries alphabetically]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/wlr-randr/Config.in      |  7 +++++++
 package/wlr-randr/wlr-randr.hash |  5 +++++
 package/wlr-randr/wlr-randr.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61b531f424..c07837e431 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2960,6 +2960,7 @@ F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
 F:	package/qt5/qt5charts/
+F:	package/wlr-randr/
 
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
diff --git a/package/Config.in b/package/Config.in
index bd3a00abc3..4a81a62ec4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2791,6 +2791,7 @@ comment "Utilities"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
 	source "package/which/Config.in"
+	source "package/wlr-randr/Config.in"
 	source "package/wtfutil/Config.in"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
diff --git a/package/wlr-randr/Config.in b/package/wlr-randr/Config.in
new file mode 100644
index 0000000000..fa3565560b
--- /dev/null
+++ b/package/wlr-randr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WLR_RANDR
+	bool "wlr-randr"
+	depends on BR2_PACKAGE_WAYLAND # wayland-client
+	help
+	  Utility to manage outputs of a Wayland compositor.
+
+	  https://gitlab.freedesktop.org/emersion/wlr-randr
diff --git a/package/wlr-randr/wlr-randr.hash b/package/wlr-randr/wlr-randr.hash
new file mode 100644
index 0000000000..a8b5dfc955
--- /dev/null
+++ b/package/wlr-randr/wlr-randr.hash
@@ -0,0 +1,5 @@
+# Calculated locally
+sha256  a64b6eb296d1c75af098fa2d229f9aaf3ceae45eeff24056930bd4bc613c6a5e  wlr-randr-0.5.0.tar.gz
+
+# Hash for license files:
+sha256  7f3e844a550da74d5f0a635ae1263cb7dafda7bd15ac37364ddde85de83a78c7  LICENSE
diff --git a/package/wlr-randr/wlr-randr.mk b/package/wlr-randr/wlr-randr.mk
new file mode 100644
index 0000000000..c5264deae7
--- /dev/null
+++ b/package/wlr-randr/wlr-randr.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# wlr-randr
+#
+################################################################################
+
+WLR_RANDR_VERSION = 0.5.0
+WLR_RANDR_SITE = https://gitlab.freedesktop.org/emersion/wlr-randr/-/releases/v$(WLR_RANDR_VERSION)/downloads
+WLR_RANDR_LICENSE = MIT
+WLR_RANDR_LICENSE_FILES = LICENSE
+# host-wayland is for wayland-scanner
+WLR_RANDR_DEPENDENCIES = host-pkgconf host-wayland wayland
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# uClibc < 1.0.38 does not expose strdup() when _POSIX_C_SOURCE >= 200809L
+# See: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=0daab1508379e23a09ab7fdb469018228d951894
+# We define _XOPEN_SOURCE=500 as a workaround.
+WLR_RANDR_CONF_OPTS += -Dc_args=-D_XOPEN_SOURCE=500
+endif
+
+$(eval $(meson-package))

--===============4826160513309713942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4826160513309713942==--
