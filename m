From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Stop referencing the crazy
	target/device stuff
Message-ID: <20101217160157.56E248E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a5f2d6d7a7d9547f468cb31b22854bcfda28610
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need Config.in and Makefile in target/device: defconfig files
are sufficient to describe the specificities of a board (architecture,
compilation flags, bootloader and kernel details, etc.).

However, a placeholder such as target/device will be kept in order to
host things such as kernel configuration files or various
board-specific patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in          |    1 -
 target/Makefile.in |    3 ---
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index de4ff4a..874c20a 100644
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
1.7.2.2
