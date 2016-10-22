From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] luajit: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132039.06646819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfe64eab73ed4b1ca3379f1fedc6054431ed7eea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
