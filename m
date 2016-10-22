From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] botan: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.AFB0681974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1889786650da4815378224e5706b34a1c7f8ba06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/botan/botan.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 69c973e..94f1edd 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -44,19 +44,19 @@ BOTAN_CONF_OPTS += --with-zlib
 endif
 
 define BOTAN_CONFIGURE_CMDS
-	(cd $(@D); ./configure.py $(BOTAN_CONF_OPTS))
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure.py $(BOTAN_CONF_OPTS))
 endef
 
 define BOTAN_BUILD_CMDS
-	$(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
 endef
 
 define BOTAN_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
 endef
 
 $(eval $(generic-package))
