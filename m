From: Paul Cercueil <paul@crapouillou.net>
Date: Thu,  3 Apr 2014 23:01:20 +0200
Subject: [Buildroot] [PATCH 10/11] luajit: Allow to build on Mips and Mipsel
	platforms
In-Reply-To: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396558881-29631-10-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Acked-By: Maarten ter Huurne <maarten@treewalker.org>
---
 package/luajit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 9c4ecc3..bce9cc4 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_HAS_LUA_INTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
-- 
1.9.0
