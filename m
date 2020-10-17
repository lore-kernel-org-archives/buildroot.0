From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 18:22:46 +0200
Subject: [Buildroot] [git commit] package/kismet: link with libatomic if
 needed
Message-ID: <20201017161332.7D264835FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f88b45de0dc76c801bf6a9fc315a85ed3b2abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of kismet-2020-09-R3 with riscv64

Fixes:
 - http://autobuild.buildroot.org/results/9c3d56ef837c7c5bfbb34a0ec51b349108e201b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kismet/kismet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 723ce9c02b..4fc96e76c3 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -27,6 +27,10 @@ endif
 
 KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+KISMET_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 KISMET_CONF_OPTS += --enable-libcap
