From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 26 Nov 2009 16:51:11 +0100
Subject: [Buildroot] libxml2 [PATCH] bump  to version 2.7.6
Message-ID: <0E6ECDEC6CE14918844F9A10D0BCDCFA@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

This is the patch to update the libxml2 package from version 2.7.3 to 2.7.6

diff -rupN buildroot-2009.11/package/libxml2/libxml2.mk
buildroot/package/libxml2/libxml2.mk
--- buildroot-2009.11/package/libxml2/libxml2.mk	2009-11-25
10:22:42.000000000 +0100
+++ buildroot/package/libxml2/libxml2.mk	2009-11-26
16:13:07.000000000 +0100
@@ -3,11 +3,13 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.7.3
+LIBXML2_VERSION = 2.7.6
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
+#this is needed for version 2.7.4 and higher
+LIBXML2_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"

-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_libxml2.patch
Type: application/octet-stream
Size: 744 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091126/52f5f3ba/attachment.obj>
