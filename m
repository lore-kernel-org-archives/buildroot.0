From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 10:00:50 +0200
Subject: [Buildroot] [git commit] lua: fix license path for lua 5.2
Message-ID: <20140913181445.883BD9D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ee5be096e3dc63575559f85ee420f0666b1f6ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file containing the license for lua 5.1 was removed and the license
text was added to the readme in 5.2.

[Peter: swap 5.1/5.2 logic]
Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9afec6c..b88f1e2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -12,7 +12,11 @@ endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LUA_LICENSE_FILES = COPYRIGHT
+else
+LUA_LICENSE_FILES = doc/readme.html
+endif
 
 LUA_PROVIDES = luainterpreter
 
