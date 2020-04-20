From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 22:54:26 +0200
Subject: [Buildroot] [git commit] package/mc: fix build with NLS
Message-ID: <20200420204005.E1C8B8F4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=373dc95c4905594a18127621205e00eaf9e11550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gettext is an optional dependency since version 4.8.24 and
https://github.com/MidnightCommander/mc/commit/f30e6ff283f4bc86177e4360de94dad794678395

Fixes:
 - http://autobuild.buildroot.org/results/0e72b0b5b7d7009bd5ad5f15917e94c86e99131b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mc/mc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index f83905d89b..4e76b618d8 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -9,7 +9,8 @@ MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
-MC_DEPENDENCIES = libglib2 host-pkgconf
+MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
