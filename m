From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 08:04:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/bctoolbox: drop GIT_EXECUTABLE
Message-ID: <20201117070451.11844-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GIT_EXECUTABLE is not needed since version 4.3.0 and
https://github.com/BelledonneCommunications/bctoolbox/commit/a92ea8672fc0a736c9018de31588aeeeef4a4157
https://github.com/BelledonneCommunications/bctoolbox/commit/6c2e02ffb16f999e270c5de29bbf4dd13b9e986d

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    GIT_EXECUTABLE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bctoolbox/bctoolbox.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index f9d740820d..230394970c 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -17,7 +17,6 @@ BCTOOLBOX_CONF_OPTS = \
 	-DENABLE_STRICT=OFF \
 	-DENABLE_TESTS_COMPONENT=OFF \
 	-DENABLE_TESTS=OFF \
-	-DGIT_EXECUTABLE=OFF \
 	-DCMAKE_SKIP_RPATH=ON
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
2.29.2
