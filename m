From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:13:59 +0100
Subject: [Buildroot] [PATCH 4/8] rt-tests: not available on avr32,
	too old uClibc
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <888c187be8b5ed6f62a1a7b8c825a980009fb365.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old uClibc used for the AVR32 architecture does not implement
priority inheritance, therefore rt-tests cannot build.

Fixes:

  http://autobuild.buildroot.org/results/695293d889128c666174d5fe03c5deadbe4d5415/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/Config.in |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 337c020..54cb8d0 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Too old uClibc, does not provide priority-inheritance
+	# mutexes
+	depends on !BR2_avr32
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
-- 
1.7.9.5
