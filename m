From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:16 +0100
Subject: [Buildroot] [PATCHv3 28/74] snowball-init: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snowball-init/snowball-init.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
index d71f347..40acdd6 100644
--- a/package/snowball-init/snowball-init.mk
+++ b/package/snowball-init/snowball-init.mk
@@ -9,7 +9,7 @@ SNOWBALL_INIT_SITE = https://github.com/igloocommunity/snowball-init
 SNOWBALL_INIT_LICENSE = BSD-4c
 SNOWBALL_INIT_LICENSE_FILES = debian/copyright
 
-define SNOWBALL_INIT_INSTALL_TARGET_CMDS
+define SNOWBALL_INIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/snowball $(TARGET_DIR)/etc/init.d/S50snowball
 endef
 
-- 
2.1.0
