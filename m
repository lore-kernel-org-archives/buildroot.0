From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 07:27:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070929142740.841EEA5D24@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 07:27:39 -0700 (Sat, 29 Sep 2007)
New Revision: 20113

Log:
- fix quotes for STRIP.
  Sorry for any inconvenience this may have caused..


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-29 13:58:30 UTC (rev 20112)
+++ trunk/buildroot/package/Makefile.in	2007-09-29 14:27:39 UTC (rev 20113)
@@ -109,7 +109,7 @@
 STRIP_STRIP_ALL:=--strip-all
 REMOVE_SECTION_COMMENT:=--remove-section=.comment
 REMOVE_SECTION_NOTE:=--remove-section=.note
-TARGET_STRIP="$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)"
+TARGET_STRIP=$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)
 STRIP=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
@@ -118,11 +118,11 @@
 STRIP_STRIP_ALL:=
 REMOVE_SECTION_COMMENT:=
 REMOVE_SECTION_NOTE:=
-TARGET_STRIP="$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip"
+TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIP=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP="true -Not_stripping"
+TARGET_STRIP=true -Not_stripping
 STRIP=$(TARGET_STRIP)
 endif
 INSTALL=/usr/bin/install
@@ -142,18 +142,18 @@
 GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
 #")
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
-		AR=$(TARGET_AR) \
-		AS=$(TARGET_AS) \
+		AR="$(TARGET_AR)" \
+		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
-		NM=$(TARGET_NM) \
+		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		CPP="$(TARGET_CPP) $(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS)" \
 		FC="$(TARGET_FC) $(TARGET_FCFLAGS)" \
-		RANLIB=$(TARGET_RANLIB) \
-		STRIP=$(TARGET_STRIP) \
-		OBJCOPY=$(TARGET_OBJCOPY) \
+		RANLIB="$(TARGET_RANLIB)" \
+		STRIP="$(TARGET_STRIP)" \
+		OBJCOPY="$(TARGET_OBJCOPY)" \
 		AR_FOR_BUILD="$(HOSTAR)" \
 		AS_FOR_BUILD="$(HOSTAS)" \
 		CC_FOR_BUILD="$(HOSTCC)" \
@@ -165,13 +165,13 @@
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
-		AR_FOR_TARGET=$(TARGET_AR) \
-		AS_FOR_TARGET=$(TARGET_AS) \
-		CC_FOR_TARGET=$(TARGET_CC) \
-		LD_FOR_TARGET=$(TARGET_LD) \
-		NM_FOR_TARGET=$(TARGET_NM) \
-		DEFAULT_ASSEMBLER=$(TARGET_AS) \
-		DEFAULT_LINKER=$(TARGET_LD) \
+		AR_FOR_TARGET="$(TARGET_AR)" \
+		AS_FOR_TARGET="$(TARGET_AS)" \
+		CC_FOR_TARGET="$(TARGET_CC)" \
+		LD_FOR_TARGET="$(TARGET_LD)" \
+		NM_FOR_TARGET="$(TARGET_NM)" \
+		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
+		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
@@ -199,21 +199,21 @@
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
-		AR_FOR_TARGET=$(TARGET_AR) \
-		AS_FOR_TARGET=$(TARGET_AS) \
-		CC_FOR_TARGET=$(TARGET_CC) \
-		LD_FOR_TARGET=$(TARGET_LD) \
-		NM_FOR_TARGET=$(TARGET_NM) \
-		RANLIB_FOR_TARGET=$(TARGET_RANLIB) \
-		STRIP_FOR_TARGET=$(TARGET_STRIP) \
-		OBJCOPY_FOR_TARGET=$(TARGET_OBJCOPY) \
-		OBJDUMP_FOR_TARGET=$(TARGET_OBJDUMP) \
-		DEFAULT_ASSEMBLER=$(TARGET_AS) \
-		DEFAULT_LINKER=$(TARGET_LD) \
-		ORIGINAL_AS_FOR_TARGET=$(TARGET_AS) \
-		ORIGINAL_LD_FOR_TARGET=$(TARGET_LD) \
-		ORIGINAL_NM_FOR_TARGET=$(TARGET_NM) \
-		ORIGINAL_OBJDUMP_FOR_TARGET=$(TARGET_OBJDUMP)
+		AR_FOR_TARGET="$(TARGET_AR)" \
+		AS_FOR_TARGET="$(TARGET_AS)" \
+		CC_FOR_TARGET="$(TARGET_CC)" \
+		LD_FOR_TARGET="$(TARGET_LD)" \
+		NM_FOR_TARGET="$(TARGET_NM)" \
+		RANLIB_FOR_TARGET="$(TARGET_RANLIB)" \
+		STRIP_FOR_TARGET="$(TARGET_STRIP)" \
+		OBJCOPY_FOR_TARGET="$(TARGET_OBJCOPY)" \
+		OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
+		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
+		DEFAULT_LINKER="$(TARGET_LD)" \
+		ORIGINAL_AS_FOR_TARGET="$(TARGET_AS)" \
+		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
+		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
+		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)"
 
 #######################################################################
 # settings we need to pass to configure
