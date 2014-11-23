From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:49 +0100
Subject: [Buildroot] [PATCH 17/51] netatalk: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/netatalk.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 5ea55c2..a6c2e69 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -50,12 +50,10 @@ else
 	NETATALK_CONF_OPTS += --disable-cups
 endif
 
-define NETATALK_INSTALL_EXTRA_FILES
+define NETATALK_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
 		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
 			$(TARGET_DIR)/etc/init.d/S50netatalk
 endef
 
-NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
-
 $(eval $(autotools-package))
-- 
2.1.0
