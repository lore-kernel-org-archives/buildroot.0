From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 21:32:28 +0100
Subject: [Buildroot] [git commit] package/uvw: disable CMake pthread test
Message-ID: <20191027202558.67E498A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acc7fd59a182effaa14b1b9ad572a03e542d619b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/9c61c06142c832a9669afdcafcbb8b1f7df51082

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
