From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 May 2016 21:15:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/libsemanage: disable on musl
Message-ID: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149138
"getpwent_r() is a glibc-specific extension, so it will most likely not
 be implemented by musl."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsemanage/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index d9a83c0..5e9ad8f 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # getpwent_r(), ustr
 	depends on !BR2_arc
 	help
 	  libsemanage is the policy management library. It uses
@@ -19,4 +20,5 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.8.1
