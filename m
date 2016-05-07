From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:29:10 +0200
Subject: [Buildroot] [git commit] bluez5_utils: bump to version 5.39
Message-ID: <20160507122957.D682881838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faec6b0001c2c678701896845f06e5a7e822982b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstreamed patch

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-tools-avinfo-Fix-big-endian-build.patch   | 39 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch b/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
deleted file mode 100644
index 06c368d..0000000
--- a/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 01d85fdf6a45150e82143803be3373d779d18522 Mon Sep 17 00:00:00 2001
-From: John Keeping <john@metanate.com>
-Date: Wed, 24 Feb 2016 13:57:38 +0000
-Subject: [PATCH] tools/avinfo: Fix big endian build
-
-Commit 101b439 (tools/avinfo: Add partial support for Sony LDAC) added a
-new a2dp_ldac_t structure but only inside a little endian ifdef.  Add
-the same structure in the big endian code.
-
-The structure definition doesn't differ for the big/little endian cases
-but if the unknown fields are discovered in the future it might, so a
-copy is added rather than pulling the existing definition below the
-endif.
-
-[John: backport from upstream commit 01d85fdf6a45150e82143803be3373d779d18522.]
-Signed-off-by: John Keeping <john@metanate.com>
----
- profiles/audio/a2dp-codecs.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/profiles/audio/a2dp-codecs.h b/profiles/audio/a2dp-codecs.h
-index e9da0bf..4fb5c0c 100644
---- a/profiles/audio/a2dp-codecs.h
-+++ b/profiles/audio/a2dp-codecs.h
-@@ -234,6 +234,11 @@ typedef struct {
- 	uint8_t channel_mode:4;
- } __attribute__ ((packed)) a2dp_aptx_t;
- 
-+typedef struct {
-+	a2dp_vendor_codec_t info;
-+	uint8_t unknown[2];
-+} __attribute__ ((packed)) a2dp_ldac_t;
-+
- #else
- #error "Unknown byte order"
- #endif
--- 
-2.7.0.226.gfe986fe
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 75c53b3..cbb3aa3 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0    bluez-5.37.tar.xz
+sha256  21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b    bluez-5.39.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1308e4e..0a76738 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.37
+BLUEZ5_UTILS_VERSION = 5.39
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
