From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Nov 2011 22:29:46 +0100
Subject: [Buildroot] [git commit] uClibc: remove trailer from
	linuxthreads-errno patches confusing modern patch
Message-ID: <20111124213621.C56A58F683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1db649c6feb27568655f70452c2fad3e75584508
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Modern versions of patch (2.6.1.81 / 85 tested) gets confused by the empty
git trailer referencing uClibc_errno.h (from when patch was forward ported
from 0.9.31), so drop it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.32-linuxthreads-errno-fix.patch     |    2 --
 .../uClibc.snapshot.linuxthreads-errno-fix.patch   |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
index 7335173..c4d0d00 100644
--- a/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
+++ b/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
@@ -63,8 +63,6 @@ index 6e520fa..f4a9ebb 100644
  
  #  ifdef __UCLIBC_HAS_THREADS__
  /* When using threads, errno is a per-thread value.  */
-diff --git a/libc/sysdeps/linux/common/bits/uClibc_errno.h b/libc/sysdeps/linux/common/bits/uClibc_errno.h
-index 9c15618..79eb7e6 100644
 -- 
 1.7.1
 
diff --git a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
index 7335173..c4d0d00 100644
--- a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
+++ b/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
@@ -63,8 +63,6 @@ index 6e520fa..f4a9ebb 100644
  
  #  ifdef __UCLIBC_HAS_THREADS__
  /* When using threads, errno is a per-thread value.  */
-diff --git a/libc/sysdeps/linux/common/bits/uClibc_errno.h b/libc/sysdeps/linux/common/bits/uClibc_errno.h
-index 9c15618..79eb7e6 100644
 -- 
 1.7.1
 
