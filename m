From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:56 -0300
Subject: [Buildroot] [PATCH 69/93] luajit: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-70-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/luajit/luajit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 24909fb..d3ef3b7 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -66,13 +66,13 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
 # host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-	$(MAKE) PREFIX="$(HOST_DIR)/usr" BUILDMODE=dynamic \
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
 		-C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-	$(MAKE) PREFIX="$(HOST_DIR)/usr" LDCONFIG=true -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)/usr" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
