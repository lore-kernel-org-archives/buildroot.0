From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:36:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/libressl: move config options
In-Reply-To: <cover.1577738159.git.yann.morin.1998@free.fr>
References: <cover.1577738159.git.yann.morin.1998@free.fr>
Message-ID: <3c20be96d78c897e6a158af41df5b4462776e767.1577738159.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we've recently done for libopenssl (openssl, the original),
move the libressl option to a libressl-specific Config.in.

The gain is minimal at best, but this is mostly for symetry with
libopenssl.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/libressl/Config.in |  9 +++++++++
 package/openssl/Config.in  | 10 +---------
 2 files changed, 10 insertions(+), 9 deletions(-)
 create mode 100644 package/libressl/Config.in

diff --git a/package/libressl/Config.in b/package/libressl/Config.in
new file mode 100644
index 0000000000..600829cb9e
--- /dev/null
+++ b/package/libressl/Config.in
@@ -0,0 +1,9 @@
+if BR2_PACKAGE_LIBRESSL
+
+config BR2_PACKAGE_LIBRESSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary to the target file system. This is
+	  a command line tool for doing various cryptographic stuff.
+
+endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 01d3549aef..5ce91cb80f 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -44,15 +44,7 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
-if BR2_PACKAGE_LIBRESSL
-
-config BR2_PACKAGE_LIBRESSL_BIN
-	bool "openssl binary"
-	help
-	  Install the openssl binary to the target file system. This is
-	  a command line tool for doing various cryptographic stuff.
-
-endif
+source "package/libressl/Config.in"
 
 # openssl from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.openssl"
-- 
2.20.1
