From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 23:26:30 +0200
Subject: [Buildroot] [git commit] package/bcm2835: bump version to 1.65
Message-ID: <20200603212826.188BD82960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e25490fc4e658167dbfb062a0d16873d3b00c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since 1.63:
 - 1.64 2020-04-11 Fixed error in definitions of BCM2835_AUX_SPI_STAT_TX_LVL
   and BCM2835_AUX_SPI_STAT_RX_LVL
 - 1.65, 1.66 2020-04-16 Added support for use of capability cap_sys_rawio
   to determine if access to /dev/mem is available for non-root users

That latter part (using capabilities) is not supported, because it is
broken upstream (the code is messed up using two similar #defines to
test and enable it; messy...) Since it previously required root access
to work, and still does now, this is not a regression, so do not add
support for capablities.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: explain why we don't support capabilities]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index c722a97456..8317e10256 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aec4b33ed9ecda4a1c4c12b8ed2abdd13cf87f352f0d27a24be726d11f1fbf54  bcm2835-1.63.tar.gz
+sha256  62955cc8506cc6506d729da3138442beb9763f1ffd536e925aeb0dc223492874  bcm2835-1.65.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index f75b2fc69e..2ef6d94b38 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.63
+BCM2835_VERSION = 1.65
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
