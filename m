From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 12:45:21 +0100
Subject: [Buildroot] [git commit] gcc: fix location of snapshots
Message-ID: <20130324130049.5B20E9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e30c5bc58e35b1043f0fe619b6aca122558344d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gcc snapshots are now located at
ftp://gcc.gnu.org/pub/gcc/snapshots/. This has been tested with a
recent 4.8.0-RC snapshot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index bdc38cd..3bfa13b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -26,7 +26,7 @@ GCC_SNAP_DATE:=
 endif
 
 ifneq ($(GCC_SNAP_DATE),)
- GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
+ GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
 else
