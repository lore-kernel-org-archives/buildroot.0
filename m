From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:39 +0200
Subject: [Buildroot] [PATCH 03/15] package/clapack: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the BUILD_TESTING configure option (note the typo in its existing
name), which is already set to the same value by the cmake
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/clapack/clapack.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
index 99de35d..c3841f2 100644
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -14,7 +14,6 @@ CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and liblapack)
 CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
 CLAPACK_SITE = http://www.netlib.org/clapack
 CLAPACK_INSTALL_STAGING = YES
-CLAPACK_CONF_OPTS = -DBUILDTESTING=OFF
 
 ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
 CLAPACK_CONF_OPTS += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
-- 
2.1.2
