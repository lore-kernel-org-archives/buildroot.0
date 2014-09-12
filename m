From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 12 Sep 2014 19:22:36 -0400
Subject: [Buildroot] [PATCH] lua: fix license path for lua 5.2
Message-ID: <1410564156-4818-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file containing the license for lua 5.1 was removed and the license
text was added to the readme in 5.2.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/lua/lua.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9afec6c..b95fd30 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -12,7 +12,11 @@ endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
+ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+LUA_LICENSE_FILES = doc/readme.html
+else
 LUA_LICENSE_FILES = COPYRIGHT
+endif
 
 LUA_PROVIDES = luainterpreter
 
-- 
1.9.1
