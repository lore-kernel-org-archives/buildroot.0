Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A42DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:55:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA3161205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACA3161205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E52404A5;
	Sun, 19 Sep 2021 07:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5e9UBydiGMO; Sun, 19 Sep 2021 07:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8BF404A7;
	Sun, 19 Sep 2021 07:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7F11BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F3B88375B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCxgAL1eosOG for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D33F83709
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:55:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1FCB08B72C; Sun, 19 Sep 2021 07:53:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 09:54:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ccb46b1fe31203d5be29780b4dc1d3f4e336494
X-Git-Newrev: 02ea01ea22e94ef353a638bf16f62f6e3ed1208e
X-Patchwork-Hint: ignore
Message-Id: <20210919075314.1FCB08B72C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstd: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02ea01ea22e94ef353a638bf16f62f6e3ed1208e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport a few upstream still-pending PRs, to fix
cross-compilation, out-of-tree installation, and to relax requirements
on some tools.

The python support PR is backported too, but because python support was
not tested, it is forcibly disabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - expand commit log with explanations
  - backport upstream 253 (python) too
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/Config.in                       |  1 +
 .../gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch | 27 ++++++++
 ...re-gstreamer-check-1.0-unless-tests-are-e.patch | 33 +++++++++
 ...-relative-symlink-for-gstd-gst-client-exe.patch | 38 +++++++++++
 ...re-gstd-check-user-xenv.sh-for-systemd-se.patch | 34 ++++++++++
 ...ve-meson-python-module-for-python-install.patch | 78 ++++++++++++++++++++++
 package/gstreamer1/gstd/Config.in                  | 17 +++++
 package/gstreamer1/gstd/gstd.hash                  |  3 +
 package/gstreamer1/gstd/gstd.mk                    | 38 +++++++++++
 9 files changed, 269 insertions(+)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 4a8111333e..a2a15397e9 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -17,5 +17,6 @@ source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+source "package/gstreamer1/gstd/Config.in"
 source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch b/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
new file mode 100644
index 0000000000..79a65ffbdc
--- /dev/null
+++ b/package/gstreamer1/gstd/0001-Fix-gstd_chmod.sh-DESTDIR-path.patch
@@ -0,0 +1,27 @@
+From f1c953b9077619a83ab21c24dc343c7e21cd220d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 01:46:25 -0600
+Subject: [PATCH] Fix gstd_chmod.sh DESTDIR path.
+
+This should fix the chmod path when cross compiling.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/247]
+---
+ gstd/gstd_chmod.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gstd/gstd_chmod.sh b/gstd/gstd_chmod.sh
+index 8e58bce..fa7fa80 100755
+--- a/gstd/gstd_chmod.sh
++++ b/gstd/gstd_chmod.sh
+@@ -3,4 +3,4 @@
+ # $1 mode
+ # $2 file
+ 
+-chmod $1 $2
++chmod $1 ${DESTDIR}/$2
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
new file mode 100644
index 0000000000..495fbfc3fa
--- /dev/null
+++ b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
@@ -0,0 +1,33 @@
+From 586bb97459e72da30bd9991c228b6b8e9251c68b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 01:49:49 -0600
+Subject: [PATCH] Don't require gstreamer-check-1.0 unless tests are enabled.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/248]
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1d9ce9d..76990a0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -22,10 +22,12 @@ gio_unix_dep  = dependency('gio-unix-2.0',       version : '>=2.44.1')
+ json_glib_dep = dependency('json-glib-1.0',      version : '>=0.16.2')
+ libd_dep      = dependency('libdaemon',          version : '>=0.14')
+ jansson_dep   = dependency('jansson',            version : '>=2.7')
+-gst_check_dep = dependency('gstreamer-check-1.0',version : '>=1.0.5')
+ thread_dep    = dependency('threads')
+ libsoup_dep = dependency('libsoup-2.4',		       version : '>=2.4')
+ 
++gst_check_required = get_option('enable-tests').enabled()
++gst_check_dep = dependency('gstreamer-check-1.0', required : gst_check_required, version : '>=1.0.5')
++
+ systemd_required = get_option('enable-systemd').enabled()
+ systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
+ 
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
new file mode 100644
index 0000000000..265ea8d8c3
--- /dev/null
+++ b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
@@ -0,0 +1,38 @@
+From a670beca8dcc76171dcfe3f10970d76c6f0439be Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 02:49:10 -0600
+Subject: [PATCH] Use relative symlink for gstd/gst-client exe.
+
+This should fix the symlink path when cross compiling.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/249]
+---
+ gst_client/gst_client_symbolic_link.sh | 2 +-
+ gstd/gstd_symbolic_link.sh             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst_client/gst_client_symbolic_link.sh b/gst_client/gst_client_symbolic_link.sh
+index d8d7617..b87dd12 100755
+--- a/gst_client/gst_client_symbolic_link.sh
++++ b/gst_client/gst_client_symbolic_link.sh
+@@ -4,4 +4,4 @@
+ # $1: target
+ # $2: link name
+ rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
++ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+diff --git a/gstd/gstd_symbolic_link.sh b/gstd/gstd_symbolic_link.sh
+index d8d7617..b87dd12 100755
+--- a/gstd/gstd_symbolic_link.sh
++++ b/gstd/gstd_symbolic_link.sh
+@@ -4,4 +4,4 @@
+ # $1: target
+ # $2: link name
+ rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
++ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch b/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
new file mode 100644
index 0000000000..247b5ab32f
--- /dev/null
+++ b/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
@@ -0,0 +1,34 @@
+From 05ae5237b1bc23399898f9c06463cfe2b5bba499 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 17:48:03 -0600
+Subject: [PATCH] Don't require gstd-check-user-xenv.sh for systemd service
+
+The gstd-check-user-xenv.sh script does not appear to be required
+for running the gstd service so we shouldn't require it for the
+service to start.
+
+Note that the non-systemd init script already does not require this.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/RidgeRun/gstd-1.x/pull/251]
+---
+ init/gstd.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/init/gstd.service.in b/init/gstd.service.in
+index 3d20ecd..9125983 100644
+--- a/init/gstd.service.in
++++ b/init/gstd.service.in
+@@ -6,7 +6,7 @@ StartLimitIntervalSec=30
+ [Service]
+ Restart=on-failure
+ RestartSec=5s
+-ExecStartPre=@GSTD_SYSTEMD_DIR@/gstd-check-user-xenv.sh
++ExecStartPre=-@GSTD_SYSTEMD_DIR@/gstd-check-user-xenv.sh
+ ExecStart=@prefix@/bin/gstd
+ 
+ [Install]
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch b/package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch
new file mode 100644
index 0000000000..a27d79a0e9
--- /dev/null
+++ b/package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch
@@ -0,0 +1,78 @@
+From 1067f6138e947d18fd835e4a39f229ae2293f864 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Sep 2021 23:37:03 -0600
+Subject: [PATCH] Use native meson python module for python install.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/253]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ libgstc/meson.build        |  4 +++-
+ libgstc/python/meson.build | 26 +++++++++++++++++++++++++-
+ meson_options.txt          |  2 ++
+ 3 files changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/libgstc/meson.build b/libgstc/meson.build
+index e94dcd1..582cbb8 100644
+--- a/libgstc/meson.build
++++ b/libgstc/meson.build
+@@ -1,2 +1,4 @@
+ subdir('c')
+-subdir('python')
++if not get_option('enable-python').disabled()
++  subdir('python')
++endif
+diff --git a/libgstc/python/meson.build b/libgstc/python/meson.build
+index 057114b..24e3242 100644
+--- a/libgstc/python/meson.build
++++ b/libgstc/python/meson.build
+@@ -1 +1,25 @@
+-run_command('pip3', 'install', '.')
++pymod = import('python')
++python = pymod.find_installation(
++  get_option('with-python-version'),
++  required : get_option('enable-python').enabled(),
++  disabler : true
++)
++
++pythonver = python.language_version()
++if pythonver.version_compare('<3.7')
++  error('Python @0@ is not supported anymore, please port your code to python3.7 or newer.'.format(python.language_version()))
++endif
++
++pygstc_src_files = [
++  'pygstc/__init__.py',
++  'pygstc/gstc.py',
++  'pygstc/gstcerror.py',
++  'pygstc/logger.py',
++  'pygstc/tcp.py'
++]
++
++python.install_sources(
++  pygstc_src_files,
++  subdir : 'pygstc',
++  pure : true
++)
+diff --git a/meson_options.txt b/meson_options.txt
+index f50e540..25292e6 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -4,6 +4,7 @@ option('enable-examples', type : 'feature', value : 'auto', yield : true, descri
+ option('enable-gtk-doc', type : 'boolean', value : false, description : 'Use gtk-doc to build documentation')
+ option('enable-systemd', type : 'feature', value : 'auto', description : 'Enable systemd gstd.service install')
+ option('enable-initd', type : 'feature', value : 'disabled', description : 'Enable init script install')
++option('enable-python', type : 'feature', value : 'auto', description : 'Install the pygstc library')
+ 
+ # String options
+ option('with-gstd-runstatedir', type : 'string', value : '${prefix}/var/run/gstd', description : 'Specify the location of the gstd\'s PID file')
+@@ -11,6 +12,7 @@ option('with-gstd-logstatedir', type : 'string', value : '${prefix}/var/log/gstd
+ option('with-gstd-systemddir', type : 'string', value : 'Systemd default systemduserunitdir', description : 'Specify the location of gstd.service file')
+ option('with-gstd-initddir', type : 'string', value : '${sysconfdir}/init.d', description : 'Specify the location of gstd init script')
+ option('with-statedir-owner', type : 'string', value : 'root', description : 'Specify the owner of gstd\'s run and log dirs created by the initd script')
++option('with-python-version', type : 'string', value : 'python3', description : 'Specify the python version for pygstc installation')
+ 
+ # Common options
+ option('package-name', type : 'string', yield : true,
+-- 
+2.25.1
+
diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
new file mode 100644
index 0000000000..14cda7c45f
--- /dev/null
+++ b/package/gstreamer1/gstd/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GSTD
+	bool "gstd"
+	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
+	depends on BR2_USE_MMU # libdaemon, libglib2
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_READLINE
+	help
+	  GStreamer Daemon, also called gstd, is a GStreamer framework
+	  for controlling audio and video streaming using an
+	  InterProcess Communication protocol.
+
+	  https://developer.ridgerun.com/wiki/index.php?title=GStreamer_Daemon
diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
new file mode 100644
index 0000000000..6ec84bd58d
--- /dev/null
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  94c10c798d3618b63cc68cbe053fabd19335a57f982a47b3d66c27c37d325da3  gstd-0.13.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
new file mode 100644
index 0000000000..959e277272
--- /dev/null
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# gstd
+#
+################################################################################
+
+GSTD_VERSION = 0.13.0
+GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
+GSTD_LICENSE_FILES = COPYING
+GSTD_LICENSE = GPL-2.0+
+
+GSTD_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
+	gstreamer1 \
+	jansson \
+	json-glib \
+	libdaemon \
+	libglib2 \
+	libsoup \
+	readline
+
+GSTD_CONF_OPTS = \
+	-Denable-tests=disabled \
+	-Denable-examples=disabled \
+	-Denable-gtk-doc=false \
+	-Denable-python=disabled \
+	-Dwith-gstd-runstatedir=/var/run/gstd \
+	-Dwith-gstd-logstatedir=/var/log/gstd \
+	-Dwith-gstd-systemddir=/usr/lib/systemd/system
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
+GSTD_DEPENDENCIES += systemd
+else
+GSTD_CONF_OPTS += -Denable-systemd=disabled -Denable-initd=enabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
