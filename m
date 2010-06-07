From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Mon,  7 Jun 2010 13:37:47 +0200
Subject: [Buildroot] [PATCH] cdrkit: fix build by adding zlib as dependency
Message-ID: <1275910667-9357-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cdrkit: fix build by adding zlib as dependency.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/cdrkit/cdrkit.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a6a2e80..f7e21b0 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -2,8 +2,8 @@ CDRKIT_VERSION=1.1.10
 CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
 CDRKIT_SITE=http://www.cdrkit.org/releases/
 
-CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
-HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2
+CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake zlib
+HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2 host-zlib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
-- 
1.7.0.4
