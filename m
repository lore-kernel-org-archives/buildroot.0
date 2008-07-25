From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Fri, 25 Jul 2008 13:46:42 +0200
Subject: [Buildroot] Patch for gcc-uclibc-4.x.mk
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF3265383@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

when compiling with sstrip, the path $(TARGET_DIR)/usr/bin must exist,
otherwise the compilation of gcc will abort and say that
$(TARGET_DIR)/usr/bin doesn't exist.

Regards
Sebastian

Here is the patch for buildroot/toolchain/gcc/gcc-uclibc-4.x.mk:


--- ./.svn/text-base/gcc-uclibc-4.x.mk.svn-base	2008-07-17
13:49:10.000000000 +0200
+++ gcc-uclibc-4.x.mk	2008-07-25 13:03:16.000000000 +0200
@@ -356,7 +356,7 @@
 	#
 	# Ok... that's enough of that.
 	#
-	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
$(TARGET_DIR)/usr/bin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-uclibc-4.x.mk.patch
Type: application/octet-stream
Size: 415 bytes
Desc: gcc-uclibc-4.x.mk.patch
Url : http://busybox.net/lists/buildroot/attachments/20080725/52fadea1/attachment.obj 
