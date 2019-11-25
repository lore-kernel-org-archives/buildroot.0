From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:17:47 +0100
Subject: [Buildroot] [git commit] package/gcnano-binaries: create directory
 before copying files
Message-ID: <20191202083935.3F5B0817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a6c8e6643f74e17e49a4254c18f8b41621c0e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The directory $(1)/usr/include may not exist before copy files.

Signed-off-by: Jens Kleintje <scooby22@web.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 2913e664dc..b27571a08c 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -56,6 +56,7 @@ define GCNANO_BINARIES_INSTALL
 			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
 		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
 	)
+	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
 	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
 		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
