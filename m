From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:15:41 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libseccomp: bump
 to version 2.4.1
Message-ID: <20191030091111.157CD8DEEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa672ffa47b9eb2817477cfcc3e410ed48de7401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes a BPF generation bug where the optimizer mistakenly identified
duplicate BPF code blocks.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d5787d1ab149a3092a6cb580eeabc96d12f6a8bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/libseccomp.hash | 2 +-
 package/libseccomp/libseccomp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 0823903c36..39c5f8aa38 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b7ee0299157fb7a6a81c99f2e0d7e64429b7d7c0eae43c3a6ef91e87eeed2868 libseccomp-v2.4.0.tar.gz
+sha256 36aa502c0461ae9efc6c93ec2430d6badd9bf91ecbe73806baf7b7c6f687ab4f libseccomp-2.4.1.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 90b981f042..491e51b375 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.4.0
-LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
+LIBSECCOMP_VERSION = 2.4.1
+LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,v$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
