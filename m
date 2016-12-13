From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 13 Dec 2016 11:50:44 -0300
Subject: [Buildroot] [PATCH 1/2] zlib: use $(TARGET_MAKE_ENV) when calling
	$(MAKE1)
Message-ID: <20161213145045.22768-1-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/zlib/zlib.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index aec9daf..d00ca75 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -44,7 +44,7 @@ define HOST_ZLIB_CONFIGURE_CMDS
 endef
 
 define ZLIB_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
 define HOST_ZLIB_BUILD_CMDS
@@ -52,11 +52,11 @@ define HOST_ZLIB_BUILD_CMDS
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
 endef
 
 define ZLIB_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
 endef
 
 # We don't care removing the .a from target, since it not used at link
-- 
2.10.2
