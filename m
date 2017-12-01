From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:55:47 +0100
Subject: [Buildroot] [git commit] package/am335x-pru-package: rename variable
Message-ID: <20171201214934.D2FE27FF20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=276ab13654bc4609ec0a119b63ab263430812770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use package names as poor-man's namespace, so fix that.

Reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/am335x-pru-package/am335x-pru-package.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index b2e89d3..24a5df4 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -13,14 +13,14 @@ AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
 
 # The default 'all' rule builds everything, when we just need the library
 ifeq ($(BR2_ENABLE_DEBUG),y)
-AM335X_MAKE_TARGET = debug $(if $(BR2_STATIC_LIBS),,sodebug)
+AM335X_PRU_PACKAGE_MAKE_TARGET = debug $(if $(BR2_STATIC_LIBS),,sodebug)
 else
-AM335X_MAKE_TARGET = release $(if $(BR2_STATIC_LIBS),,sorelease)
+AM335X_PRU_PACKAGE_MAKE_TARGET = release $(if $(BR2_STATIC_LIBS),,sorelease)
 endif
 
 define AM335X_PRU_PACKAGE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
-		-C $(@D)/pru_sw/app_loader/interface $(AM335X_MAKE_TARGET)
+		-C $(@D)/pru_sw/app_loader/interface $(AM335X_PRU_PACKAGE_MAKE_TARGET)
 endef
 
 # 'install' installs whatever was built, and our patch removes the dependency
