From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:44:01 +0200
Subject: [Buildroot] [git commit] package/php: intl support needs icu,
	which needs threads
Message-ID: <20140408225026.1ABB39C63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=948ace52377e711e449c64ab7229aa51c5ef8088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/156/1567be445b3ab9071717e9e72301818f95d0a143/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 463334b..abf4993 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -163,13 +163,14 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	depends on BR2_USE_WCHAR
 	depends on !BR2_arc # icu -> atomic builtins
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar"
+comment "intl support needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "Image processing"
 
