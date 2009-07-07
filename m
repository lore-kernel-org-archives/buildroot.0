From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Jul 2009 23:26:36 +0200
Subject: [Buildroot] [git commit] liblockfile: bump version
Message-ID: <20090707213159.BE658777FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e71cd88e7c914e2236e422e2c8aada0254e9e40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #83.

Fixes build with newer glibc versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    1 +
 package/liblockfile/liblockfile.mk |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index adcba7c..7278bdf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#83: liblockfile fails to compile due to eaccess redefinition
 	#241: device mapper + lvm2: build together
 	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index a5e70cc..fe1d740 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -3,8 +3,8 @@
 # liblockfile
 #
 #############################################################
-LIBLOCKFILE_VERSION=1.06.1
-LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).tar.gz
+LIBLOCKFILE_VERSION=1.08
+LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_CAT:=$(ZCAT)
 LIBLOCKFILE_DIR:=$(BUILD_DIR)/liblockfile-$(LIBLOCKFILE_VERSION)
-- 
1.6.3.3
