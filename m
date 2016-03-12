From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 12 Mar 2016 11:54:09 +0300
Subject: [Buildroot] [PATCH] slang: do install-pkgconfig when building
	static library
Message-ID: <1457772849-7501-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mc's configure can't find S-Lang because static S-Lang build doesn't
install pkgconfig file into staging. Adding install-pkgconfig to
SLANG_INSTALL_STAGING_OPTS fixes that.

Fixes:
  http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/slang/slang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 9078bf2..0991201 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -55,7 +55,7 @@ endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SLANG_MAKE_OPTS = static
-SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
+SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static install-pkgconfig
 SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 endif
 
-- 
2.1.4
