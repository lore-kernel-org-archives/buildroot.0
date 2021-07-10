From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jul 2021 11:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: requires blowfish,
 RC4 and RMD160 support in openssl
Message-ID: <20210710093232.1164634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable blowfish, RC4 and RMD160 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/1872c9ce57490455946679efcc654bd111fd3d7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11vnc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 9e91a11ad1..d2639fce1e 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -7,6 +7,9 @@ config BR2_PACKAGE_X11VNC
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  VNC server for X11 display
 
-- 
2.30.2
