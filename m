From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 23:27:18 +0200
Subject: [Buildroot] [git commit] package/tinc: needs libdl for OpenSSL
	support
Message-ID: <20160525213243.66B9C81992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e87d4908cd3c53ddad0b2826f5fc7080064dd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d5b/d5b2f905d8da79cebda1408ffceac6d4c99f9e7b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 5390ff3..1d8e2c4 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TINC
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
 	depends on BR2_USE_MMU # fork()
 	help
 	  tinc is a Virtual Private Network (VPN) daemon that uses
@@ -10,3 +11,6 @@ config BR2_PACKAGE_TINC
 	  between hosts on the Internet.
 
 	  http://www.tinc-vpn.org/
+
+comment "tinc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
