From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 20 Oct 2019 21:28:08 +1300
Subject: [Buildroot] [PATCH] micropython: require python3 on the host
Message-ID: <20191020082808.15908-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are some scripts used when building micropython that require
python3 on the build host. Use BR2_PYTHON3_HOST_DEPENDENCY so this can
be either be satisfied by installing it on the build host or by building
the host-python3 package.

Fixes:
- http://autobuild.buildroot.net/results/b85b2214576030026a8e04d142a77a2648379417/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 5824b4ab18..a5b8218d1f 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -8,7 +8,7 @@ MICROPYTHON_VERSION = 1.11
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
-MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 # Set GIT_DIR so package won't use buildroot's version number
 MICROPYTHON_MAKE_ENV = \
-- 
2.23.0
