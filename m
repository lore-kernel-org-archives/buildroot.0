From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 11:48:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20080306194840.A3A951201A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 11:48:39 -0800 (Thu, 06 Mar 2008)
New Revision: 21259

Log:
fixed arch dependent option

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-03-06 19:10:06 UTC (rev 21258)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-03-06 19:48:39 UTC (rev 21259)
@@ -17,6 +17,10 @@
 ALSA_LIB_ABI:=
 endif
 
+ifeq ($(BR2_SOFT_FLOAT),y)
+	SOFT_FLOAT=--with-softfloat
+endif
+
 $(DL_DIR)/$(ALSA_LIB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ALSA_LIB_SITE)/$(ALSA_LIB_SOURCE)
 
@@ -42,7 +46,7 @@
 		--enable-static \
 		--disable-docs \
 		--with-alsa-devdir=/dev \
-		--with-softfloat \
+		$(SOFT_FLOAT) \
 		$(DISABLE_NLS) \
 	)
 	touch $@
