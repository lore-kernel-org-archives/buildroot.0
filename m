From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 00:47:14 +0200
Subject: [Buildroot] [PATCH 2/7] package/libv4l: needs argp-standalone with
	musl toolchains
In-Reply-To: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438987639-30593-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libv4l/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 0437ba1..0ae12d1 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBV4L
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  libv4l is a collection of libraries which adds a thin abstraction
-- 
2.4.3
