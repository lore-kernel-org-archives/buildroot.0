From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 11 Dec 2009 11:21:04 -0500
Subject: [Buildroot] [PATCH] iso9660: bump cdrtools to newer version
In-Reply-To: <a038bef50912110803x30c971c9sf44d4b21c118b8c@mail.gmail.com>
References: <a038bef50912110803x30c971c9sf44d4b21c118b8c@mail.gmail.com>
Message-ID: <1260548464-26761-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change picks up the current release candidate for cdrtools which fixes
numerous problems including some preventing compilation.
---

One thing I was wondering is the impact of HOST_ARCH changing from i386 to
i686? It hasn't caused me any issues but there may be gremlins lurking.

 package/Makefile.in       |    2 +-
 target/iso9660/iso9660.mk |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7c009bb..2f49041 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -189,7 +189,7 @@ HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/mips-.*/mips/' \
 	-e 's/mipsel-.*/mipsel/' \
 	-e 's/cris.*/cris/' \
-	-e 's/i[3-9]86/i386/' \
+	-e 's/i[3-9]86/i686/' \
 	-e 's/xtensa.*/xtensa/' \
 	)
 GNU_HOST_NAME:=$(HOST_ARCH)-$(call qstrip,$(BR2_GNU_BUILD_SUFFIX))
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 94edf63..0210176 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -3,10 +3,10 @@
 # mkisofs to build to target iso9660 filesystems
 #
 #############################################################
-MKISOFS_SOURCE:=cdrtools-2.01.tar.bz2
+MKISOFS_SOURCE:=cdrtools-2.01.01a69.tar.bz2
 MKISOFS_CAT:=$(BZCAT)
-MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/
-MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01
+MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/alpha
+MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01.01
 MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(HOST_ARCH)-linux-cc/mkisofs
 
 $(DL_DIR)/$(MKISOFS_SOURCE):
-- 
1.6.4.2
