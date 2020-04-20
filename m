From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 22:16:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/mc: fix build with NLS
Message-ID: <20200420201644.1954370-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext is an optional dependency since version 4.8.24 and
https://github.com/MidnightCommander/mc/commit/f30e6ff283f4bc86177e4360de94dad794678395

Fixes:
 - http://autobuild.buildroot.org/results/0e72b0b5b7d7009bd5ad5f15917e94c86e99131b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.25.1
