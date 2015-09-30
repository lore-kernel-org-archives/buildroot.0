From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 1 Oct 2015 00:13:13 +0300
Subject: [Buildroot] [RFC 2/2] remove download suppression from mke2img and
	skeleton
In-Reply-To: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
Message-ID: <1b24de4a1afafff779eebb3cbe551dc18f8a2993.1443645945.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With non-versioned packages patch applied, there is no need
to set empty _SOURCE.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/mke2img/mke2img.mk   | 1 -
 package/skeleton/skeleton.mk | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
index 04aaa8f..9de387a 100644
--- a/package/mke2img/mke2img.mk
+++ b/package/mke2img/mke2img.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-HOST_MKE2IMG_SOURCE =
 HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define HOST_MKE2IMG_INSTALL_CMDS
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 48e7085..c182b54 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-SKELETON_SOURCE =
-
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
-- 
2.0.3
