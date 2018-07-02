From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Jul 2018 23:22:28 +0200
Subject: [Buildroot] [PATCH 1/1] boost: locale needs system
Message-ID: <20180702212228.13835-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf -d output/staging/usr/lib/libboost_locale.so

Dynamic section at offset 0x76ef4 contains 29 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 2abd1aa2e1..97c49551c8 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -186,6 +186,7 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
-- 
2.14.1
