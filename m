From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 19:19:25 +0200
Subject: [Buildroot] [git commit] qt: enable Script and WebKit modules for
	ARC
Message-ID: <20150718171945.CD3A67FA54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eba4aaf053b718965fd0fb886dea753a47777f8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now when ARC toolchain also supports NPTL both Qt's Script and WebKit
modules could be successfully built and then executed on ARC.

[Thomas: fix alphabetic ordering.]

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 306fe1f..418248a 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -409,7 +409,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	bool
 	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
-	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
+	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
@@ -455,7 +455,7 @@ config BR2_PACKAGE_QT_OPENSSL
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	bool
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
-	default y if BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
+	default y if BR2_arc || BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
