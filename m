From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Sep 2006 11:17:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20060927181732.568EA486B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-27 11:17:31 -0700 (Wed, 27 Sep 2006)
New Revision: 16237

Log:
make 3.80 doesn't understand 'else ifeq(..)'
Reported by Jeff Rhyason.


Modified:
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2006-09-27 14:51:27 UTC (rev 16236)
+++ trunk/buildroot/package/xorg/xorg.mk	2006-09-27 18:17:31 UTC (rev 16237)
@@ -51,21 +51,29 @@
 # figure out Xorg's idea of corresponding architecture name
 ifeq ($(BR2_alpha),y)
 XARCH=Alpha
-else ifeq ($(BR2_arm),y)
+endif
+ifeq ($(BR2_arm),y)
 XARCH=Arm32
-else ifeq ($(BR2_armeb),y)
+endif
+ifeq ($(BR2_armeb),y)
 XARCH=Arm32
-else ifeq ($(BR2_i386),y)
+endif
+ifeq ($(BR2_i386),y)
 XARCH=i386A
-else ifeq ($(BR2_mips),y)
+endif
+ifeq ($(BR2_mips),y)
 XARCH=Mips
-else ifeq ($(BR2_mipsel),y)
+endif
+ifeq ($(BR2_mipsel),y)
 XARCH=Mips
-else ifeq ($(BR2_powerpc),y)
+endif
+ifeq ($(BR2_powerpc),y)
 XARCH=Ppc
-else ifeq ($(BR2_sparc),y)
+endif
+ifeq ($(BR2_sparc),y)
 XARCH=Sparc
-else ifeq ($(BR2_x86_64),y)
+endif
+ifeq ($(BR2_x86_64),y)
 XARCH=AMD64
 endif
 
