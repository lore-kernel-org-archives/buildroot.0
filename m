Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A4C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82B72610C4;
	Wed,  8 Feb 2023 11:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82B72610C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRDgpDrWb1CI; Wed,  8 Feb 2023 11:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B9F610EA;
	Wed,  8 Feb 2023 11:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B9F610EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3747E1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EE7D610DA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE7D610DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJU8RUUlRikR for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:17:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A75A9610E3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75A9610E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 869F384609; Wed,  8 Feb 2023 11:17:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 12:13:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c419ef62d84b5be65599452ab84f7ed719bbe470
X-Git-Newrev: cbd06adac50e304f413689febf676911ae29d967
X-Patchwork-Hint: ignore
Message-Id: <20230208111700.869F384609@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstd: bump to version
 0.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbd06adac50e304f413689febf676911ae29d967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are now upstream.

Add new libedit dependency.

License hash changed due to LGPL-2.1+ relicense:
https://github.com/RidgeRun/gstd-1.x/commit/2cb6bb8b6c3bba24098a83557c5fa58a8a15ff58
https://github.com/RidgeRun/gstd-1.x/commit/76d9fb61a05973b30220fcae5ff87de9d618ea49

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: add BSD-3-Clause license change commit for clarity]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-gstd-check-user-xenv.sh-for-systemd-se.patch} |  0
 .../gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch | 27 --------
 ...ve-meson-python-module-for-python-install.patch | 78 ----------------------
 .../0004-meson.build-add-missing-init-subdir.patch | 28 --------
 ...uild-use-dependency-function-for-readline.patch | 51 --------------
 package/gstreamer1/gstd/Config.in                  |  5 +-
 package/gstreamer1/gstd/gstd.hash                  |  4 +-
 package/gstreamer1/gstd/gstd.mk                    |  5 +-
 8 files changed, 8 insertions(+), 190 deletions(-)

diff --git a/package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch b/package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
similarity index 100%
rename from package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
rename to package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
diff --git a/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch b/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
deleted file mode 100644
index 79a65ffbdc..0000000000
--- a/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f1c953b9077619a83ab21c24dc343c7e21cd220d Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 14 Sep 2021 01:46:25 -0600
-Subject: [PATCH] Fix gstd_chmod.sh DESTDIR path.
-
-This should fix the chmod path when cross compiling.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/RidgeRun/gstd-1.x/pull/247]
----
- gstd/gstd_chmod.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gstd/gstd_chmod.sh b/gstd/gstd_chmod.sh
-index 8e58bce..fa7fa80 100755
---- a/gstd/gstd_chmod.sh
-+++ b/gstd/gstd_chmod.sh
-@@ -3,4 +3,4 @@
- # $1 mode
- # $2 file
- 
--chmod $1 $2
-+chmod $1 ${DESTDIR}/$2
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch b/package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
deleted file mode 100644
index a27d79a0e9..0000000000
--- a/package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 1067f6138e947d18fd835e4a39f229ae2293f864 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 14 Sep 2021 23:37:03 -0600
-Subject: [PATCH] Use native meson python module for python install.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/253]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- libgstc/meson.build        |  4 +++-
- libgstc/python/meson.build | 26 +++++++++++++++++++++++++-
- meson_options.txt          |  2 ++
- 3 files changed, 30 insertions(+), 2 deletions(-)
-
-diff --git a/libgstc/meson.build b/libgstc/meson.build
-index e94dcd1..582cbb8 100644
---- a/libgstc/meson.build
-+++ b/libgstc/meson.build
-@@ -1,2 +1,4 @@
- subdir('c')
--subdir('python')
-+if not get_option('enable-python').disabled()
-+  subdir('python')
-+endif
-diff --git a/libgstc/python/meson.build b/libgstc/python/meson.build
-index 057114b..24e3242 100644
---- a/libgstc/python/meson.build
-+++ b/libgstc/python/meson.build
-@@ -1 +1,25 @@
--run_command('pip3', 'install', '.')
-+pymod = import('python')
-+python = pymod.find_installation(
-+  get_option('with-python-version'),
-+  required : get_option('enable-python').enabled(),
-+  disabler : true
-+)
-+
-+pythonver = python.language_version()
-+if pythonver.version_compare('<3.7')
-+  error('Python @0@ is not supported anymore, please port your code to python3.7 or newer.'.format(python.language_version()))
-+endif
-+
-+pygstc_src_files = [
-+  'pygstc/__init__.py',
-+  'pygstc/gstc.py',
-+  'pygstc/gstcerror.py',
-+  'pygstc/logger.py',
-+  'pygstc/tcp.py'
-+]
-+
-+python.install_sources(
-+  pygstc_src_files,
-+  subdir : 'pygstc',
-+  pure : true
-+)
-diff --git a/meson_options.txt b/meson_options.txt
-index f50e540..25292e6 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -4,6 +4,7 @@ option('enable-examples', type : 'feature', value : 'auto', yield : true, descri
- option('enable-gtk-doc', type : 'boolean', value : false, description : 'Use gtk-doc to build documentation')
- option('enable-systemd', type : 'feature', value : 'auto', description : 'Enable systemd gstd.service install')
- option('enable-initd', type : 'feature', value : 'disabled', description : 'Enable init script install')
-+option('enable-python', type : 'feature', value : 'auto', description : 'Install the pygstc library')
- 
- # String options
- option('with-gstd-runstatedir', type : 'string', value : '${prefix}/var/run/gstd', description : 'Specify the location of the gstd\'s PID file')
-@@ -11,6 +12,7 @@ option('with-gstd-logstatedir', type : 'string', value : '${prefix}/var/log/gstd
- option('with-gstd-systemddir', type : 'string', value : 'Systemd default systemduserunitdir', description : 'Specify the location of gstd.service file')
- option('with-gstd-initddir', type : 'string', value : '${sysconfdir}/init.d', description : 'Specify the location of gstd init script')
- option('with-statedir-owner', type : 'string', value : 'root', description : 'Specify the owner of gstd\'s run and log dirs created by the initd script')
-+option('with-python-version', type : 'string', value : 'python3', description : 'Specify the python version for pygstc installation')
- 
- # Common options
- option('package-name', type : 'string', yield : true,
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
deleted file mode 100644
index ed3738e3d4..0000000000
--- a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 689265cd522c770ad3e0391cae80ee884a8c475c Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 21 Apr 2022 01:14:52 -0500
-Subject: [PATCH] meson.build: add missing init subdir
-
-Seems this got accidentially removed in:
-9f4490138c8892b1c86008134438b2ab405c9b0f
-
-Restore it so that init files are properly installed.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/291]
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index a30f776..7a8690a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -300,3 +300,4 @@ subdir('gst_client')
- subdir('tests')
- subdir('examples')
- subdir('docs')
-+subdir('init')
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch b/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch
deleted file mode 100644
index 51422e56d6..0000000000
--- a/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3ef45c41105e61efe84c9be3a9a22988dfe10db8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 22 Oct 2021 07:33:04 +0200
-Subject: [PATCH] meson.build: use dependency function for readline
-
-Use meson dependency function to find readline instead of
-cc.find_library. This function will retrieve readline pkg-config file
-which is available since version 7 (released 5 years ago) and
-https://git.savannah.gnu.org/cgit/readline.git/commit/readline.pc.in?id=d49a9082c0e15bba8cd3d8cc0a994409cf823cac.
-readline.pc sets tinfo in Requires.Private which will avoid the
-following static build failure:
-
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
-display.c:(.text+0xbb5): undefined reference to `tputs'
-
-Fixes:
- - http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/RidgeRun/gstd-1.x/pull/261]
----
- meson.build | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 7a8690a..44ed5c2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -32,8 +32,8 @@ systemd_required = get_option('enable-systemd').enabled()
- systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
- 
- cc = meson.get_compiler('c')
--readline = cc.find_library('readline', required: true)
--if readline.found()
-+readline_dep = dependency('readline')
-+if readline_dep.found()
-   add_project_arguments('-DHAVE_LIBREADLINE', language: 'c')
-   add_project_arguments('-DHAVE_READLINE_HISTORY', language: 'c')
-   # Add arguments to the compiler command line. 
-@@ -48,8 +48,6 @@ if readline.found()
-   else
-     add_project_arguments('-DHAVE_HISTORY_H', language: 'c')
-   endif
--  
--  readline_dep = readline
- endif
- 
- ## Dependencies
--- 
-2.37.1
-
diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
index f36d25f11f..df1d2f59c3 100644
--- a/package/gstreamer1/gstd/Config.in
+++ b/package/gstreamer1/gstd/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_GSTD
 	bool "gstd"
-	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
+	depends on BR2_USE_WCHAR # libglib2 -> gettext, libedit, libsoup
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
-	depends on BR2_USE_MMU # libdaemon, libglib2
+	depends on BR2_USE_MMU # libdaemon, libedit, libglib2
 	select BR2_PACKAGE_GSTREAMER1_GST_DEBUG # gst_debug_bin_to_dot_data
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_READLINE
diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
index 20c821a27f..632f83f8e8 100644
--- a/package/gstreamer1/gstd/gstd.hash
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  56afd58530b63d0d88dd818fd4e6c9230861819b3e131c6a87a46084c3f3fa96  gstd-0.14.0.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  f4a83765d2cf2948c38abc5107ab07d49a01b4101047f188fed7204f1d4e49c7  gstd-0.15.0.tar.gz
+sha256  10162be9f7ddb9e98c22c3edd0f78d62ab88f0ca8b1cc968bd85d5d665489d90  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 817e9143ae..ccb3b3e1bc 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GSTD_VERSION = 0.14.0
+GSTD_VERSION = 0.15.0
 GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
 GSTD_LICENSE_FILES = COPYING
-GSTD_LICENSE = GPL-2.0+
+GSTD_LICENSE = LGPL-2.1+
 
 GSTD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
@@ -15,6 +15,7 @@ GSTD_DEPENDENCIES = \
 	jansson \
 	json-glib \
 	libdaemon \
+	libedit \
 	libglib2 \
 	libsoup \
 	readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
