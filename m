From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu,  7 Mar 2019 15:48:52 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/optee-test: thread dependency
 from optee-client
In-Reply-To: <1551970132-9377-1-git-send-email-etienne.carriere@linaro.org>
References: <1551970132-9377-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1551970132-9377-4-git-send-email-etienne.carriere@linaro.org>
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
 package/optee-test/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 575790b..46c4a1d 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	bool "optee-test"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
-- 
1.9.1
