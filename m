From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 22:09:01 +0100
Subject: [Buildroot] [PATCH v2 3/6] rt-tests: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392757744-29984-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/Config.in | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

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
-- 
1.8.3.2
