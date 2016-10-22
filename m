From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] vim: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.3F0C2819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25e808f06aae0fc546039040384955182923ae1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index d55e905..d4a1f82 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -49,15 +49,15 @@ endif
 
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installlinks
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
 endef
 
 define VIM_INSTALL_RUNTIME_CMDS
 	cd $(@D)/src; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installmacros
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installmacros
 endef
 
 define VIM_REMOVE_DOCS
