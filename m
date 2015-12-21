From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:04:15 +0100
Subject: [Buildroot] [git commit] picocom: bump to version 2.1
Message-ID: <20151221220421.6CDD38256D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f44d4fd6ff2510d1f2eafb9efdf5739018e61a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove no longer needed patch (merged upstream before the release
of v2.1).

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/picocom/picocom.hash | 3 +--
 package/picocom/picocom.mk   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 7eada03..674b620 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 e0f7095c118f43c1c09787a16ef5c7d4c4ad4457dd3b1281efcc4cdb8906af9a  picocom-2.0.tar.gz
-sha256 37746613c05ecf4058c989ef7042b85ef0308886f3731a9dfffdadd19cc9ecfb  2c4c2317592daac97aac6669fd7b68e07a3dbec6.patch
+sha256 6b152fc5f816eaef6b86336a4cec7cf1496b7c712061e5aea5a36f143a0b09ed  picocom-2.1.tar.gz
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 106de94..59a749f 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 2.0
+PICOCOM_VERSION = 2.1
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
-PICOCOM_PATCH = https://github.com/npat-efault/picocom/commit/2c4c2317592daac97aac6669fd7b68e07a3dbec6.patch
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
