From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 22:15:40 +0200
Subject: [Buildroot] [PATCH v3 3/5] ed: use generic extract command
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <b4d2f393ea539772800f8d7319234fc493bd8885.1486930542.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generic code now knows how to extract .tar.lz archives. Remove the local
extract code.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ed/ed.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 50adeb4ec5b4..6b9f65ec5280 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -10,15 +10,9 @@ ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_CONF_OPTS = \
 	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)"
-ED_DEPENDENCIES = host-lzip
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
-define ED_EXTRACT_CMDS
-	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(ED_SOURCE) | \
-		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-endef
-
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) ./configure \
-- 
2.11.0
