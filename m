From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:48:48 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/guile: link with
 libatomic if needed
Message-ID: <20210214163443.AA732815F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7ae8b7e44aa7b6f01a4fb8bb7a17ed4bb292023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fix build of guile 3.0.4 with Bootlin SPARC uclibc toolchain added with
commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/a72d8e14854f9c6c9632e856019a3eb8ec4818b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19dda90ae727c2d1e3522a10be128b1f836e4fcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/guile/guile.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0e7328f199..44f4d1c85e 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -29,6 +29,10 @@ GUILE_CFLAGS = \
 	-DHAVE_GC_GET_FREE_SPACE_DIVISOR \
 	-DHAVE_GC_SET_FINALIZE_ON_DEMAND
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GUILE_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
