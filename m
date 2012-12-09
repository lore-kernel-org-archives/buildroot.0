From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:52:44 +0100
Subject: [Buildroot] [git commit] rt-tests: requires thread support in the
	toolchain
Message-ID: <20121209210012.B6F9D9A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c2a5ba33edd710ce58e56f81214699e56dca233
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rt-tests package extensively use threads, so this package should
only be available if the toolchain has thread support.

[Peter: add comment when not available]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rt-tests/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index e645266..5c8a782 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -11,3 +12,6 @@ config BR2_PACKAGE_RT_TESTS
 	  Buildroot configuration.
 
 	  http://rt.wiki.kernel.org
+
+comment "rt-tests requires a toolchain with threads support"
+	!BR2_TOOLCHAIN_HAS_THREADS
