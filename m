From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] am335x-pru-package: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132037.68B3F819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f734cc79554be0aad1e29168a1a610693a7b64ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/am335x-pru-package/am335x-pru-package.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index a97e8a4..d6bffb4 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -19,19 +19,19 @@ AM335X_MAKE_TARGET = release $(if $(BR2_STATIC_LIBS),,sorelease)
 endif
 
 define AM335X_PRU_PACKAGE_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D)/pru_sw/app_loader/interface $(AM335X_MAKE_TARGET)
 endef
 
 # 'install' installs whatever was built, and our patch removes the dependency
 # on the release build, so we can use it to install whatever we built above.
 define AM335X_PRU_PACKAGE_INSTALL_STAGING_CMDS
-	$(MAKE1) DESTDIR="$(STAGING_DIR)" PREFIX="/usr" \
+	$(TARGET_MAKE_ENV) $(MAKE1) DESTDIR="$(STAGING_DIR)" PREFIX="/usr" \
 		-C $(@D)/pru_sw/app_loader/interface install
 endef
 
 define AM335X_PRU_PACKAGE_INSTALL_TARGET_CMDS
-	$(MAKE1) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
+	$(TARGET_MAKE_ENV) $(MAKE1) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
 		-C $(@D)/pru_sw/app_loader/interface install
 endef
 
