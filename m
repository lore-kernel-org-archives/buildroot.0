From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 22:01:55 +0200
Subject: [Buildroot] [git commit] package/ti-sgx-km: properly handle legacy
 for renamed options
Message-ID: <20180617195942.1D8ED803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a03a66f405fa5142f3f1fe5f91f0d4d7c097771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b54c5464cc (ti-sgx-km: rename options to have proper prefix)
forgot to add defaults from legacy options, and notices in
Config.in.legacy that legacy options are still referenced in the
package itself.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy            | 8 ++++++++
 package/ti-sgx-km/Config.in | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index e7b0316a4f..7fc4792aed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -169,6 +169,8 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 	  BR2_PACKAGE_MEDIAART_BACKEND_QT has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 
+# Note: BR2_PACKAGE_TI_SGX_AM335X is still referenced from
+# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM335X
 	bool "ti-sgx-km AM335X option renamed"
 	select BR2_LEGACY
@@ -177,6 +179,8 @@ config BR2_PACKAGE_TI_SGX_AM335X
 	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM335X.
 
+# Note: BR2_PACKAGE_TI_SGX_AM437X is still referenced from
+# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM437X
 	bool "ti-sgx-km AM437X option renamed"
 	select BR2_LEGACY
@@ -185,6 +189,8 @@ config BR2_PACKAGE_TI_SGX_AM437X
 	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM437X.
 
+# Note: BR2_PACKAGE_TI_SGX_AM4430 is still referenced from
+# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM4430
 	bool "ti-sgx-km AM4430 option renamed"
 	select BR2_LEGACY
@@ -193,6 +199,8 @@ config BR2_PACKAGE_TI_SGX_AM4430
 	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM4430.
 
+# Note: BR2_PACKAGE_TI_SGX_AM5430 is still referenced from
+# package/ti-sgx-km/Config.in
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
