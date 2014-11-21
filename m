From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Nov 2014 09:20:57 +0200
Subject: [Buildroot] [PATCH] rt-tests: needs MMU
Message-ID: <60346af1d4c12a7b907b8a0ce09243bc708c866c.1416554457.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/123/12341a8b9c5696bbb392d8b891e013b5023f4105/
http://autobuild.buildroot.net/results/99b/99b81af510fcbe2eb948600d5ad7eaa0aad39352/
http://autobuild.buildroot.net/results/a62/a62b810958c80c4ac95ec2b5404e58505e5a942b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rt-tests/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 34669b243d3c..db5e0a04e36d 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -27,3 +28,4 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 
 comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
2.1.3
