From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Dec 2016 10:43:05 +0100
Subject: [Buildroot] [PATCH 2/3] package/uclibc: needs a host with an UTF8
	locale to build locales
In-Reply-To: <cover.1480844552.git.yann.morin.1998@free.fr>
References: <cover.1480844552.git.yann.morin.1998@free.fr>
Message-ID: <64d34d91f3e1e5a207fb9d7184b29c521cf46f18.1480844552.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index fdf007e..88b9947 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -41,6 +41,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 	bool "Enable toolchain locale/i18n support"
 	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
 	select BR2_ENABLE_LOCALE
+	select BR2_NEEDS_HOST_UTF8_LOCALE
 	help
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
-- 
2.7.4
