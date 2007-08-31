From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 31 Aug 2007 05:04:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20070831120400.E5360A60C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-31 05:04:00 -0700 (Fri, 31 Aug 2007)
New Revision: 19739

Log:
- need to touch the tarball


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-08-30 22:40:22 UTC (rev 19738)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-08-31 12:04:00 UTC (rev 19739)
@@ -19,6 +19,7 @@
 endif
 $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 	$(WGET) -P $(DL_DIR) $(LIBUSB_SITE)/$(LIBUSB_SOURCE)
+	touch -c $@
 
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
