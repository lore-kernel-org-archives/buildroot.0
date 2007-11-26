From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Nov 2007 07:39:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071126153903.B31CA300C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-26 07:39:02 -0800 (Mon, 26 Nov 2007)
New Revision: 20545

Log:
Ups, TARGET_CONFIGURE_* is needed to find pkg-config (r20501)

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-26 14:54:15 UTC (rev 20544)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-26 15:39:02 UTC (rev 20545)
@@ -55,6 +55,8 @@
 $(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXTRA_DEPS)
 	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
 	(cd $(AVAHI_DIR) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
