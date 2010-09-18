From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:16:46 +0200
Subject: [Buildroot] [PATCH 2/3] zlib: Fix build
In-Reply-To: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Using "make -j $(N)" with N > 1 break zlib build.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/zlib/zlib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index ad5eda7..751cfc1 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -42,11 +42,11 @@ define HOST_ZLIB_CONFIGURE_CMDS
 endef
 
 define ZLIB_BUILD_CMDS
-	$(MAKE) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D) all libz.a
 endef
 
 define HOST_ZLIB_BUILD_CMDS
-	$(MAKE) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D) all libz.a
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
-- 
1.7.1
