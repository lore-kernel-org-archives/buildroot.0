From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Oct 2016 12:35:02 +0300
Subject: [Buildroot] [PATCH v2] liburcu: needs MMU
Message-ID: <8a309fcafc9f624385affeb31aac21249e1feb68.1476869702.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test_urcu_fork.c test calls fork(). Upstream provides no easy way to
disable tests build.

Fixes:
http://autobuild.buildroot.net/results/9eb/9eb182ab2d0b396eeff3d637a040da5a4d5bdcd7/
http://autobuild.buildroot.net/results/47a/47aabc219a2fd50105881b1e2715f7eeb1a6a588/
http://autobuild.buildroot.net/results/566/56631605f76b8623c9674f25c529ac67d0de12a8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: move MMU dependency to BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS (ThomasP)
---
 package/liburcu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 49510da4956c..b5b632687851 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	bool
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_USE_MMU # fork() in test
 	default y
 
 config BR2_PACKAGE_LIBURCU
-- 
2.9.3
