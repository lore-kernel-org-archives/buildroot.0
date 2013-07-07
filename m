From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 22:48:38 +0200
Subject: [Buildroot] [git commit] gcc: re-add upstream URL for arc specific
	gcc variant
Message-ID: <20130707205041.9C0A69A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a74eed067593aa3c7726e23f1f85f527b7195f76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got dropped in the gcc -> packages work.

Fixes http://autobuild.buildroot.net/results/08e/08e8149c9889141d644896e1fd3e0d2f14299033/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 968354b..d38629d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -19,6 +19,8 @@ ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
+else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
+GCC_SITE = $(BR2_ARC_SITE)
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
