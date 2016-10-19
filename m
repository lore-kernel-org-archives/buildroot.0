From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:57:18 +0200
Subject: [Buildroot] [git commit] liburcu: needs MMU
Message-ID: <20161019155725.451EF81E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a25ecc3c9f6b3b5e93e70e2be376e5c82d935a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test_urcu_fork.c test calls fork(). Upstream provides no easy way to
disable tests build.

Fixes:
http://autobuild.buildroot.net/results/9eb/9eb182ab2d0b396eeff3d637a040da5a4d5bdcd7/
http://autobuild.buildroot.net/results/47a/47aabc219a2fd50105881b1e2715f7eeb1a6a588/
http://autobuild.buildroot.net/results/566/56631605f76b8623c9674f25c529ac67d0de12a8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 49510da..b5b6326 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	bool
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_USE_MMU # fork() in test
 	default y
 
 config BR2_PACKAGE_LIBURCU
