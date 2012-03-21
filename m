From: JoM <johann.mercadier@imerir.com>
Date: Wed, 21 Mar 2012 23:26:56 +0000
Subject: [Buildroot] [PATCH 2/2] fbterm pckg check for libexpat & libZ
	Signed-off-by: JoM <johann.mercadier@imerir.com>
In-Reply-To: <1332372417-5120-1-git-send-email-johann.mercadier@imerir.com>
References: <1332372417-5120-1-git-send-email-johann.mercadier@imerir.com>
Message-ID: <1332372417-5120-2-git-send-email-johann.mercadier@imerir.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/fbterm/fbterm.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 0c462a4..44f63f1 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -9,6 +9,12 @@ FBTERM_VERSION = 1.7.0
 FBTERM_SITE = http://fbterm.googlecode.com/files
 FBTERM_DEPENDENCIES += freetype fontconfig
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	FBTERM_DEPENDENCIES += zlib
+endif
+
+FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)
+
 define FBTERM_UNINSTALL_CMDS
 	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
 endef
-- 
1.7.2.5
