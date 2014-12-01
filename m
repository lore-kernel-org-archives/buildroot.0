From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:07:41 +0100
Subject: [Buildroot] [git commit] snowball-init: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221141.2C4088002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=754014693733d821a6a80a3206a446f549d39d6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snowball-init/snowball-init.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
