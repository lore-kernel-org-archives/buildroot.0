From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:40:26 +0200
Subject: [Buildroot] [git commit] luajit: Allow to build on Mips and Mipsel
	platforms
Message-ID: <20140404214033.21627834E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6b5b8c676542c36884ec1d06afa6a6055b7269f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Acked-By: Maarten ter Huurne <maarten@treewalker.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
