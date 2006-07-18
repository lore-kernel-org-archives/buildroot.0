From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 02:01:05 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib12
Message-ID: <20060718075930.24E3F38DC3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 00:59:29 -0700 (Tue, 18 Jul 2006)
New Revision: 15713

Log:
change paths so glib-config uses the correct path for
the cross compiled libglib and include files


Modified:
   trunk/buildroot/package/libglib12/libglib12.mk


Changeset:
Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2006-07-18 07:19:10 UTC (rev 15712)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2006-07-18 07:59:29 UTC (rev 15713)
@@ -29,6 +29,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=$(STAGING_DIR) \
 		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
 		--libexecdir=/usr/lib \
