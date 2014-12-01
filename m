From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:27:58 +0100
Subject: [Buildroot] [git commit] fluxbox: install session file
	unconditionally
Message-ID: <20141201233009.76CE880051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82f82117eeebb2694565d26c1d76019823c7c057
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluxbox/fluxbox.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 21901d6..a0f9367 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -24,8 +24,8 @@ FLUXBOX_CONF_OPTS += --disable-imlib2
 endif
 
 define FLUXBOX_INSTALL_XSESSION_FILE
-	[ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
-		package/fluxbox/xsession $(TARGET_DIR)/root/.xsession
+	$(INSTALL) -m 0755 -D package/fluxbox/xsession \
+		$(TARGET_DIR)/root/.xsession
 endef
 
 FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
