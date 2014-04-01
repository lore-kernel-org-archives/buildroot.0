From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Apr 2014 11:12:49 +0200
Subject: [Buildroot] [PATCH v2 1/4] luajit: needs for 32bit archictectures a
	32bit host gcc
In-Reply-To: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
References: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1396343572-13551-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For 32 bit archictectures the luajit package needs a host compiler
able to generate 32 bit code using the "-m32" option so check if that
option is supported.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Fran?ois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 9c4ecc3..dd93609 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAJIT
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
-- 
1.9.1
