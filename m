From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu,  7 Mar 2019 15:48:51 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/optee-examples: thread
 dependency from optee-client
In-Reply-To: <1551970132-9377-1-git-send-email-etienne.carriere@linaro.org>
References: <1551970132-9377-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1551970132-9377-3-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate dependency on BR2_TOOLCHAIN_HAS_THREADS inherited from
optee-client this package depends on.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - New patch in the series. v2 propagates the optee-client dependency on threads
    to packages dependent on optee-client.

---
 package/optee-examples/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 479f920..904c36c 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	bool "optee-examples"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
-- 
1.9.1
