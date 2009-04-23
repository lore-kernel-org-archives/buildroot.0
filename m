From: Will Newton <will.newton@gmail.com>
Date: Thu, 23 Apr 2009 11:28:55 +0100
Subject: [Buildroot] [PATCH] Update qtopia4 source URL
Message-ID: <87a5b0800904230328r3be9da5cldb5c9eb3ce4efa26@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The location of the Qt source tarballs is moving away from the
Trolltech domain. Also I think it's better to use http instead of ftp,
especially in corporate environments. The attached patch updates the
source URL to the most recent http one.

--- package/qtopia4/qtopia4.mk  21 Apr 2009 10:42:40 -0000      1.1.1.3
+++ package/qtopia4/qtopia4.mk  23 Apr 2009 10:26:02 -0000
@@ -37,7 +37,7 @@
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
 QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
 else # Good, good, we are free:
-QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
+QTOPIA4_SITE=http://get.qtsoftware.com/qt/source
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED),y)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4-source-url.patch
Type: application/octet-stream
Size: 857 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090423/597ab13f/attachment-0001.obj>
