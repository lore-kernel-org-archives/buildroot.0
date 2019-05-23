From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 11:10:16 +0200
Subject: [Buildroot] [git commit] package/fatcat: new host package
Message-ID: <20190602201235.82DED81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08d6e63bdc545bb3e321ea0fdf377dd3a0d52609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Utility to manipulate FAT file systems, E.G. to tweak the output of
genimage.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                    |  1 +
 package/Config.in.host        |  1 +
 package/fatcat/Config.in.host |  8 ++++++++
 package/fatcat/fatcat.hash    |  3 +++
 package/fatcat/fatcat.mk      | 12 ++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5a7b7d390..66dc2504ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	configs/sheevaplug_defconfig
 F:	package/bats-core/
 F:	package/docker-compose/
 F:	package/dump1090/
+F:	package/fatcat/
 F:	package/flickcurl/
 F:	package/fscryptctl/
 F:	package/ifmetric/
diff --git a/package/Config.in.host b/package/Config.in.host
index bc7e71882b..d1c6d0d81f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/e2tools/Config.in.host"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
+	source "package/fatcat/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
diff --git a/package/fatcat/Config.in.host b/package/fatcat/Config.in.host
new file mode 100644
index 0000000000..2c5f66981b
--- /dev/null
+++ b/package/fatcat/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_FATCAT
+	bool "host fatcat"
+	help
+	  Fatcat is designed to manipulate FAT filesystems, in order
+	  to explore, extract, repair, recover and forensic them. It
+	  currently supports FAT12, FAT16 and FAT32.
+
+	  https://github.com/Gregwar/fatcat
diff --git a/package/fatcat/fatcat.hash b/package/fatcat/fatcat.hash
new file mode 100644
index 0000000000..a5a6f670ad
--- /dev/null
+++ b/package/fatcat/fatcat.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 d44f6bb80d20ed50095ace9e71df8da98037db9f22cda76bdd9724d37df69130  fatcat-1.0.6.tar.gz
+sha256 3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
diff --git a/package/fatcat/fatcat.mk b/package/fatcat/fatcat.mk
new file mode 100644
index 0000000000..e4f8d757b6
--- /dev/null
+++ b/package/fatcat/fatcat.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# fatcat
+#
+################################################################################
+
+FATCAT_VERSION = 1.0.6
+FATCAT_SITE = $(call github,Gregwar,fatcat,$(FATCAT_VERSION))
+FATCAT_LICENSE = MIT
+FATCAT_LICENSE_FILES = LICENSE
+
+$(eval $(host-cmake-package))
