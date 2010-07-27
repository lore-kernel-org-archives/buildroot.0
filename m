From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:19:00 +0200
Subject: [Buildroot] [PATCH 3/4] target-gcc: no need to strip binaries,
	remove .la files and doc
In-Reply-To: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4e62eeed193e2c90bfbca52a28efaa1c2f5cd327.1280254559.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is done in a global way by the target-finalize target of the main
Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 52b20e9..5dec86c 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -445,15 +445,6 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 
-	-(cd $(TARGET_DIR)/bin && find -type f | xargs $(STRIPCMD) > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/bin && find -type f | xargs $(STRIPCMD) > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR) && $(STRIPCMD) cc1 cc1plus collect2 > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/usr/lib && $(STRIPCMD) libstdc++.so.*.*.* > /dev/null 2>&1)
-	-(cd $(TARGET_DIR)/lib && $(STRIPCMD) libgcc_s*.so.*.*.* > /dev/null 2>&1)
-	#
-	rm -f $(TARGET_DIR)/usr/lib/*.la*
-	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \
-- 
1.7.0.4
