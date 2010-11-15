From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Mon, 15 Nov 2010 09:58:01 +0100
Subject: [Buildroot] [PATCH 1/4] libglib2: add missing dependency on ipv6
In-Reply-To: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
References: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1289811484-30702-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libglib2/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3d42430..4d0aae7 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,10 +5,12 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_INET_IPV6 # ipv6
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support"
+comment "libglib2 requires a toolchain with WCHAR & IPV6 support"
 	depends on !BR2_USE_WCHAR
+	depends on !BR2_INET_IPV6
-- 
1.7.2.3
