From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 21 Dec 2011 11:50:46 +0100
Subject: [Buildroot] [PATCH] python: enable zlib support for the host package
Message-ID: <1324464646-9349-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

zlib is needed for the host-setuptools package

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
 
-- 
1.7.1.1
