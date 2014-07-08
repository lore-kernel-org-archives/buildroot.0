From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 07:43:17 +0200
Subject: [Buildroot] [git commit] libmpdclient: new package
Message-ID: <20140708085415.D755B9D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d330aadac23bdb4229fe52221007d681c4c42acb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/libmpdclient/Config.in       |    7 +++++++
 package/libmpdclient/libmpdclient.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9d75c0c..9beab7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -518,6 +518,7 @@ menu "Audio/Sound"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
 	source "package/libmpd/Config.in"
+	source "package/libmpdclient/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsndfile/Config.in"
diff --git a/package/libmpdclient/Config.in b/package/libmpdclient/Config.in
new file mode 100644
index 0000000..a58c6c3
--- /dev/null
+++ b/package/libmpdclient/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMPDCLIENT
+	bool "libmpdclient"
+	help
+	  A stable, documented, asynchronous API library for interfacing MPD
+	  in the C, C++ & Objective C languages.
+
+	  http://www.musicpd.org/libs/libmpdclient/
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
new file mode 100644
index 0000000..530e4fc
--- /dev/null
+++ b/package/libmpdclient/libmpdclient.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libmpdclient
+#
+################################################################################
+
+LIBMPDCLIENT_VERSION_MAJOR = 2
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).9
+LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
+LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
+LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBMPDCLIENT_INSTALL_STAGING = YES
+LIBMPDCLIENT_LICENSE = BSD-3c
+LIBMPDCLIENT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
