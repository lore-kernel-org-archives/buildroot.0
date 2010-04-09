From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:40 +0200
Subject: [Buildroot] [PATCH 02/44] genext2fs: new package
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <069290f197cfe9659673f9186cf9c2bf452f7f1a.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/genext2fs/Config.in                        |    9 +++++++++
 .../genext2fs}/genext2fs-1.4-nosquash.patch        |    0
 .../genext2fs-1.4-remove_ugly_warnings.patch       |    0
 package/genext2fs/genext2fs.mk                     |   12 ++++++++++++
 5 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/genext2fs/Config.in
 rename {target/ext2 => package/genext2fs}/genext2fs-1.4-nosquash.patch (100%)
 rename {target/ext2 => package/genext2fs}/genext2fs-1.4-remove_ugly_warnings.patch (100%)
 create mode 100644 package/genext2fs/genext2fs.mk

diff --git a/package/Config.in b/package/Config.in
index 9c75fcc..856048a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -159,6 +159,7 @@ source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/gvfs/Config.in"
 source "package/hal/Config.in"
diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
new file mode 100644
index 0000000..82992f8
--- /dev/null
+++ b/package/genext2fs/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GENEXT2FS
+       bool "genext2fs"
+       help
+         genext2fs generates an ext2 filesystem as a normal (non-root)
+	 user.  It does not require you to mount the image file to
+	 copy files on it, nor does it require that you become the
+	 superuser to make device nodes.
+
+	 http://genext2fs.sourceforge.net/
diff --git a/target/ext2/genext2fs-1.4-nosquash.patch b/package/genext2fs/genext2fs-1.4-nosquash.patch
similarity index 100%
rename from target/ext2/genext2fs-1.4-nosquash.patch
rename to package/genext2fs/genext2fs-1.4-nosquash.patch
diff --git a/target/ext2/genext2fs-1.4-remove_ugly_warnings.patch b/package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
similarity index 100%
rename from target/ext2/genext2fs-1.4-remove_ugly_warnings.patch
rename to package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
new file mode 100644
index 0000000..8c4981e
--- /dev/null
+++ b/package/genext2fs/genext2fs.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# genext2fs
+#
+#############################################################
+
+GENEXT2FS_VERSION=1.4
+GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
+GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
+
+$(eval $(call AUTOTARGETS,package,genext2fs))
+$(eval $(call AUTOTARGETS,package,genext2fs,host))
-- 
1.6.3.3
