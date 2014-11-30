From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:57 +0100
Subject: [Buildroot] [PATCHv3 69/74] screen: install configuration file
	unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-70-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/screen/screen.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 461bce2..827e776 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -15,9 +15,7 @@ SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 define SCREEN_INSTALL_SCREENRC
-	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
-		$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc; \
-	fi
+	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
 
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
-- 
2.1.0
