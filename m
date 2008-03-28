From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:39:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jamvm
Message-ID: <20080328103938.97A143C362@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:39:38 -0700 (Fri, 28 Mar 2008)
New Revision: 21532

Log:
jamvm.mk: remove trailing spaces


Modified:
   trunk/buildroot/package/jamvm/jamvm.mk


Changeset:
Modified: trunk/buildroot/package/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/jamvm/jamvm.mk	2008-03-28 10:39:27 UTC (rev 21531)
+++ trunk/buildroot/package/jamvm/jamvm.mk	2008-03-28 10:39:38 UTC (rev 21532)
@@ -9,8 +9,8 @@
 JAMVM_AUTORECONF = NO
 JAMVM_INSTALL_STAGING = YES
 JAMVM_INSTALL_TARGET = YES
-JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
-JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 
+JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
@@ -57,16 +57,16 @@
 		--with-classpath-install-dir=/usr \
 
 
-JAMVM_DEPENDENCIES = uclibc classpath  
+JAMVM_DEPENDENCIES = uclibc classpath
 
 #Include X libraries when we have an X server
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
-	JAMVM_DEPENDENCIES+= $(XSERVER) 
+	JAMVM_DEPENDENCIES+= $(XSERVER)
 	JAMVM_CONF_OPT+= --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 else
-	JAMVM_CONF_OPT+= --without-x  
+	JAMVM_CONF_OPT+= --without-x
 endif
 
 
@@ -99,7 +99,7 @@
 ifeq ($(BR2_avr32),y)
 	JAMVM_CONF_OPT+= \
 		CFLAGS="-g0" \
-		CC="$(STAGING_DIR)/usr/bin/avr32-linux-gcc" 
+		CC="$(STAGING_DIR)/usr/bin/avr32-linux-gcc"
 endif
 
 $(eval $(call AUTOTARGETS,package,jamvm))
