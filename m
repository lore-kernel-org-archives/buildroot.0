From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 12:29:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20090131122956.BF6E476219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 12:29:55 +0000 (Sat, 31 Jan 2009)
New Revision: 25177

Log:
grub: fix build

Revert to the -35 debian patch (from stable.debian.net) so the other
patches apply, E.G. effectively revert r23968.

Someone who actually uses grub should probably look into updating our
version.

Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2009-01-31 12:02:40 UTC (rev 25176)
+++ trunk/buildroot/target/x86/grub/grub.mk	2009-01-31 12:29:55 UTC (rev 25177)
@@ -21,8 +21,8 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-51.diff.gz
-GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
+GRUB_PATCH:=grub_0.97-35.diff.gz
+GRUB_SITE:=http://snapshot.debian.net/archive/2008/03/29/debian/pool/main/g/grub/
 GRUB_PATCH_SITE:=$(GRUB_SITE)
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
