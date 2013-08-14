From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 14 Aug 2013 13:20:09 +0100
Subject: [Buildroot] [PATCH] webkit: Restrict supported architectures
Message-ID: <1376482809-32069-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See Source/WTF/wtf/Platform.h. Webkit is only supported for
arm, armeb, i386, mips, mipsel, powerpc, sh, sparc, x86_64.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/webkit/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 92cbc62..789e427 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
-- 
1.8.3.2
