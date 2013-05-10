From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:26 +0200
Subject: [Buildroot] [PATCH 04/16] imlib2: handle imlib2-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imlib2/imlib2.mk |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index c7029ae..cec6706 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -12,6 +12,7 @@ IMLIB2_LICENSE_FILES = COPYING
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
+IMLIB2_CONFIG_SCRIPTS = imlib2-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
 	IMLIB2_CONF_OPT += --with-x
@@ -57,10 +58,7 @@ endif
 
 # drop -L<dir> from linker flags
 define IMLIB2_FIXUP_IMLIB2_CONFIG
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e  's/-L[^ ]*//g' \
-		$(STAGING_DIR)/usr/bin/imlib2-config
+	$(SED) 's/-L[^ ]*//g' $(STAGING_DIR)/usr/bin/imlib2-config
 endef
 
 IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
-- 
1.7.9.5
