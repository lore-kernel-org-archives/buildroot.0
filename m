From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:14 -0300
Subject: [Buildroot] [PATCH 27/93] am335x-pru-package: use
	$(TARGET_MAKE_ENV) when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-28-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
 
-- 
2.7.3
