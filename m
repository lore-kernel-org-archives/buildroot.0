From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:25:18 +0100
Subject: [Buildroot] [git commit] boot/optee-os: bump version to 3.7.0
Message-ID: <20191029212237.DF50C8D4D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8483dff1b37a4e5dabcf2c9e6f26516c056f185d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE OS package version to OP-TEE release 3.7.0.

This adds host-python-pyelftools to optee-os dependencies

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 boot/optee-os/optee-os.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 18b81ab01d..669bbda924 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.5.0"
+	bool "3.7.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.5.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.7.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 1c8f5d6b31..dc0fbecce7 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.5.0.tar.gz
-sha256 a02fe8e7fdee9653e9207059071735a839b1255fdaf311a2a6cfd185a4cee6a2  optee-os-3.5.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.7.0.tar.gz
+sha256 ff378f22b8e7dacf933a2d34eb5c1bdcafe74bdda692e4dbc2969301f6a81d43  optee-os-3.7.0.tar.gz
 # Locally computed
 sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 28f5add480..bedde85212 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -19,7 +19,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto
+OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto host-python-pyelftools
 
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
