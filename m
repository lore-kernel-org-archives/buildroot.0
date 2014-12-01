From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:36:39 +0100
Subject: [Buildroot] [git commit] screen: install configuration file
	unconditionally
Message-ID: <20141201234334.82A957FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=963bbf266bfebc240888cf8bce502a2fadb38c48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screen/screen.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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
