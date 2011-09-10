From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Sep 2011 17:14:17 +0200
Subject: [Buildroot] [git commit] package: add libev
Message-ID: <20110910214434.8DADC8D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e73cf2d5f3152ca46b730c69677ae54e3b7217bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Roth <broth@roth-itk.de>
Signed-off-by: Yegor Yefremov <yegor_sub1@visionsystems.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/libev/Config.in |    6 ++++++
 package/libev/libev.mk  |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/libev/Config.in
 create mode 100644 package/libev/libev.mk

diff --git a/package/Config.in b/package/Config.in
index c4cecfa..bcdf421 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -342,6 +342,7 @@ source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
+source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
diff --git a/package/libev/Config.in b/package/libev/Config.in
new file mode 100644
index 0000000..71abe77
--- /dev/null
+++ b/package/libev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBEV
+	bool "libev"
+	help
+	  Userspace library for handling asynchronous notifications
+
+	  http://software.schmorp.de/pkg/libev.html
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
new file mode 100644
index 0000000..b0db123
--- /dev/null
+++ b/package/libev/libev.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libev
+#
+#############################################################
+LIBEV_VERSION = 4.04
+LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
+LIBEV_SITE = http://dist.schmorp.de/libev/
+LIBEV_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libev))
-- 
1.7.3.4
