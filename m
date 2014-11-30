From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:05 +0100
Subject: [Buildroot] [PATCHv3 17/74] netatalk: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/netatalk.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 5ea55c2..6c1b640 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -50,12 +50,9 @@ else
 	NETATALK_CONF_OPTS += --disable-cups
 endif
 
-define NETATALK_INSTALL_EXTRA_FILES
-	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
-		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
-			$(TARGET_DIR)/etc/init.d/S50netatalk
+define NETATALK_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
+		$(TARGET_DIR)/etc/init.d/S50netatalk
 endef
 
-NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
-
 $(eval $(autotools-package))
-- 
2.1.0
