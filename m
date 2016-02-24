From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:29:18 +0100
Subject: [Buildroot] [git commit] qt: properly enable script aarch64 support
Message-ID: <20160224223006.88D258011E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ea3bce87c49999bc8225518e891d6c3d31270d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's BR2_aarch64, not aarch64 alone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 1579b61..248af00 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -457,7 +457,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	bool
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
-	default y if BR2_arc || BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
+	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
