From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:25:15 +0100
Subject: [Buildroot] [git commit] package/libressl: move config options
Message-ID: <20191231081603.19DE08E8B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd2ced0a1d51b71d0ceb686806c13b78b17b8959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we've recently done for libopenssl (openssl, the original),
move the libressl option to a libressl-specific Config.in.

The gain is minimal at best, but this is mostly for symetry with
libopenssl.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libressl/Config.in |  9 +++++++++
 package/openssl/Config.in  | 10 +---------
 2 files changed, 10 insertions(+), 9 deletions(-)

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
