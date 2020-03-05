From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:39:52 +0100
Subject: [Buildroot] [git commit] package/bcm2835: bump version to 1.62
Message-ID: <20200305222756.43F458F65C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cbf70366f5d1faea694626df7bbb018bb42d36a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog (since 1.60):
  - 1.61 2020-01-11 Fixed errors in the documentation for bcm2835_spi_write.
    Fixes issue seen on Raspberry Pi 4 boards where 64-bit off_t is used by
    default via -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64. The offset was
    being incorrectly converted, this way is clearer and fixes the problem.
    Contributed by Jonathan Perkin.
  - 1.62 2020-01-12 Fixed a problem that could cause compile failures with
    size_t and off_t

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcm2835/bcm2835.hash | 4 ++--
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 3926d63bb0..025ef8be40 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 333e7ceee895e910c29098074773ee86bcab4a82c2af0cf083c4533767e52d27 bcm2835-1.60.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  7beacda787d6073d0982bfe576c318bb2730700f7d0f7950c6e763dfcb06e0e5  bcm2835-1.62.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 82238ee528..2435a42c95 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.60
+BCM2835_VERSION = 1.62
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-2.0
 BCM2835_LICENSE_FILES = COPYING
