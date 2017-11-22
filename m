From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:16:55 +0100
Subject: [Buildroot] [git commit branch/next] gptfdisk: bump to version 1.0.3
Message-ID: <20171122210934.C31088148D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=126457aaf501c14b8d3a61732bb8f53e69189dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version has a new command line argument to sgdisk, -j, that lets one
change the starting address of where the GPT partition table entries are
stored.

The iMX SoC ROM loader, and perhaps others, expects the bootloader to start
at sector 2.  Using this option with gptfdisk lets the table entries move
to make space for the bootloader image.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.hash | 8 ++++----
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index c3a38af..d55797c 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.1/
-md5 d7f3d306b083123bcc6f5941efade586  gptfdisk-1.0.1.tar.gz
-sha1 ad28c511c642235815b83fffddf728c117057cba  gptfdisk-1.0.1.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.3/
+md5 07b625a583b66c8c5840be5923f3e3fe  gptfdisk-1.0.3.tar.gz
+sha1 9a74bbe7805d562316e92417f71e4b03155308e6  gptfdisk-1.0.3.tar.gz
 # Locally computed
-sha256 864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fdfaeac7  gptfdisk-1.0.1.tar.gz
+sha256 89fd5aec35c409d610a36cb49c65b442058565ed84042f767bba614b8fc91b5c  gptfdisk-1.0.3.tar.gz
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index a7bc41c..b669e22 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.1
+GPTFDISK_VERSION = 1.0.3
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
