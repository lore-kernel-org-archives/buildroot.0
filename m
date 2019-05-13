From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 13 May 2019 22:15:58 +0200
Subject: [Buildroot] [PATCH 2/6] boot/optee-os: bump version to 3.5.0
In-Reply-To: <20190513201602.2549-1-etienne.carriere@linaro.org>
References: <20190513201602.2549-1-etienne.carriere@linaro.org>
Message-ID: <20190513201602.2549-2-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to OP-TEE OS package version to release 3.5.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/3.5.0/optee-os.hash | 4 ++++
 boot/optee-os/Config.in           | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 boot/optee-os/3.5.0/optee-os.hash

diff --git a/boot/optee-os/3.5.0/optee-os.hash b/boot/optee-os/3.5.0/optee-os.hash
new file mode 100644
index 0000000000..167f96475d
--- /dev/null
+++ b/boot/optee-os/3.5.0/optee-os.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_os/archive/3.5.0.tar.gz
+sha256 a02fe8e7fdee9653e9207059071735a839b1255fdaf311a2a6cfd185a4cee6a2  optee-os-3.5.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 2f129bcc59..1e54a2cee4 100644
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
 
-- 
2.17.1
