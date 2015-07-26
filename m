From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:44:27 +0200
Subject: [Buildroot] [git commit branch/next] fbv: remove redundant --static
	flag to pkg-config
Message-ID: <20150808105642.F210E7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21f021b07e075246798bff788fa224b0cc2468e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbv/fbv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 5f7dc8c..d12b9f4 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -18,7 +18,7 @@ FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
 ifeq ($(BR2_STATIC_LIBS),y)
-FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng --static`"
+FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng`"
 endif
 
 else
