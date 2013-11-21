From: Sven Neumann <neumann@teufel.de>
Date: Thu, 21 Nov 2013 22:25:07 +0100
Subject: [Buildroot] [PATCH 2/2] libglib2: the system PCRE needs to have UTF
 and UCP enabled
Message-ID: <1385069107.10963.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


If glib2 is compiled with the system PCRE instead of the included
copy, then that system PCRE needs to have support for UTF-8 and
Unicode properties enabled. Otherwise you will get such warnings
at run-time:

GLib-CRITICAL **: PCRE library is compiled without UTF8 support
GLib-CRITICAL **: PCRE library is compiled without UTF8 properties support

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/libglib2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3590d72..80e059a 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
+        select BR2_PACKAGE_PCRE_UCP if BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.4.2
