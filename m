From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:40:16 +0100
Subject: [Buildroot] [git commit] rt-tests: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
Message-ID: <20140228133415.DEF2A9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe061a9898369389cabca340ce00fd62b0e8481d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 58a88a8..461e6de 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# priority-inheritance mutex needs NPTL
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	# no NPTL for these archs
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -23,7 +19,5 @@ config BR2_PACKAGE_RT_TESTS
 
 	  http://rt.wiki.kernel.org
 
-comment "rt-tests needs a toolchain w/ threads"
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rt-tests needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
