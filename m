From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 May 2013 23:51:05 +0200
Subject: [Buildroot] [git commit] gcc: fix gcc 4.8 build when thread support
	is disabled
Message-ID: <20130527221100.A0BA29A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=517de29c523cd3561e723228a50aa414d3dc3fe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When thread support is disabled, the libitm and libatomic libraries
from gcc should be disabled, otherwise, the build of gcc fails.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 21679ef..5be26c4 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -203,7 +203,7 @@ GCC_TLS:=--disable-tls
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads
+THREADS:=--disable-threads --disable-libitm --disable-libatomic
 else
 THREADS:=--enable-threads
 endif
