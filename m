From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 09:38:58 +0200
Subject: [Buildroot] [PATCH v2 3/7] boot/optee-os: dump to OP-TEE 3.5.0
In-Reply-To: <20190514073902.3775-1-etienne.carriere@linaro.org>
References: <20190514073902.3775-1-etienne.carriere@linaro.org>
Message-ID: <20190514073902.3775-3-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dump to OP-TEE OS 3.5.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
- Move hash file to package root dir
- Remove old 3.4.0/ subdir
---
 boot/optee-os/3.4.0/optee-os.hash | 4 ----
 boot/optee-os/Config.in           | 4 ++--
 boot/optee-os/optee-os.hash       | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 boot/optee-os/3.4.0/optee-os.hash
 create mode 100644 boot/optee-os/optee-os.hash

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
index 4cb05798e5..bd685b58bf 100644
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
index 0000000000..167f96475d
--- /dev/null
+++ b/boot/optee-os/optee-os.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_os/archive/3.5.0.tar.gz
+sha256 a02fe8e7fdee9653e9207059071735a839b1255fdaf311a2a6cfd185a4cee6a2  optee-os-3.5.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
-- 
2.17.1
