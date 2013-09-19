From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:38:21 +0200
Subject: [Buildroot] [git commit] luaposix: add ncurses dependency
Message-ID: <20130919193857.F02BA9B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b722bfc32184a82b6e56e779cff7a4bac7f69874
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

luaposix includes a curses binding which is optional and auto-detected by autotools.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luaposix/luaposix.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index ff99127..cbcdf32 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -12,4 +12,8 @@ LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = lua host-lua
 LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+    LUAPOSIX_DEPENDENCIES += ncurses
+endif
+
 $(eval $(autotools-package))
