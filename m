From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Sep 2014 18:05:29 +0200
Subject: [Buildroot] [PATCH 1/2] sq: package/libcec: needs libudev,
	not a udev daemon
In-Reply-To: <1410019530-2060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410019530-2060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1410019530-2060-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 8097472..1acf987 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library, udev"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB || \
+		!BR2_PACKAGE_HAS_LIBUDEV
-- 
1.7.10.4
