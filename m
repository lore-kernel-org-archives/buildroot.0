From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Jan 2012 16:15:42 +0100
Subject: [Buildroot] [git commit] New package: kmod
Message-ID: <20120116152023.0A25E9035A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb749b51266bfcf8bbc0d249b75c3f653b808c67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs host-pkg-config]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/kmod/Config.in |    7 +++++++
 package/kmod/kmod.mk   |    8 ++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8518f06..67b8094 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
 source "package/htop/Config.in"
+source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
new file mode 100644
index 0000000..f83237e
--- /dev/null
+++ b/package/kmod/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KMOD
+	bool "kmod"
+	help
+	  handle kernel modules
+
+	  http://git.profusion.mobi/cgit.cgi/kmod.git/
+
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
new file mode 100644
index 0000000..a7a5bf5
--- /dev/null
+++ b/package/kmod/kmod.mk
@@ -0,0 +1,8 @@
+KMOD_VERSION = 3
+KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.bz2
+KMOD_SITE = http://git.profusion.mobi/cgit.cgi/kmod.git/snapshot
+KMOD_INSTALL_STAGING =YES
+KMOD_AUTORECONF = YES
+KMOD_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS))
