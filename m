From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:16:45 +0200
Subject: [Buildroot] [git commit] package/intel-microcode: security bump to
 version 20190514a
Message-ID: <20190520191051.A7CA884658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc01d562d3f40c145b0d50c118f7b8b862881a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes MDS mitigation (RIDL, Fallout, Zombieload), INTEL-SA-00223

Move to the Intel github repo as this release is not yet available on
downloadmirror.intel.com.

Update license hash because of copyright year and DOS/UNIX newlines change.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-microcode/Config.in            | 2 ++
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 6 ++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/intel-microcode/Config.in b/package/intel-microcode/Config.in
index 495ebd727f..3f9199ec93 100644
--- a/package/intel-microcode/Config.in
+++ b/package/intel-microcode/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_INTEL_MICROCODE
 	  This package provides an Intel microcode data file that can be
 	  used to correct processor errors. The iucode-tool package and
 	  proper kernel support are required to upload the microcode.
+
+	  https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files
diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 183ba5aeec..257cc85c41 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 46ab18699ec42eb6cc01ee1846ec4d7ca979766dee2156f92d69e2f6df548137  microcode-20180807a.tgz
-sha256 c4698c6105d59fec11ad0929e77a003445c560c7706c089990030acbf10c9372  license
+sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-microcode-20190514a.tar.gz
+sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index ed4ad628dd..aa3b1f4dbb 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20180807a
-INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = https://downloadmirror.intel.com/28087/eng
-INTEL_MICROCODE_STRIP_COMPONENTS = 0
+INTEL_MICROCODE_VERSION = microcode-20190514a
+INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
 INTEL_MICROCODE_REDISTRIBUTE = NO
