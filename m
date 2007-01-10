From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 02:30:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20070110103056.EF4F24859C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 02:30:56 -0800 (Wed, 10 Jan 2007)
New Revision: 17224

Log:
needs pkg-config


Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-01-10 10:30:10 UTC (rev 17223)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-01-10 10:30:56 UTC (rev 17224)
@@ -143,7 +143,7 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgobject-2.0.so.0.*
 	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
-libglib2: uclibc gettext libintl $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
+libglib2: uclibc gettext libintl pkgconfig $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
 libglib2-clean:
 	rm -f $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)
