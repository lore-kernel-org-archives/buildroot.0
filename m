From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Dec 2017 17:22:30 +0100
Subject: [Buildroot] [PATCH] binaries-marvell: bump version,
 add license file and hash
Message-ID: <20171208162230.16647-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following our feedback, Marvell has added a README.md file into the
branch that contains the firmware. Thereore, this commit bumps the
version to the commit that includes the README.md file (it's the only
change, the firmware files are unmodified), updates
<pkg>_LICENSE_FILES to point to README.md, and adds the hash for this
license files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/binaries-marvell/binaries-marvell.hash | 3 ++-
 boot/binaries-marvell/binaries-marvell.mk   | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
index 401584dacd..94c66039c9 100644
--- a/boot/binaries-marvell/binaries-marvell.hash
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 22a201542d8f93cf88623065db5f3377822b59cbfdf98a8e60cdee629273d3a0 binaries-marvell-0dabe23b956420b0928d337d635f0cd5646c33d0.tar.gz
+sha256 7c41cddc2ce46038b630b59d2e9e50e903d27032bcfbf38019eaed14fcfdbe40 binaries-marvell-a8ac27b7884ed2c1efcf9f3326de3e0ed7b94e91.tar.gz
+sha256 d8560ab4ea4042a55eee6857ded1d7e4bca2d9120b8c7a86d2a7fdc4ba4994e0	README.md
diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
index e2bd4f2499..152c9cd97a 100644
--- a/boot/binaries-marvell/binaries-marvell.mk
+++ b/boot/binaries-marvell/binaries-marvell.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-BINARIES_MARVELL_VERSION = 0dabe23b956420b0928d337d635f0cd5646c33d0
+BINARIES_MARVELL_VERSION = a8ac27b7884ed2c1efcf9f3326de3e0ed7b94e91
 BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
 
-# The license text is only available in the master branch, which is
-# not used in this package. See
-# https://raw.githubusercontent.com/MarvellEmbeddedProcessors/binaries-marvell/master/README.md.
 BINARIES_MARVELL_LICENSE = GPL-2.0 with freertos-exception-2.0
+BINARIES_MARVELL_LICENSE_FILES = README.md
 
 BINARIES_MARVELL_IMAGE = $(call qstrip,$(BR2_TARGET_BINARIES_MARVELL_IMAGE))
 BINARIES_MARVELL_INSTALL_IMAGES  = YES
-- 
2.14.3
