From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:13:35 +0200
Subject: [Buildroot] [git commit] ti-sgx-km: rename options to have proper
 prefix
Message-ID: <20180521212027.2FC7A7FFCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b54c5464cc57d70af2ac68adcb34dab616bef3be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sub-options of the ti-sgx-km package had their name option
prefixed by BR2_PACKAGE_TI_SGX, while the prefix should be
BR2_PACKAGE_TI_SGX_KM. This commit fixes that, and adds the necessary
Config.in.legacy handling.

Since those options are part of a choice, the legacy handling cannot
select the new name of the options, so the legacy handling only
informs the user of the rename.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy               | 32 ++++++++++++++++++++++++++++++++
 package/ti-sgx-km/Config.in    | 10 +++++-----
 package/ti-sgx-km/ti-sgx-km.mk |  8 ++++----
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 957099dd1c..4c00080965 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,38 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_TI_SGX_AM335X
+	bool "ti-sgx-km AM335X option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
+	  BR2_PACKAGE_TI_SGX_KM_AM335X.
+
+config BR2_PACKAGE_TI_SGX_AM437X
+	bool "ti-sgx-km AM437X option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
+	  BR2_PACKAGE_TI_SGX_KM_AM437X.
+
+config BR2_PACKAGE_TI_SGX_AM4430
+	bool "ti-sgx-km AM4430 option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
+	  BR2_PACKAGE_TI_SGX_KM_AM4430.
+
+config BR2_PACKAGE_TI_SGX_AM5430
+	bool "ti-sgx-km AM5430 option renamed"
+	select BR2_LEGACY
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_TI_SGX_AM5430 has been renamed to
+	  BR2_PACKAGE_TI_SGX_KM_AM5430.
+
 config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 	bool "janus-gateway audio-bridge option renamed"
 	select BR2_LEGACY
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index a4c9bb8ca2..db3d3f9ddd 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -20,26 +20,26 @@ if BR2_PACKAGE_TI_SGX_KM
 
 choice
 	prompt "Target"
-	default BR2_PACKAGE_TI_SGX_AM335X
+	default BR2_PACKAGE_TI_SGX_KM_AM335X
 	help
 	  Select the SOC for which you would like to install drivers.
 
-config BR2_PACKAGE_TI_SGX_AM335X
+config BR2_PACKAGE_TI_SGX_KM_AM335X
 	bool "AM335x"
 	help
 	  AM335x CPU
 
-config BR2_PACKAGE_TI_SGX_AM437X
+config BR2_PACKAGE_TI_SGX_KM_AM437X
 	bool "AM437x"
 	help
 	  AM437x CPU
 
-config BR2_PACKAGE_TI_SGX_AM4430
+config BR2_PACKAGE_TI_SGX_KM_AM4430
 	bool "AM4430"
 	help
 	  AM4430 CPU
 
-config BR2_PACKAGE_TI_SGX_AM5430
+config BR2_PACKAGE_TI_SGX_KM_AM5430
 	bool "AM5430"
 	help
 	  AM5430 CPU
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index db74da9b4a..0e1bc33902 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -17,13 +17,13 @@ TI_SGX_KM_MAKE_OPTS = \
 	KERNELDIR=$(LINUX_DIR) \
 	PVR_NULLDRM=1
 
-ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
+ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
 TI_SGX_KM_PLATFORM_NAME = omap335x
-else ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
+else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
 TI_SGX_KM_PLATFORM_NAME = omap437x
-else ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
+else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM4430),y)
 TI_SGX_KM_PLATFORM_NAME = omap4430
-else ifeq ($(BR2_PACKAGE_TI_SGX_5430),y)
+else ifeq ($(BR2_PACKAGE_TI_SGX_KM_5430),y)
 TI_SGX_KM_PLATFORM_NAME = omap5430
 endif
 
