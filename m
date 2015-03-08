From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:33:00 +0100
Subject: [Buildroot] [git commit] minidlna: install the config file on the
	target
Message-ID: <20150308133314.BE7F58055B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f361b26e8cbe5686d2a570b6cd9eeb4a7e684fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/minidlna.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 1ff76e3..7adb832 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -24,6 +24,12 @@ MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
+define MINIDLNA_INSTALL_CONF
+	$(INSTALL) -D -m 644 $(@D)/minidlna.conf $(TARGET_DIR)/etc/minidlna.conf
+endef
+
+MINIDLNA_POST_INSTALL_TARGET_HOOKS += MINIDLNA_INSTALL_CONF
+
 define MINIDLNA_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/minidlna/S60minidlnad \
 		$(TARGET_DIR)/etc/init.d/S60minidlnad
