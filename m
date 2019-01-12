From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 16:07:00 +0100
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: remove dummy
 value of CMAKE_SYSTEM_VERSION
Message-ID: <20190112150648.2E76881017@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d300b1d3b1267bbdf92ae128150a1cce137ae89e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now CMAKE_SYSTEM_VERSION is properly set in toolchainfile.cmake, it is
no longer necessary to set a dummy value in azure-iot-sdk-c.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Cc: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 3618e591a9..8b3f670399 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -14,11 +14,6 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
 AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
 AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 
-# When cross-compiling, CMake doesn't internally pass any
-# CMAKE_SYSTEM_VERSION, so pass a dummy version to make the c-utility
-# WIN32 test happy.
-AZURE_IOT_SDK_C_CONF_OPTS += -DCMAKE_SYSTEM_VERSION=1.0
-
 # The project only supports building one kind of library.
 # Further the install target installs the wrong files, so we do it here:
 ifeq ($(BR2_STATIC_LIBS),y)
