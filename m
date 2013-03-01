From: Daniel Price <daniel.price@gmail.com>
Date: Thu, 28 Feb 2013 17:05:40 -0800
Subject: [Buildroot] [PATCH 1/2 V3] Add bzip2 to host-python when it is
	selected (aids in compiling nodejs)
Message-ID: <1362099940-25020-1-git-send-email-daniel.price@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based off of patches posted by (and Signed-off-by): Jonathan Liu <net147@gmail.com>

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 package/python/python.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 71591b7..91496e1 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -30,7 +30,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
 	--disable-ssl
 
 HOST_PYTHON_MAKE_ENV = \
@@ -49,7 +48,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
 
 PYTHON_DEPENDENCIES  = host-python libffi
 
-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-bzip2
 
 PYTHON_INSTALL_STAGING = YES
 
-- 
1.7.6.5
