From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:55 -0300
Subject: [Buildroot] [PATCH 68/93] luajit: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-69-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
