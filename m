From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:40:10 +0200
Subject: [Buildroot] [git commit branch/next] package/pkg-meson.mk:
 determine 'buildtype' based on BR2_ENABLE_RUNTIME_DEBUG iso
 BR2_ENABLE_DEBUG
Message-ID: <20210601201224.82E267FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=603a949af081742990db32f3f656d0352c357acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index a57820d4d2..dafad3b1eb 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -89,7 +89,7 @@ define $(2)_CONFIGURE_CMDS
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
-		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
+		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
