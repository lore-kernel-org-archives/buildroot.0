From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:34:50 +0200
Subject: [Buildroot] [git commit] package/micropython: require python3 on
 the host
Message-ID: <20191026102819.57C53882F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86bb2b46745e7aba727f3a91496e0b8e7c126e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are some scripts used when building micropython that require
python3 on the build host. Use BR2_PYTHON3_HOST_DEPENDENCY so this can
be either be satisfied by installing it on the build host or by building
the host-python3 package.

Fixes:
- http://autobuild.buildroot.net/results/b85b2214576030026a8e04d142a77a2648379417/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
