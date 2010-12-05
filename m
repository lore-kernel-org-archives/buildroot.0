From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:40 +0100
Subject: [Buildroot] [PATCH 09/55] Stop referencing the crazy target/device
	stuff
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't need Config.in and Makefile in target/device: defconfig files
are sufficient to describe the specificities of a board (architecture,
compilation flags, bootloader and kernel details, etc.).

However, a placeholder such as target/device will be kept in order to
host things such as kernel configuration files or various
board-specific patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in          |    1 -
 target/Makefile.in |    3 ---
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 1a27fc0..4214112 100644
--- a/Config.in
+++ b/Config.in
@@ -11,7 +11,6 @@ config BR2_VERSION
 	option env="BR2_VERSION_FULL"
 
 source "target/Config.in.arch"
-source "target/device/Config.in"
 
 menu "Build options"
 
diff --git a/target/Makefile.in b/target/Makefile.in
index aab9d39..915d625 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -1,6 +1,3 @@
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
 
-# this eventually adds the kernel target to TARGETS:
-include target/device/Makefile.in
-include target/xtensa/Makefile.in
-- 
1.7.0.4
