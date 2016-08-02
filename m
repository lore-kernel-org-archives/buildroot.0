From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Aug 2016 19:25:55 +0200
Subject: [Buildroot] [RFC] toolchain: libatomic needs NTPL threads support
Message-ID: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cairo package fail to build when BR2_TOOLCHAIN_HAS_LIBATOMIC is set and
BR2_TOOLCHAIN_HAS_THREADS_NPTL is not set:
m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -latomic

Fixes:
[arm]
http://autobuild.buildroot.net/results/3d8dc45e41a043d2c2c26bfb26c3617499fbe671
[m68k]
http://autobuild.buildroot.net/results/318e01406e3e92eb589ee5b2231c671a4dbb6da4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 5611b5b..42fee61 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -407,7 +407,7 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
-		BR2_TOOLCHAIN_HAS_THREADS
+		BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
-- 
2.5.5
