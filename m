From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:26:27 +0200
Subject: [Buildroot] [git commit] bluez5_utils: needs ipv6
Message-ID: <20140804162640.170529D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c37eaabd6d62ae02ff5e5a8b15135e3b62f71ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bd2/bd262b626358563110609dde411e96dc980ebf6a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 62bac5d..9152093 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_INET_IPV6
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_DBUS
@@ -60,8 +61,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 
 endif
 
-comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 comment "bluez5-utils conflicts with older bluez-utils version"
 	depends on BR2_PACKAGE_BLUEZ_UTILS
