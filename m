From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 May 2018 19:31:46 +0200
Subject: [Buildroot] [PATCH] package/ti-sgx-km: properly handle legacy for
 renamed options
Message-ID: <20180529173146.13512-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b54c5464cc (ti-sgx-km: rename options to have proper prefix)
forgot to add defaults from legacy options, and notices that legacy
options are still referenced).

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy            | 4 ++++
 package/ti-sgx-km/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index e7b0316a4f..c62d87de01 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -169,6 +169,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 	  BR2_PACKAGE_MEDIAART_BACKEND_QT has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 
+# Note: BR2_PACKAGE_TI_SGX_AM335X is still referenced from package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM335X
 	bool "ti-sgx-km AM335X option renamed"
 	select BR2_LEGACY
@@ -177,6 +178,7 @@ config BR2_PACKAGE_TI_SGX_AM335X
 	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM335X.
 
+# Note: BR2_PACKAGE_TI_SGX_AM437X is still referenced from package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM437X
 	bool "ti-sgx-km AM437X option renamed"
 	select BR2_LEGACY
@@ -185,6 +187,7 @@ config BR2_PACKAGE_TI_SGX_AM437X
 	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM437X.
 
+# Note: BR2_PACKAGE_TI_SGX_AM4430 is still referenced from package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM4430
 	bool "ti-sgx-km AM4430 option renamed"
 	select BR2_LEGACY
@@ -193,6 +196,7 @@ config BR2_PACKAGE_TI_SGX_AM4430
 	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM4430.
 
+# Note: BR2_PACKAGE_TI_SGX_AM5430 is still referenced from package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM5430
 	bool "ti-sgx-km AM5430 option renamed"
 	select BR2_LEGACY
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index db3d3f9ddd..348efdeb82 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -20,6 +20,10 @@ if BR2_PACKAGE_TI_SGX_KM
 
 choice
 	prompt "Target"
+	default BR2_PACKAGE_TI_SGX_KM_AM335X if BR2_PACKAGE_TI_SGX_AM335X # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM437X # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM4430 if BR2_PACKAGE_TI_SGX_AM4430 # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM5430 if BR2_PACKAGE_TI_SGX_AM5430 # legacy
 	default BR2_PACKAGE_TI_SGX_KM_AM335X
 	help
 	  Select the SOC for which you would like to install drivers.
-- 
2.14.1
