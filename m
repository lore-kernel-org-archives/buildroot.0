From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 09:05:26 +0200
Subject: [Buildroot] [git commit] package/libdrm: fix man page disabling
 option
Message-ID: <20210417063956.4CF8983998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56fd68b68892afadfa1e0eb25609b847cb655d31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 841c695468fa (libdrm: change to meson build system) converted the
autotools --disable-manpages to the neson -Dmanpages=false. However, the
actual option is 'man-pages':

    WARNING: Unknown options: "manpages"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: tweak commit log as per Peter's review]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libdrm/libdrm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 98e1ac079d..f5b205bb00 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,7 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=false \
-	-Dmanpages=false
+	-Dman-pages=false
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
