From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:48:16 +0100
Subject: [Buildroot] [PATCH 8/9] package/exiv2: drop cmake workaround
In-Reply-To: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
References: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214817.1177142-8-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exiv2/exiv2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index a898159a70..3d4cf41731 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -13,10 +13,6 @@ EXIV2_CPE_ID_VENDOR = exiv2
 
 EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
 
-# The following CMake variable disables a TRY_RUN call in the -pthread
-# test which is not allowed when cross-compiling.
-EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
 else
-- 
2.29.2
