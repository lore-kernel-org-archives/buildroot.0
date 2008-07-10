From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jul 2008 08:17:03 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xdata_xcursor-themes
Message-ID: <20080710151703.B74693C725@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-10 08:17:03 -0700 (Thu, 10 Jul 2008)
New Revision: 22764

Log:
Use correct include dir syntax for xcursor-xthemes

Modified:
   trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk	2008-07-10 15:15:52 UTC (rev 22763)
+++ trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk	2008-07-10 15:17:03 UTC (rev 22764)
@@ -21,8 +21,8 @@
 
 $(XDATA_XCURSOR_THEMES_DIR)/.configured: $(XDATA_XCURSOR_THEMES_DIR)/.patched
 	(cd $(XDATA_XCURSOR_THEMES_DIR) && \
-		aclocal -I. -I$(STAGING_DIR)/usr/share/aclocal --install && \
-		autoconf -I$(STAGING_DIR)/usr/share/aclocal && \
+		aclocal -I . -I $(STAGING_DIR)/usr/share/aclocal --install && \
+		autoconf -I $(STAGING_DIR)/usr/share/aclocal && \
 		automake -ac && \
 		rm -rf config.cache && \
 		$(TARGET_CONFIGURE_OPTS) \
