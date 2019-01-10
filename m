From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Jan 2019 00:05:29 +0100
Subject: [Buildroot] [PATCH 2/2] azure-iot-sdk-c: remove dummy value of
 CMAKE_SYSTEM_VERSION
In-Reply-To: <20190110230529.29852-1-arnout@mind.be>
References: <20190110230529.29852-1-arnout@mind.be>
Message-ID: <20190110230529.29852-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now CMAKE_SYSTEM_VERSION is properly set in toolchainfile.cmake, it is
no longer necessary to set a dummy value in azure-iot-sdk-c.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Cc: Andr? Hentschel <nerv@dawncrow.de>
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
-- 
2.20.1
