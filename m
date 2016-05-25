From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 23:32:51 +0200
Subject: [Buildroot] [git commit] package/ustr: disable on musl
Message-ID: <20160525213259.797BA7FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=986893ac781f94d5bfc6d7b88af5cd1abc86054b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsemanage is the only package depending on ustr, both packages do not
build using a musl-based toolchain, suggested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149138

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ustr/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ustr/Config.in b/package/ustr/Config.in
index 0d9c272..9d6561c 100644
--- a/package/ustr/Config.in
+++ b/package/ustr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_USTR
 	bool "ustr"
 	# unconditionally builds a shared library
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # broken vsnprintf detection
 	help
 	  A small, safe string library.
 
@@ -9,3 +10,4 @@ config BR2_PACKAGE_USTR
 
 comment "ustr needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
