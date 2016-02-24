From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 09:20:43 -0300
Subject: [Buildroot] [PATCH 2/2] qt: properly enable script aarch64 support
In-Reply-To: <1456316443-7087-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456316443-7087-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1456316443-7087-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's BR2_aarch64, not aarch64 alone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
