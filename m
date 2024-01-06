Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB55C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2749360E03;
	Sat,  6 Jan 2024 14:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2749360E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEjO3_sZGG2U; Sat,  6 Jan 2024 14:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0B060D71;
	Sat,  6 Jan 2024 14:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0B060D71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408461BF362
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BAC8322E
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BAC8322E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMIUEqEbMs1G for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1753E8318C
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1753E8318C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0256E846D0; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 14:43:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1474f1b34b178defca1d16d18a2446fadda9a12b
X-Git-Newrev: b1dbd3f679e6660325472e3fdca72127d74e6929
X-Patchwork-Hint: ignore
Message-Id: <20240106141132.0256E846D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1dbd3f679e6660325472e3fdca72127d74e6929
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce the libtracefs library, that is used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd and rtla, and is used as an interface to the ftrace
kernel subsystem through tracefs.

To build with meson, this package requires to disable documentation
generation, and since this is not possible add a local patch pending
upstream that adds -Ddoc=false support to libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio:
	- bump version to 1.7.0 and add hash file
	- move to meson build system
]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 ...acefs-add-option-to-disable-documentation.patch | 51 ++++++++++++++++++++++
 package/libtracefs/Config.in                       |  8 ++++
 package/libtracefs/libtracefs.hash                 |  4 ++
 package/libtracefs/libtracefs.mk                   | 18 ++++++++
 6 files changed, 84 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4461216122..86588b1adb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1236,6 +1236,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
+F:	package/libtracefs
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mongoose/
@@ -2134,6 +2135,7 @@ F:	package/timescaledb/
 
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
+F:	package/libtracefs
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/Config.in b/package/Config.in
index a6d76c4b3d..f5d0c06334 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
 	source "package/libtraceevent/Config.in"
+	source "package/libtracefs/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
new file mode 100644
index 0000000000..70e7e61310
--- /dev/null
+++ b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
@@ -0,0 +1,51 @@
+From 881e23ed774360f93ca81f820d7897bd9bbd6d63 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 30 Sep 2023 22:40:08 +0200
+Subject: [PATCH] libtracefs: add option to disable documentation
+
+On some Linux environment builder(i.e. Buildroot) host asciidoc is not
+provided since by default all man/docs are not installed to target but
+meson.build at the moment build ascii and html documentation and
+requires asciidoc making the building to fail. So let's add doc option
+set to true by default to let the user to override it and not produce
+the documentation.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204008.2528607-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 3 +++
+ meson_options.txt | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 9d42d78..f1e492e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -39,6 +39,8 @@ if cunit_dep.found()
+     subdir('utest')
+ endif
+ subdir('samples')
++
++if get_option('doc')
+ subdir('Documentation')
+
+ custom_target(
+@@ -46,3 +48,4 @@ custom_target(
+     output: 'docs',
+     depends: [html, man],
+     command: ['echo'])
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 1d92c28..5533a88 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -14,3 +14,5 @@ option('man-bold-literal', type : 'boolean', value : false,
+        description : 'enable bold literals')
+ option('docbook-suppress-sp', type : 'boolean', value : false,
+        description : 'docbook suppress sp')
++option('doc', type : 'boolean', value: true,
++       description : 'produce documentation')
+--
+2.34.1
+
diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
new file mode 100644
index 0000000000..81a2e962ea
--- /dev/null
+++ b/package/libtracefs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBTRACEFS
+	bool "libtracefs"
+	select BR2_PACKAGE_LIBTRACEEVENT
+	help
+	  libtracefs is used to easily interface with the ftrace
+	  interface through the tracefs virtual filesystem.
+
+	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
new file mode 100644
index 0000000000..676fcf1111
--- /dev/null
+++ b/package/libtracefs/libtracefs.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
new file mode 100644
index 0000000000..1e6e19a234
--- /dev/null
+++ b/package/libtracefs/libtracefs.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libtracefs
+#
+################################################################################
+
+LIBTRACEFS_VERSION = 1.7.0
+LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
+LIBTRACEFS_INSTALL_STAGING = YES
+LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
+
+LIBTRACEFS_CONF_OPTS = \
+	-Ddoc=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
