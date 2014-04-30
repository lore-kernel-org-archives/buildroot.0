From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Apr 2014 10:04:33 +0100
Subject: [Buildroot] [PATCH] qt: webkit is now supported on MIPS64
Message-ID: <1398848673-2579-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since qt's version has been bumped to 4.8.6 we can add support for
webkit on MIPS64 architectures (both big and little endian). It wasn't
possible on 4.8.5 because QtScript wasn't supported on MIPS64, but that
has been fixed on 4.8.6.

With reference to:
   https://codereview.qt-project.org/#change,73022

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/qt/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index eed25c8..8d67e37 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -358,8 +358,9 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	bool
 	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
-		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
+		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb || \
+		BR2_sparc || BR2_x86_64
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
-- 
1.7.1
