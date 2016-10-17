From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:10 -0300
Subject: [Buildroot] [PATCH 23/93] vim: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-24-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
