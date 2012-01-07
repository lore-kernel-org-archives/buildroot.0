From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:54:26 +0100
Subject: [Buildroot] [git commit] Python: enable zlib support for the host
	package
Message-ID: <20120107201230.AE6658FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=649915fb753d75a456bf627192204a182aae609f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is needed for the host-setuptools package

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 9ef2ccc..78895d4 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -28,7 +28,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-bsddb		\
 	--disable-test-modules	\
 	--disable-bz2		\
-	--disable-zlib		\
 	--disable-ssl
 
 HOST_PYTHON_MAKE_ENV = \
@@ -52,7 +51,7 @@ endef
 
 PYTHON_DEPENDENCIES  = host-python libffi
 
-HOST_PYTHON_DEPENDENCIES = host-expat
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
