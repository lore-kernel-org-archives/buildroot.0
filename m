From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jul 2016 11:10:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to 1.5.0
Message-ID: <1469869822-19130-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to 1.6.0 is not possible atm because ffmpeg fails to compile
with it. Patches to solve the problem were committed to ffmpeg master:

http://git.videolan.org/?p=ffmpeg.git;a=commit;h=293676c476733e81d7b596736add6cd510eb6960
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=c5d326f551b0312ff581bf1df35b21d956e01523

Backporting fails so let's just wait for the next ffmpeg bump to bump
libopenh264 as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index cb87188..6d7c40b 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a1b9a7a7f1ee204793c613789a505f0971bc2b03b3dbd8f05d9c4a3f3b900a22  libopenh264-v1.4.0.tar.gz
+sha256 98077bd5d113c183ce02b678733b0cada2cf36750370579534c4d70f0b6c27b5  libopenh264-v1.5.0.tar.gz
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index cbe30bc..6f1c7a6 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = v1.4.0
+LIBOPENH264_VERSION = v1.5.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2c
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.8.1
