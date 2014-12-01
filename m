From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:54:13 +0100
Subject: [Buildroot] [git commit] netatalk: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.C42AF8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b552430a3a52999d9adfb381561b0f0bd397d25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

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
