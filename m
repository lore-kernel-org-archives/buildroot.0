From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:44:20 +0200
Subject: [Buildroot] [git commit branch/next] aiccu: remove redundant
	--static flag to pkg-config
Message-ID: <20150808105642.E8FE87FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4b539564fce4aa8bfbbd9e16c801b8ddae96141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/aiccu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index fc328fd..60d65dd 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -16,7 +16,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
 # aiccu forgets to link with gnutls' dependencies breaking the build when
 # linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --static --libs gnutls`
+AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs gnutls`
 endif
 
 # dummy RPM_OPT_FLAGS to disable stripping
