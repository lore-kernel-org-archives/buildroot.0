From: Paul Cercueil <paul@crapouillou.net>
Date: Tue,  8 Apr 2014 19:45:05 +0200
Subject: [Buildroot] [PATCH 1/5] python-pygame: Remove wildcards in macros
Message-ID: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/python-pygame/python-pygame.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index d9219b9..b6381a3 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -83,13 +83,13 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
 endef
 
 define PYTHON_PYGAME_REMOVE_DOC
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/pygame/docs
 endef
 
 PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
 
 define PYTHON_PYGAME_REMOVE_TESTS
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/pygame/tests
 endef
 
 PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
-- 
1.9.1
