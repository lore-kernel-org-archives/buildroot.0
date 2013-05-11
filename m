From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:39:41 +0200
Subject: [Buildroot] [git commit branch/next] imlib2: handle imlib2-config
	script
Message-ID: <20130511204538.6F65B9A09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24b950f76f5f88817991bb9238356325dc43bba6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imlib2/imlib2.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

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
