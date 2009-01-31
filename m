From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 12:30:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20090131123003.248B376219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 12:30:02 +0000 (Sat, 31 Jan 2009)
New Revision: 25178

Log:
grub: revert r21974 (features.h should never be included explicitly)

features.h (or something including it) is needed for __UCLIBC* to get
defined - E.G. without that the build breaks without largefile support.

Nigel, what was the reason for your commit and what file not found error
did you see?

Modified:
   trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
===================================================================
--- trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2009-01-31 12:29:55 UTC (rev 25177)
+++ trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2009-01-31 12:30:02 UTC (rev 25178)
@@ -5,7 +5,7 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
  
-+/* #include <features.h> - NK */
++#include <features.h>
 +#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
  /* Try to use glibc's transparant LFS support. */
  #define _LARGEFILE_SOURCE	1
@@ -22,7 +22,7 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
  
-+/* #include <features.h> - NK */
++#include <features.h>
 +#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
  /* Try to use glibc's transparant LFS support. */
  #define _LARGEFILE_SOURCE       1
