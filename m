From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 11:39:29 +0200
Subject: [Buildroot] [PATCH 1/4] package/genimage: bump version
In-Reply-To: <20190424093933.6212-1-thomas.petazzoni@bootlin.com>
References: <20190424093933.6212-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190424093933.6212-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps the genimage version to a not yet released commit,
in order to benefit from the GPT support that was added in upstream
genimage.

Indeed, we are about to add a defconfig for the STM32MP157 Discovery
Kit platform and the STM32MP157 BootROM loads the first stage
bootloader from the GPT partitions named fsbl*, which requires a GPT
partition table.

We will of course be able to switch back to a released version once a
release that includes GPT support will have been done upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 095eb1413f..00af52486b 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5a36b2c1387007c2d6535a722ee257a387d0913bddcf8a94d460e6acd4d01859	genimage-10.tar.xz
+sha256	fd19ef94a82a014178255e181af91b403be6bebf217bae4c2541dbeeb1d4e1c9  genimage-abc1c32378debaccdfb63c711de56f3a1becb84b.tar.gz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 393c3e9b94..35502532f9 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 10
-GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
+GENIMAGE_VERSION = abc1c32378debaccdfb63c711de56f3a1becb84b
+GENIMAGE_SITE = $(call github,pengutronix,genimage,$(GENIMAGE_VERSION))
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
+# fetching from git
+GENIMAGE_AUTORECONF = YES
 GENIMAGE_LICENSE = GPL-2.0
 GENIMAGE_LICENSE_FILES = COPYING
 
-- 
2.20.1
