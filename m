From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jun 2010 23:15:29 +0200
Subject: [Buildroot] [git commit master] openssl: bump version,
	enable mdc2+camellia+tlsext
Message-ID: <20100606213749.1A57B8B8A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3dbc86f09897a7d038cce04ea986bbb7ce819eb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1951

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    5 +++--
 package/openssl/openssl.mk |    6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index f26f67f..259fd04 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf, php, qt,
-	tn5250, usbutils
+	Updated/fixed packages: cdrkit, libidn, netperf, openssl, php,
+	qt, tn5250, usbutils
 
 	Removed packages: modutils
 
@@ -21,6 +21,7 @@
 	#1903: Bump tn5250 to 0.17.4 and migrate to autotargets
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 	#1945: PHP: add sqlite3 dependency when using external lib
+	#1951: Bump openssl to 0.9.8o
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index c52e256..330b604 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,7 +3,7 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8n
+OPENSSL_VERSION:=0.9.8o
 OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
@@ -32,8 +32,10 @@ define OPENSSL_CONFIGURE_CMDS
 			threads \
 			shared \
 			no-idea \
-			no-mdc2 \
 			no-rc5 \
+			enable-camellia \
+			enable-mdc2 \
+			enable-tlsext \
 			zlib-dynamic \
 	)
 	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
-- 
1.6.3.3
