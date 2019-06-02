From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:44 -0000
Subject: [Buildroot] [git commit] boot/optee-os: bump version to 3.5.0
Message-ID: <20190602201233.B754D8EDEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f274d52a590591f3c4d976466182cf11b6ddc28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE OS package version to OP-TEE release 3.5.0.

The hash of the license file changed due to a fairly minor change in
the file:

  -Unless it has its own copyright/license embedded in its body, each source file
  +Unless it has its own copyright/license embedded in its body, each file

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: update the license file hash]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/3.4.0/optee-os.hash | 4 ----
 boot/optee-os/Config.in           | 4 ++--
 boot/optee-os/optee-os.hash       | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/optee-os/3.4.0/optee-os.hash b/boot/optee-os/3.4.0/optee-os.hash
deleted file mode 100644
index 07afdfac8f..0000000000
--- a/boot/optee-os/3.4.0/optee-os.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.4.0.tar.gz
-sha256 51d42ac7aa780ec8d8ee471eff689a29a7621aacace046722b1490b62ec2d481  optee-os-3.4.0.tar.gz
-# Locally computed
-sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a1f1b910ac..c17c698a9a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.4.0"
+	bool "3.5.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.4.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.5.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
new file mode 100644
index 0000000000..1c8f5d6b31
--- /dev/null
+++ b/boot/optee-os/optee-os.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_os/archive/3.5.0.tar.gz
+sha256 a02fe8e7fdee9653e9207059071735a839b1255fdaf311a2a6cfd185a4cee6a2  optee-os-3.5.0.tar.gz
+# Locally computed
+sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
