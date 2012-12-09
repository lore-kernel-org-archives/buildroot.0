From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:53:35 +0100
Subject: [Buildroot] [git commit] rt-tests: not available on avr32,
	too old uClibc
Message-ID: <20121209210012.D84A99A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98e16e7849e5ad63ce084e0564c84233793e6cc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old uClibc used for the AVR32 architecture does not implement
priority inheritance, therefore rt-tests cannot build.

Fixes:

  http://autobuild.buildroot.org/results/695293d889128c666174d5fe03c5deadbe4d5415/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rt-tests/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 5c8a782..c253339 100644
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
