From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 10:37:30 +0100
Subject: [Buildroot] [git commit] rt-tests: needs MMU
Message-ID: <20141121115056.BDBBE7FBFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=919e0d69f748549ccac1b6280932361764bc7423
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/123/12341a8b9c5696bbb392d8b891e013b5023f4105/
http://autobuild.buildroot.net/results/99b/99b81af510fcbe2eb948600d5ad7eaa0aad39352/
http://autobuild.buildroot.net/results/a62/a62b810958c80c4ac95ec2b5404e58505e5a942b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 34669b2..db5e0a0 100644
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
