From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 17 May 2019 10:45:55 +0200
Subject: [Buildroot] [PATCH 3/4] package/optee-test: support external TA SDK
In-Reply-To: <20190517084556.12242-1-etienne.carriere@linaro.org>
References: <20190517084556.12242-1-etienne.carriere@linaro.org>
Message-ID: <20190517084556.12242-3-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE Test package no more selects BR2_TARGET_OPTEE_OS_SDK as
OP-TEE OS can import an external SDK if not building it from source.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index a40f1e9069..7564dcb3d2 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_OPTEE_TEST
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
-	select BR2_TARGET_OPTEE_OS_SDK
 	help
 	  This build option enables OP-TEE test package from the
 	  OP-TEE project. It helps platforms to verify the OP-TEE
-- 
2.17.1
