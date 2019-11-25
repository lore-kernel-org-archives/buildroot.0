From: Jens Kleintje <scooby22@web.de>
Date: Mon, 25 Nov 2019 11:14:25 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/gcnano-binaries: Add package
 config files
In-Reply-To: <20191125101426.10955-1-scooby22@web.de>
References: <20191125101426.10955-1-scooby22@web.de>
Message-ID: <20191125101426.10955-2-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt needs the package config files for building.

Signed-off-by: Jens Kleintje <scooby22@web.de>
---
 package/gcnano-binaries/gcnano-binaries.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 4bfb5ad952..2913e664dc 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -48,6 +48,8 @@ GCNANO_BINARIES_LIBRARIES = \

 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)

+GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
+
 define GCNANO_BINARIES_INSTALL
 	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
 		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
@@ -55,6 +57,10 @@ define GCNANO_BINARIES_INSTALL
 		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
 	)
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
+	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
+		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
+			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
+	)
 endef

 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
--
2.17.1
