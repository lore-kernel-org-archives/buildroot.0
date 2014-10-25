From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 02:34:40 +0200
Subject: [Buildroot] [git commit] luaposix: Use github call
Message-ID: <20141025003605.F12A7B0E00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71787e9d3538efcb561f780529fe395f0ca747dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luaposix/luaposix.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 46723a0..13fc266 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LUAPOSIX_VERSION = 32
-LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
-LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
+LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
