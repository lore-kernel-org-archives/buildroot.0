From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 29 Sep 2017 18:59:06 +0200
Subject: [Buildroot] [PATCH] lbase64: fix build
Message-ID: <20170929165906.18974-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/b56/b567096cbfdb89b1895924051265c56204ffb512/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lbase64/lbase64.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index fd78a6ccd..0225fc67c 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -12,7 +12,8 @@ LBASE64_LICENSE_FILES = README
 LBASE64_DEPENDENCIES = luainterpreter
 
 define LBASE64_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) so
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) so
 endef
 
 define LBASE64_INSTALL_TARGET_CMDS
-- 
2.11.0
