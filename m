From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2015 21:04:49 +0100
Subject: [Buildroot] [PATCH 3/3] ljsyscall: refactor with
	BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
In-Reply-To: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
References: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1426622689-31844-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljsyscall/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index dcbd521..b9ff04d 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_LJSYSCALL
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
 	# ljsyscall is only available for some target architectures
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	help
 	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
 
 	  http://github.com/justincormack/ljsyscall
 
 comment "ljsyscall needs LuaJIT"
-	depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
+	depends on !BR2_PACKAGE_LUAJIT && !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 
-- 
2.1.0
