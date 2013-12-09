From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2013 09:31:27 +0100
Subject: [Buildroot] [git commit] util-linux: add nsenter option
Message-ID: <20131209083511.D16459BFA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f91d79601da42516752318beecfd080dc05aac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust white space and commit message]
Signed-off-by: Shawn Landden <shawn@churchofgit.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in     |    5 +++++
 package/util-linux/util-linux.mk |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8c8fd7a..ed19f39 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -106,6 +106,11 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	help
 	  Mount/unmount filesystems
 
+config BR2_PACKAGE_UTIL_LINUX_NSENTER
+	bool "nsenter"
+	help
+	  Enter namespaces (setns(2) frontend)
+
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20b3d35..5e689f8 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -62,6 +62,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
