From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:00:03 +0100
Subject: [Buildroot] [git commit] pango: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.E9D598002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a285f61a882a4bd9eaa1de82ef702cc6af8c5d0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 6e340f4..63cfae3 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -61,11 +61,9 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
 	PANGO_CONF_OPTS += --with-xft
 endif
 
-define PANGO_INSTALL_INITSCRIPT
+define PANGO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/pango/S25pango \
 		$(TARGET_DIR)/etc/init.d/S25pango
 endef
 
-PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
