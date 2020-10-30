From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 08:50:44 +0100
Subject: [Buildroot] [PATCH 7/8] package/optee-test: add deps on openssl
 when enabled
In-Reply-To: <20201030075045.6960-1-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
Message-ID: <20201030075045.6960-7-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a dependency on openssl upon BR2_PACKAGE_LIBOPENSSL=y to
enable some for OP-TEE embedded tests.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 1f4f586672..189956651b 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -10,6 +10,9 @@ OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
 
 OPTEE_TEST_DEPENDENCIES = optee-client optee-os
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+OPTEE_TEST_DEPENDENCIES += openssl
+endif
 
 OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_SDK)
 
-- 
2.17.1
