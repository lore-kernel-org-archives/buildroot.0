From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 09:07:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libdrm: fix man
 page disabling option
Message-ID: <20210426064025.08CF1861B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=283e4e52b9664dab24e6f98635d514dc31d4d895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 841c695468fa (libdrm: change to meson build system) converted the
autotools --disable-manpages to the neson -Dmanpages=false. However, the
actual option is 'man-pages':

    WARNING: Unknown options: "manpages"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: tweak commit log as per Peter's review]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 56fd68b68892afadfa1e0eb25609b847cb655d31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 25f8484782..8ccbd832d2 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,7 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=false \
-	-Dmanpages=false
+	-Dman-pages=false
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
