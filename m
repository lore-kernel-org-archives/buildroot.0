From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 27 Oct 2019 22:30:27 +0200
Subject: [Buildroot] [PATCH 1/1] uvw: disable CMake pthread test
Message-ID: <20191027203027.23297-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/9c61c06142c832a9669afdcafcbb8b1f7df51082

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/uvw/uvw.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 64122aea44..2e46721b52 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -13,4 +13,8 @@ UVW_DEPENDENCIES = libuv
 UVW_LICENSE = MIT
 UVW_LICENSE_FILES = LICENSE
 
+# The following CMake variable disables a TRY_RUN call in the -pthread
+# test which is not allowed when cross-compiling (for cmake < 3.10)
+UVW_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
+
 $(eval $(cmake-package))
-- 
2.20.1
