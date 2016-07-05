From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:16:16 +0200
Subject: [Buildroot] [git commit] uclibc: enable Linuxthreads for Blackfin
Message-ID: <20160705101622.0827382133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6565825f27834cf8346b8e9222551f7b6427873d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable Linuxthreads, a small binutils patch from upstream is
required.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index c0cb602..7c99195 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -59,7 +59,7 @@ choice
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
+		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
