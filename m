From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 14:03:09 +0200
Subject: [Buildroot] [git commit] qt: webkit is now supported on MIPS64
Message-ID: <20140430120350.468FD9CA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b030b585be4d0e29e0909d1f277f390f39a0209f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since qt's version has been bumped to 4.8.6 we can add support for
webkit on MIPS64 architectures (both big and little endian). It wasn't
possible on 4.8.5 because QtScript wasn't supported on MIPS64, but that
has been fixed on 4.8.6.

With reference to:
   https://codereview.qt-project.org/#change,73022

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
