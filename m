From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 30 Sep 2016 16:46:44 +0200
Subject: [Buildroot] [PATCH 2/2] efibootmgr: bump to version 14
In-Reply-To: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com>
References: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1475246804-26748-2-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream has changed version numbering scheme since version 13, which
came after version 0.12.

There is now a make install target, so we can drop the manual file
installing. The make install target also installs the new efibootdump
tool.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/efibootmgr/efibootmgr.hash | 2 +-
 package/efibootmgr/efibootmgr.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index a789942..f71dced 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b180d7d6b377d24b0872869f2571e2700b618e4d7ebdc2133134a918efe2623b efibootmgr-efibootmgr-0.12.tar.gz
+sha256 3f260491e2c62e93cb6347ea6f21aaa5f93152e9e7f0269d314623769d82e473 efibootmgr-14.tar.gz
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index a0c5646..731d6e9 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = efibootmgr-0.12
+EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPLv2+
 EFIBOOTMGR_LICENSE_FILES = COPYING
@@ -21,8 +21,8 @@ define EFIBOOTMGR_BUILD_CMDS
 endef
 
 define EFIBOOTMGR_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/efibootmgr/efibootmgr \
-		$(TARGET_DIR)/usr/bin/efibootmgr
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
