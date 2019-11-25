From: Jens Kleintje <scooby22@web.de>
Date: Mon, 25 Nov 2019 11:14:26 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/gcnano-binaries: Create
 directory before copy files
In-Reply-To: <20191125101426.10955-1-scooby22@web.de>
References: <20191125101426.10955-1-scooby22@web.de>
Message-ID: <20191125101426.10955-3-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directory $(1)/usr/include may not exist before copy files.

Signed-off-by: Jens Kleintje <scooby22@web.de>
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
--
2.17.1
