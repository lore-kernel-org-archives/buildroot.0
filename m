From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 00:21:06 +0100
Subject: [Buildroot] [PATCH v2 5/8] package/optee-test: fix dependency in
 TAs build
In-Reply-To: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1552951269-16967-5-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix TA build command to build TA libraries before TAs.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - New commit not in v1 series.

---
 package/optee-test/optee-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 73accf3..abed09d 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -16,7 +16,7 @@ OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_SDK)
 # Trusted Application are not built from CMake due to ta_dev_kit
 # dependencies. We must build and install them on target.
 define OPTEE_TEST_BUILD_TAS
-	$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
+	$(foreach f,$(wildcard $(@D)/ta/*_lib/Makefile) $(wildcard $(@D)/ta/*/Makefile), \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
 			TA_DEV_KIT_DIR=$(OPTEE_OS_SDK) \
-- 
1.9.1
