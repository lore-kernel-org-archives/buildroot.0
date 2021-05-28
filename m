From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 28 May 2021 09:35:09 +0200
Subject: [Buildroot] [PATCH 3/5] package/optee-client: bump to version 3.13.0
In-Reply-To: <20210528073511.16854-1-etienne.carriere@linaro.org>
References: <20210528073511.16854-1-etienne.carriere@linaro.org>
Message-ID: <20210528073511.16854-3-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Client package version to OP-TEE release 3.13.0.

Remove patch since addressed in that release.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 ...kteec-add-missing-unistd.h-for-gid_t.patch | 31 -------------------
 package/optee-client/optee-client.hash        |  4 +--
 package/optee-client/optee-client.mk          |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch

diff --git a/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch b/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch
deleted file mode 100644
index 534f1d3bee..0000000000
--- a/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6b908687d37dc4e5c00df90058990da034506628 Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Tue, 9 Mar 2021 11:52:32 +0100
-Subject: [PATCH 1/1] libckteec: add missing <unistd.h> for gid_t
-
-Include missing unistd.h to support type gid_t. This change fixes [1].
-
-Link: [1] http://autobuild.buildroot.net/results/34b9946e6d59112a7eead304933534ad4739a84c/build-end.log
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Acked-by: Jerome Forissier <jerome@forissier.org>
-[yann.morin.1998 at free.fr: actual backport now that upstream applied it]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- libckteec/src/invoke_ta.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libckteec/src/invoke_ta.c b/libckteec/src/invoke_ta.c
-index 6236719..70575d0 100644
---- a/libckteec/src/invoke_ta.c
-+++ b/libckteec/src/invoke_ta.c
-@@ -18,6 +18,7 @@
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <teec_trace.h>
-+#include <unistd.h>
- 
- #include "ck_helpers.h"
- #include "invoke_ta.h"
--- 
-2.25.1
-
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 253c29e22a..5d14f1023c 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.12.0/optee-client-3.12.0.tar.gz
-sha256 f75c45b40147217fa8f4a2ae1e4c06b24eb45d35167854fa9ad3ec3d6a73e858  optee-client-3.12.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.13.0/optee-client-3.13.0.tar.gz
+sha256 2ec6f05f833dce458f0358104e83e28e9a7643b81cfd96db32a7a1fadcc1e3af  optee-client-3.13.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 22f205e407..b73e76775e 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.12.0
+OPTEE_CLIENT_VERSION = 3.13.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1
