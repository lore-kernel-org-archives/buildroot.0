From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:53:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20080306175336.1E21E120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:53:35 -0800 (Thu, 06 Mar 2008)
New Revision: 21177

Log:
added alsa dev directory location to configure statement

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-03-06 17:52:37 UTC (rev 21176)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-03-06 17:53:35 UTC (rev 21177)
@@ -31,7 +31,7 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(ALSA_LIB_ABI)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -41,6 +41,8 @@
 		--enable-shared \
 		--enable-static \
 		--disable-docs \
+		--with-alsa-devdir=/dev \
+		--with-softfloat \
 		$(DISABLE_NLS) \
 	)
 	touch $@
