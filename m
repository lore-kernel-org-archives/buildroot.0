From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 02 Jan 2010 17:47:47 -0500
Subject: [Buildroot] [PATCH] cdrtools fails to build with an external
	toolchain
Message-ID: <1262472467.23927.21.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cdrtools 2.10 fails to build with an error of "conflicting types
for `fexecve` cdrtools 2.10.01a70 has a fix in it that repairs the problem.
This change bumps the version of cdrtools to the latest alpha version
that includes this change.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 target/iso9660/iso9660.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 94edf63..46d96f7 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -3,10 +3,10 @@
 # mkisofs to build to target iso9660 filesystems
 #
 #############################################################
-MKISOFS_SOURCE:=cdrtools-2.01.tar.bz2
+MKISOFS_SOURCE:=cdrtools-2.01.01a70.tar.bz2
 MKISOFS_CAT:=$(BZCAT)
-MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/
-MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01
+MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/alpha/
+MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01.01
 MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(HOST_ARCH)-linux-cc/mkisofs
 
 $(DL_DIR)/$(MKISOFS_SOURCE):
-- 
1.6.3.3
