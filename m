From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ocrad: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.82A9D81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82fdffc7a9d016f6d0371ac73a2ecaec00189add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ocrad/ocrad.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 8a038e2..7e4f8c1 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -13,19 +13,19 @@ OCRAD_INSTALL_STAGING = YES
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
 	cd $(@D) && \
-	./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
 endef
 
 define OCRAD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define OCRAD_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define OCRAD_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
