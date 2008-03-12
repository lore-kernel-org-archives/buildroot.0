From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Mar 2008 09:18:43 +0100
Subject: [Buildroot] [PATCH] Fixed URL for fakeroot sources
Message-ID: <20080312091843.615e5bbf@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed URL for fakeroot sources

Used a fixed URL from snapshot.debian.net for fakeroot sources, so
that it won't break every time a new version is uploaded to Debian.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/fakeroot/fakeroot.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: buildroot.new/package/fakeroot/fakeroot.mk
===================================================================
--- buildroot.new.orig/package/fakeroot/fakeroot.mk
+++ buildroot.new/package/fakeroot/fakeroot.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 FAKEROOT_VERSION:=1.9.3
-FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
+FAKEROOT_SOURCE:=fakeroot-$(FAKEROOT_VERSION).tar.gz
+FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/02/06/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
 FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host

-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080312/06dc9899/attachment.pgp 
