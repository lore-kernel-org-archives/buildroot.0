From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 00:34:32 +0100
Subject: [Buildroot] [PATCH-2017.02.x] nodejs: security bump to version
 6.12.2
Message-ID: <20171230233432.29998-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-15896 - Node.js was affected by OpenSSL vulnerability
CVE-2017-3737 in regards to the use of SSL_read() due to TLS handshake
failure.  The result was that an active network attacker could send
application data to Node.js using the TLS or HTTP2 modules in a way that
bypassed TLS authentication and encryption.

For more details, see the announcement:
https://nodejs.org/en/blog/vulnerability/december-2017-security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{6.11.5 => 6.12.2}/0001-gyp-force-link-command-to-use-CXX.patch   | 0
 .../0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch       | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.11.5 => 6.12.2}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{6.11.5 => 6.12.2}/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch (100%)

diff --git a/package/nodejs/6.11.5/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.12.2/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.11.5/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.12.2/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.11.5/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/6.12.2/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
similarity index 100%
rename from package/nodejs/6.11.5/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
rename to package/nodejs/6.12.2/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 9ce02306e4..c88baaff2b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.11.5"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.12.2"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 319774c62d..f82ce1e3a7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.11.5/SHASUMS256.txt
-sha256  1c6de415216799fbaeca82304b3fef87accc7101ebf2ead7d5c545e0779e8aaf  node-v6.11.5.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.12.2/SHASUMS256.txt
+sha256  33677c1fcf6a2f35d2718834fd0afdb36166b0cc68349820e05d8f9316b1dafc  node-v6.12.2.tar.xz
-- 
2.11.0
