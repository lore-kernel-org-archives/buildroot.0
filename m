From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu, 12 Apr 2007 19:04:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070413020433.38A534807B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-04-12 19:04:32 -0700 (Thu, 12 Apr 2007)
New Revision: 18422

Log:
If using an external toolchain, don't include any of this stuff.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-04-12 21:20:25 UTC (rev 18421)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-04-13 02:04:32 UTC (rev 18422)
@@ -17,6 +17,8 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+
 ifeq ($(GCC_SNAP_DATE),)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)
 GCC_SITE:=http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)
@@ -443,3 +445,5 @@
 
 gcc_target-dirclean:
 	rm -rf $(GCC_BUILD_DIR3)
+
+endif
