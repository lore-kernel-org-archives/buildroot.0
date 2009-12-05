From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 5 Dec 2009 11:36:11 +0100
Subject: [Buildroot] [PATCH] fet rid of quotes when making tar output
Message-ID: <E782362AE37F4898A139ED5C9EBB6A95@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is cosmetic, when the image is tarred i noticed quotes around the
target image name,
This should fix it.

Maybe oyjer output formats (cpio) suffer the same issue.
Johan

 
diff -ruaN buildroot-2009.11/target/tar/tarroot.mk
buildroot/target/tar/tarroot.mk
--- buildroot-2009.11/target/tar/tarroot.mk	2009-12-01
15:27:41.000000000 +0100
+++ buildroot/target/tar/tarroot.mk	2009-12-02 15:23:22.000000000 +0100
@@ -5,7 +5,7 @@
 #############################################################
 
 TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
-TAR_TARGET:=$(IMAGE).tar
+TAR_TARGET:=$(call qstrip,$(IMAGE).tar)
 
 TAR_COMPRESSOR:=
 TAR_COMPRESSOR_EXT:=.none


-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_target_tar.patch
Type: application/octet-stream
Size: 474 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091205/1d65447d/attachment.obj>
