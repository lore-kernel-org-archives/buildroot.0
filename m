From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:53 +0100
Subject: [Buildroot] [PATCH 21/51] pango: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-22-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.1.0
