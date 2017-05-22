From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 May 2017 20:50:31 +0200
Subject: [Buildroot] [PATCH/next] package/minidlna: add optional avahi
	support
Message-ID: <20170522185031.13096-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minidlna uses Avahi when TiVo support is enabled:
https://sourceforge.net/p/minidlna/git/ci/0575299a8792d936f75d6e760e58c9d9bee4015f/#diff-4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 4fa55454c..21b0a931b 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -17,6 +17,11 @@ MINIDLNA_DEPENDENCIES = \
 MINIDLNA_CONF_OPTS = \
 	--disable-static
 
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+MINIDLNA_CONF_OPTS += --enable-tivo
+MINIDLNA_DEPENDENCIES += avahi
+endif
+
 define MINIDLNA_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/minidlna.conf $(TARGET_DIR)/etc/minidlna.conf
 endef
-- 
2.11.0
