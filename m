From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 12 May 2008 11:56:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20080512185612.873053C5D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-05-12 11:56:11 -0700 (Mon, 12 May 2008)
New Revision: 21974

Log:
features.h should never be included explicitly. 
This fixes the bug where "File not found" error is reported by grub.
This fix works under both uclibc and glibc.


Modified:
   trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
===================================================================
--- trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2008-05-12 14:35:56 UTC (rev 21973)
+++ trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2008-05-12 18:56:11 UTC (rev 21974)
@@ -5,7 +5,7 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
  
-+#include <features.h>
++/* #include <features.h> - NK */
 +#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
  /* Try to use glibc's transparant LFS support. */
  #define _LARGEFILE_SOURCE	1
@@ -22,7 +22,7 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
  
-+#include <features.h>
++/* #include <features.h> - NK */
 +#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
  /* Try to use glibc's transparant LFS support. */
  #define _LARGEFILE_SOURCE       1
