From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 21:55:16 +0100
Subject: [Buildroot] [git commit] libmodplug: new package
Message-ID: <20140115205558.9ECFC9C4EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a5d5240157f1df80d2457db2a153821f56997d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MOD music file decoder.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: fix toolchain comment + file header. Add _LICENSE_FILES]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/libmodplug/Config.in     |   10 ++++++++++
 package/libmodplug/libmodplug.mk |   13 +++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4611256..2f62d6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ source "package/libcuefile/Config.in"
 source "package/libid3tag/Config.in"
 source "package/liblo/Config.in"
 source "package/libmad/Config.in"
+source "package/libmodplug/Config.in"
 source "package/libmpd/Config.in"
 source "package/libreplaygain/Config.in"
 source "package/libsamplerate/Config.in"
diff --git a/package/libmodplug/Config.in b/package/libmodplug/Config.in
new file mode 100644
index 0000000..cfc774a
--- /dev/null
+++ b/package/libmodplug/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBMODPLUG
+	bool "libmodplug"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MOD music file decoder
+
+	  http://modplug-xmms.sourceforge.net/
+
+comment "libmodplug needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
new file mode 100644
index 0000000..2a74928
--- /dev/null
+++ b/package/libmodplug/libmodplug.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libmodplug
+#
+################################################################################
+
+LIBMODPLUG_VERSION = 0.8.7
+LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
+LIBMODPLUG_INSTALL_STAGING = YES
+LIBMODPLUG_LICENSE = Public Domain
+LIBMODPLUG_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
