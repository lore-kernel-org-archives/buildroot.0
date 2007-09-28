From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 12:49:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070928194914.03D4A3007D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 12:49:13 -0700 (Fri, 28 Sep 2007)
New Revision: 20090

Log:
Sort HOST/TARGET_CONFIGURE_OPTS, add some more, needed for gcc-4.1.2

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-28 19:46:58 UTC (rev 20089)
+++ trunk/buildroot/package/Makefile.in	2007-09-28 19:49:13 UTC (rev 20090)
@@ -136,17 +136,26 @@
 		GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
 		CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
-		RANLIB=$(TARGET_CROSS)ranlib \
-		STRIP=$(TARGET_CROSS)strip \
-		OBJCOPY=$(TARGET_CROSS)objcopy \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \
+		GCC_FOR_BUILD="$(HOSTCC)" \
 		CXX_FOR_BUILD="$(HOSTCXX)" \
 		LD_FOR_BUILD="$(HOSTLD)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		AR_FOR_TARGET=$(TARGET_CROSS)ar \
+		AS_FOR_TARGET=$(TARGET_CROSS)as \
+		CC_FOR_TARGET=$(TARGET_CROSS)gcc \
+		LD_FOR_TARGET=$(TARGET_CROSS)ld \
+		NM_FOR_TARGET=$(TARGET_CROSS)nm \
+		RANLIB=$(TARGET_CROSS)ranlib \
+		STRIP=$(TARGET_CROSS)strip \
+		OBJCOPY=$(TARGET_CROSS)objcopy \
+		OBJDUMP=$(TARGET_CROSS)objdump \
+		DEFAULT_ASSEMBLER=$(TARGET_CROSS)as \
+		DEFAULT_LINKER=$(TARGET_CROSS)ld \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
@@ -155,6 +164,14 @@
 		STAGING_DIR="$(STAGING_DIR)"
 
 HOST_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
+		AR="$(HOSTAR)" \
+		AS="$(HOSTAS)" \
+		LD="$(HOSTLD) $(HOST_LDFLAGS)" \
+		NM="$(HOSTNM)" \
+		CC="$(HOSTCC) $(HOST_CFLAGS)" \
+		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
+		CXX="$(HOSTCXX)" \
+		CPP="$(HOSTCPP) $(HOST_CFLAGS)" \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \
@@ -164,19 +181,21 @@
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" \
-		AS="$(HOSTAS)" \
-		CC="$(HOSTCC) $(HOST_CFLAGS)" \
-		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
-		CXX="$(HOSTCXX)" \
-		LD="$(HOSTLD) $(HOST_LDFLAGS)" \
 		AR_FOR_TARGET=$(TARGET_CROSS)ar \
 		AS_FOR_TARGET=$(TARGET_CROSS)as \
+		CC_FOR_TARGET=$(TARGET_CROSS)gcc \
 		LD_FOR_TARGET=$(TARGET_CROSS)ld \
 		NM_FOR_TARGET=$(TARGET_CROSS)nm \
 		RANLIB_FOR_TARGET=$(TARGET_CROSS)ranlib \
 		STRIP_FOR_TARGET=$(TARGET_CROSS)strip \
-		OBJCOPY_FOR_TARGET=$(TARGET_CROSS)objcopy
+		OBJCOPY_FOR_TARGET=$(TARGET_CROSS)objcopy \
+		OBJDUMP_FOR_TARGET=$(TARGET_CROSS)objdump \
+		DEFAULT_ASSEMBLER=$(TARGET_CROSS)as \
+		DEFAULT_LINKER=$(TARGET_CROSS)ld \
+		ORIGINAL_AS_FOR_TARGET=$(TARGET_CROSS)as \
+		ORIGINAL_LD_FOR_TARGET=$(TARGET_CROSS)ld \
+		ORIGINAL_NM_FOR_TARGET=$(TARGET_CROSS)nm \
+		ORIGINAL_OBJDUMP_FOR_TARGET=$(TARGET_CROSS)objdump
 
 #######################################################################
 # settings we need to pass to configure
