From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 23:03:49 +0100
Subject: [Buildroot] [git commit] package/optee-test: fix dependency in TAs
 build
Message-ID: <20190320220035.B68E881E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7fa6671577538b61bf2f35c3fc0e304dffa175a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix TA build command to build TA libraries before TAs.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-test/optee-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 73accf3d1e..abed09d5e3 100644
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
