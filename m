From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:19:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/uhd: fix typo
Message-ID: <20201117201941.138091-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace ENABLE_DPKD by ENABLE_DPDK to fix the following error:

  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    ENABLE_DPKD

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uhd/uhd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index adb7579019..2a40efdd23 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -23,7 +23,7 @@ UHD_CONF_OPTS = \
 	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
 	-DENABLE_C_API=ON \
 	-DENABLE_DOXYGEN=OFF \
-	-DENABLE_DPKD=OFF \
+	-DENABLE_DPDK=OFF \
 	-DENABLE_LIBUHD=ON \
 	-DENABLE_N230=OFF \
 	-DENABLE_N300=OFF \
-- 
2.29.2
