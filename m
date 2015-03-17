From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 18:03:04 +0100
Subject: [Buildroot] [git commit] package/luajit: introducing luajit arch
	supports.
Message-ID: <20150317170322.4A9F981829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a107f43486150c255d6ca5143609c788297c6ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS for luajit.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/Config.in |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index c505f6a..f6995e2 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,10 +1,16 @@
+config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || \
+		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
+		BR2_powerpc || BR2_arm || BR2_armeb || \
+		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
-		|| ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
