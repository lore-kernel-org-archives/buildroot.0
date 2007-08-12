From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:38:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20070812233826.A9F80A685E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:38:26 -0700 (Sun, 12 Aug 2007)
New Revision: 19480

Log:
Bump version of lvm2

Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2007-08-12 23:36:57 UTC (rev 19479)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2007-08-12 23:38:26 UTC (rev 19480)
@@ -23,8 +23,8 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LVM2_BASEVER=2.01
-LVM2_PATCH=15
+LVM2_BASEVER=2.02
+LVM2_PATCH=26
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
@@ -46,6 +46,11 @@
 	(cd $(LVM2_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		ac_cv_have_decl_malloc=yes \
+		gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
