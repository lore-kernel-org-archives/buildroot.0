From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] radvd: convert to new style hook
Message-ID: <20100916113833.CEBA58AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7e517e8959ff418363a1964d28a4226b0ae603d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index fdc52ac..fe8be5d 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -9,8 +9,10 @@ RADVD_SITE:=http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES:=flex host-flex
 RADVD_CONF_OPT:= --program-prefix=''
 
-$(eval $(call AUTOTARGETS,package,radvd))
-
-$(RADVD_HOOK_POST_INSTALL): $(RADVD_TARGET_INSTALL_TARGET)
+define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-	touch $@
+endef
+
+RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
+
+$(eval $(call AUTOTARGETS,package,radvd))
-- 
1.7.1
