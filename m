From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] luajit: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.F18D6819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b787528b66a0a22be3ca8490fa8a5e71634f087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 81a2660..24909fb 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -36,7 +36,7 @@ endif
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
 # build system uses non conventional variable names.
 define LUAJIT_BUILD_CMDS
-	$(MAKE) PREFIX="/usr" \
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="/usr" \
 		STATIC_CC="$(TARGET_CC)" \
 		DYNAMIC_CC="$(TARGET_CC) -fPIC" \
 		TARGET_LD="$(TARGET_CC)" \
@@ -52,11 +52,11 @@ define LUAJIT_BUILD_CMDS
 endef
 
 define LUAJIT_INSTALL_STAGING_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" LDCONFIG=true -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 define LUAJIT_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 define LUAJIT_INSTALL_SYMLINK
