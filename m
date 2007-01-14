From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 14 Jan 2007 03:25:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dash libevent
	nfs-utils samba
Message-ID: <20070114112523.BC982485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-14 03:25:22 -0800 (Sun, 14 Jan 2007)
New Revision: 17296

Log:
- Remove CC_FOR_BUILD="$(HOSTCC)" since it is already contained in the
  TARGET_CONFIGURE_OPTS


Modified:
   trunk/buildroot/package/dash/dash.mk
   trunk/buildroot/package/libevent/libevent.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/dash/dash.mk
===================================================================
--- trunk/buildroot/package/dash/dash.mk	2007-01-14 11:14:27 UTC (rev 17295)
+++ trunk/buildroot/package/dash/dash.mk	2007-01-14 11:25:22 UTC (rev 17296)
@@ -27,7 +27,7 @@
 
 $(DASH_DIR)/.configured: $(DASH_DIR)/.unpacked
 	(cd $(DASH_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-01-14 11:14:27 UTC (rev 17295)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-01-14 11:25:22 UTC (rev 17296)
@@ -24,7 +24,7 @@
 
 $(LIBEVENT_DIR)/.configured: $(LIBEVENT_DIR)/.unpacked
 	(cd $(LIBEVENT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD=$(HOSTCC) \
+		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-14 11:14:27 UTC (rev 17295)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-14 11:25:22 UTC (rev 17296)
@@ -24,7 +24,7 @@
 
 $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
 	(cd $(NFS_UTILS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		knfsd_cv_bsd_signals=no \

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-01-14 11:14:27 UTC (rev 17295)
+++ trunk/buildroot/package/samba/samba.mk	2007-01-14 11:25:22 UTC (rev 17296)
@@ -24,7 +24,7 @@
 $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 	(cd $(SAMBA_DIR); rm -rf config.cache; \
 		./autogen.sh; \
-		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 		samba_cv_USE_SETREUID=yes \
