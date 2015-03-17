From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2015 21:04:48 +0100
Subject: [Buildroot] [PATCH 2/3] ljlinenoise: refactor with
	BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
In-Reply-To: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
References: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1426622689-31844-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljlinenoise/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index 17be1be..ce1a156 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LJLINENOISE
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
 	# ljsyscall is only available for some target architectures
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	help
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
@@ -13,5 +13,4 @@ config BR2_PACKAGE_LJLINENOISE
 	  http://fperrad.github.io/ljlinenoise/
 
 comment "ljlinenoise needs LuaJIT"
-	depends on !BR2_PACKAGE_LUAJIT
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	depends on !BR2_PACKAGE_LUAJIT && !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-- 
2.1.0
