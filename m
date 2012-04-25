From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 09:00:42 +0200
Subject: [Buildroot] [git commit] gcc: move version/snap variables to
	gcc-uclibc-4.x.mk
Message-ID: <20120425075811.EFDAE8A6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b563d481fbeeabc1c904e2398ec99a453faf6f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Makefile.in       |    6 ------
 toolchain/gcc/gcc-uclibc-4.x.mk |    8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index c3f4576..3e82a32 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -3,15 +3,9 @@
 # So include them in this file and arrange to include it
 # soon after invoking make from the top level.
 
-GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 EXTRA_GCC_CONFIG_OPTIONS:=$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-ifeq ($(call qstrip,$(BR2_GCC_VERSION_SNAP)),y)
-GCC_SNAP_DATE:=$(call qstrip,$(BR2_GCC_SNAP_DATE))
-else
-GCC_SNAP_DATE:=
-endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 212660c..3d0228d 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -17,6 +17,14 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
+GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
+
+ifeq ($(BR2_GCC_VERSION_SNAP),y)
+GCC_SNAP_DATE:=$(call qstrip,$(BR2_GCC_SNAP_DATE))
+else
+GCC_SNAP_DATE:=
+endif
+
 ifneq ($(GCC_SNAP_DATE),)
  GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
