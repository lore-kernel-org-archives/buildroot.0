From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:48:13 +0100
Subject: [Buildroot] [git commit] package/spidev_test: remove 'v' prefix
Message-ID: <20191027104200.CEAF988F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4304b7a605fe684893075765d74430b6706ab42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spidev_test/spidev_test.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index bf8170cd2c..80998f3400 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -11,15 +11,15 @@
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
-SPIDEV_TEST_VERSION = v4.10
+SPIDEV_TEST_VERSION = 4.10
 SPIDEV_TEST_PATH = tools/spi
 else
-SPIDEV_TEST_VERSION = v3.0
+SPIDEV_TEST_VERSION = 3.0
 SPIDEV_TEST_PATH = Documentation/spi
 endif
 
 SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/$(SPIDEV_TEST_PATH)
-SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
+SPIDEV_TEST_SOURCE = spidev_test.c?id=v$(SPIDEV_TEST_VERSION)
 SPIDEV_TEST_LICENSE = GPL-2.0
 
 # musl libc requires linux/ioctl.h for _IOC_SIZEBITS. Do a sed patch to keep
