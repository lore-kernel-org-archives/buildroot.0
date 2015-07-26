From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:58:29 +0200
Subject: [Buildroot] [PATCH 1/4] aiccu: remove redundant --static flag to
	pkg-config
Message-ID: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/aiccu/aiccu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index fc328fd..60d65dd 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -16,7 +16,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
 # aiccu forgets to link with gnutls' dependencies breaking the build when
 # linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --static --libs gnutls`
+AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs gnutls`
 endif
 
 # dummy RPM_OPT_FLAGS to disable stripping
-- 
1.8.5.1
