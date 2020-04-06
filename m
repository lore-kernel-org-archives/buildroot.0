From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:03:10 +0200
Subject: [Buildroot] [git commit] package/libudfread: new package
Message-ID: <20200406194952.68F548CA64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c477885e3f3c31d3922af1fc0e47e6f5f35b1645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upcoming release of kodi 19.0 will add libudfread as optional
dependency: https://github.com/xbmc/xbmc/pull/17612

Please note that the removed support of libudf was added on the master
branch so we do not need to backport udf support to kodi 18.x:
https://github.com/xbmc/xbmc/commit/558b54a79eff717237919afe453ec09e0851d3a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash files]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libudfread/Config.in       |  6 ++++++
 package/libudfread/libudfread.hash |  3 +++
 package/libudfread/libudfread.mk   | 15 +++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e9ac2b7460..bf209b45d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -396,6 +396,7 @@ F:	package/libsndfile/
 F:	package/libsoil/
 F:	package/libsoundtouch/
 F:	package/libsquish/
+F:	package/libudfread/
 F:	package/liburiparser/
 F:	package/libva/
 F:	package/libva-intel-driver/
diff --git a/package/Config.in b/package/Config.in
index 373868ca82..fce3eeff03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1619,6 +1619,7 @@ menu "Multimedia"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
 	source "package/libtheora/Config.in"
+	source "package/libudfread/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/libyuv/Config.in"
 	source "package/live555/Config.in"
diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
new file mode 100644
index 0000000000..8d42570500
--- /dev/null
+++ b/package/libudfread/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBUDFREAD
+	bool "libudfread"
+	help
+	  UDF reader
+
+	  https://code.videolan.org/videolan/libudfread
diff --git a/package/libudfread/libudfread.hash b/package/libudfread/libudfread.hash
new file mode 100644
index 0000000000..9a68f62089
--- /dev/null
+++ b/package/libudfread/libudfread.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c4c5ee6b65be051fb1f2a738f726f2afc8601620e8f013d087769dc13aab6d4c  libudfread-1.0.0.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
new file mode 100644
index 0000000000..53ee4a578e
--- /dev/null
+++ b/package/libudfread/libudfread.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libudfread
+#
+################################################################################
+
+LIBUDFREAD_VERSION = 1.0.0
+LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
+LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
+LIBUDFREAD_AUTORECONF = YES
+LIBUDFREAD_INSTALL_STAGING = YES
+LIBUDFREAD_LICENSE = LGPL-2.1+
+LIBUDFREAD_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
