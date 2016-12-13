From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 16:27:30 +0100
Subject: [Buildroot] [git commit] zlib: use $(TARGET_MAKE_ENV) when calling
	$(MAKE1)
Message-ID: <20161213152759.5E6D080DB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64745304fcc143c3aab3f9420b6b18847579c63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
