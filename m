From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:36:12 +0100
Subject: [Buildroot] [git commit] package/exim: fix host build
Message-ID: <20200108082623.31F577FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c692e81a844b30b4d3161dfd9897b3265bb9279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5a7/5a765f0e65e20266c7203412a46c684a40b66ea3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 118ee4a1a4..1f814ef195 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -125,7 +125,7 @@ define EXIM_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
 		CC=$(HOSTCC) \
 		LNCC=$(HOSTCC) \
-		CFLAGS="$(HOST_CFLAGS)" \
+		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
 endef
