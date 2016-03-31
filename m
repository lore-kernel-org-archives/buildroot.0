From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:56:32 +0200
Subject: [Buildroot] [git commit] uclibc: enable linuxthreads for xtensa
Message-ID: <20160331015641.C906E80789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8706e865d8e62fd2334d0fd560b8d78c1985c1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linuxthreads is the only threading option for noMMU xtensa, enable it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 1448037..eac5d05 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -64,7 +64,7 @@ choice
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k || BR2_arm || BR2_armeb
+		depends on BR2_m68k || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
