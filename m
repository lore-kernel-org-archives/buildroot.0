From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:45 -0600
Subject: [Buildroot] [PATCH v3 9/9] package/luajit: depend on
 !BR2_PACKAGE_LUA
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-9-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit package is incomaptible with lua so luajit should depend on
!BR2_PACKAGE_LUA

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - always depend on lua/luaposix from packages instead of selecting
Changes v1 -> v2:
  - depend on !BR2_PACKAGE_LUA_5_3 instead of !BR2_PACKAGE_LUA for solarus
---
 package/luajit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 8cfa85684e..33a460772f 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
+	depends on !BR2_PACKAGE_LUA
 	depends on !BR2_STATIC_LIBS # dlopen
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-- 
2.25.1
