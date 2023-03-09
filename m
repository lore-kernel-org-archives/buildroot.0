Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B7C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D535E8224B;
	Thu,  9 Mar 2023 21:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D535E8224B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciOrYvN1aMdJ; Thu,  9 Mar 2023 21:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E433A82255;
	Thu,  9 Mar 2023 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E433A82255
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 774541BF97A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50F1160E8A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F1160E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwljIXELLboc for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517B960E7C
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517B960E7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FBFC86C92; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:45:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b078380384f8ecd74857260d911e267c7a788b3
X-Git-Newrev: 1723771209106d80d9c673c6f8b99bd08c1b0967
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.3FBFC86C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm2_66: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1723771209106d80d9c673c6f8b99bd08c1b0967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the version needed for gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                         |  2 ++
 package/Config.in                  |  1 +
 package/glibmm/Config.in           |  2 +-
 package/glibmm2_66/Config.in       | 21 +++++++++++++++++++++
 package/glibmm2_66/glibmm2_66.hash |  5 +++++
 package/glibmm2_66/glibmm2_66.mk   | 23 +++++++++++++++++++++++
 6 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2786b1c050..32ab852084 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -641,6 +641,8 @@ F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
+F:	package/glibmm/
+F:	package/glibmm2_66/
 F:	package/libsigc/
 F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in b/package/Config.in
index 522a22b76a..0f0980b57b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2037,6 +2037,7 @@ menu "Other"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
+	source "package/glibmm2_66/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gobject-introspection/Config.in"
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index 2dfc861817..b7bed195e9 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_GLIBMM
-	bool "glibmm"
+	bool "glibmm (latest)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/glibmm2_66/Config.in b/package/glibmm2_66/Config.in
new file mode 100644
index 0000000000..628584cae5
--- /dev/null
+++ b/package/glibmm2_66/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_GLIBMM2_66
+	bool "glibmm (2.66.x)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # regex_replace
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC2
+	help
+	  The GLibmm package is a set of C++ bindings for GLib.
+
+	  This is the last version before the API and ABI change
+	  introduced in 2.68.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "glibmm (2.66.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
new file mode 100644
index 0000000000..b7d19b261c
--- /dev/null
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.5.sha256sum
+sha256  7b384662dd6ec3b86c0570331d32af05db2bd99a791602b767b4a0b2566ec149  glibmm-2.66.5.tar.xz
+# License files, locally calculated
+sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
new file mode 100644
index 0000000000..b58c7ca8df
--- /dev/null
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# glibmm2_66
+#
+################################################################################
+
+GLIBMM2_66_VERSION_MAJOR = 2.66
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).5
+GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
+GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
+GLIBMM2_66_SITE = https://download.gnome.org/sources/glibmm/$(GLIBMM2_66_VERSION_MAJOR)
+GLIBMM2_66_INSTALL_STAGING = YES
+GLIBMM2_66_DEPENDENCIES = libglib2 libsigc2 host-pkgconf
+GLIBMM2_66_CONF_OPTS = -Dbuild-examples=false
+
+GLIBMM2_66_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GLIBMM2_66_CXXFLAGS += -O0
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
