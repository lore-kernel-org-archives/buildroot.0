From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:16:34 +0100
Subject: [Buildroot] [git commit] package/x265: bump version to 2.7
Message-ID: <20180305200719.BEF9681012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f2dbcd3c700c29d8fdfb8761add76c14906cd71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched to nasm:
https://mailman.videolan.org/pipermail/x265-devel/2018-March/011615.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 3e44b03692..e6f22db646 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 2e53259b504a7edb9b21b9800163b1ff4c90e60c74e23e7001d423c69c5d3d17  x265_2.5.tar.gz
+sha256 d5e75fa62ffe6ed49e691f8eb8ab8c1634ffcc0725dd553c6fdb4d5443b494a2  x265_2.7.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ae570e6e4c..243025c08b 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.5
+X265_VERSION = 2.7
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
@@ -13,7 +13,7 @@ X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-X265_DEPENDENCIES += host-yasm
+X265_DEPENDENCIES += host-nasm
 endif
 
 # disable altivec, it has build issues
