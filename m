From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 09:46:46 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/zlib-ng: drop
 unrecognized CC variable
Message-ID: <20201012081032.0DFE9885DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd2ea7499f0888698fbcad83220b320c5816b9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Drop unneeded CC variable which is not recognized by cmake:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CC

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 404efde6cbc87d26a192266ddc1b4c34d286b6c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib-ng/zlib-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 098dfcb28a..3b27574a79 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -12,7 +12,7 @@ ZLIB_NG_INSTALL_STAGING = YES
 ZLIB_NG_PROVIDES = zlib
 
 # Build with zlib compatible API, gzFile support and optimizations on
-ZLIB_NG_CONF_OPTS += -DZLIB_COMPAT=1 -DWITH_GZFILEOP=1 -DWITH_OPTIM=1 -DCC=$(TARGET_CC)
+ZLIB_NG_CONF_OPTS += -DZLIB_COMPAT=1 -DWITH_GZFILEOP=1 -DWITH_OPTIM=1
 
 # Enable NEON and ACLE on ARM
 ifeq ($(BR2_arm),y)
