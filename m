From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 00:31:17 +0200
Subject: [Buildroot] [git commit] azure-iot-sdk-c: Package depends on NPTL
Message-ID: <20170703222845.6323781F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40d9b45aacce95cc07f073471373470fca2cf900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/1ad/1ad1c02eb866dd9a1b586308b11b4242f4321355/
http://autobuild.buildroot.org/results/fd0/fd0a1f71fec062a530bcffe95e501095657c0d50/

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index 9fb956a..366dc91 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AZURE_IOT_SDK_C
 	bool "azure-iot-sdk-c"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_OPENSSL
@@ -12,5 +13,5 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 
 	  https://docs.microsoft.com/nl-nl/azure/iot-hub/iot-hub-device-sdk-c-intro
 
-comment "azure-iot-sdk-c needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "azure-iot-sdk-c needs a toolchain w/ C++ and NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
