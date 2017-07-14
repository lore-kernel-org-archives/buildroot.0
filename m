From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:15:22 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] nodejs: security bump to
	version 6.11.1
Message-ID: <20170714131309.B8451821B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3065f3cf3953262301375ebc6e955880a94aecf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-1000381 - The c-ares function ares_parse_naptr_reply(), which
is used for parsing NAPTR responses, could be triggered to read memory
outside of the given input buffer if the passed in DNS response packet was
crafted in a particular way.  This patch checks that there is enough data
for the required elements of an NAPTR record (2 int16, 3 bytes for string
lengths) before processing a record.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{6.11.0 => 6.11.1}/0001-gyp-force-link-command-to-use-CXX.patch   | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch     | 0
 .../0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch       | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/6.11.0/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.11.1/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.11.0/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.11.1/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.11.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.11.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.11.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.11.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/6.11.0/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/6.11.1/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
similarity index 100%
rename from package/nodejs/6.11.0/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
rename to package/nodejs/6.11.1/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index be20af5..31dcfb6 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.11.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.11.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ac010ab..2dbbdc7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.11.0/SHASUMS256.txt
-sha256  02ba35391edea2b294c736489af01954ce6e6c39d318f4423ae6617c69ef0a51  node-v6.11.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.11.1/SHASUMS256.txt
+sha256  6f6655b85919aa54cb045a6d69a226849802fcc26491d0db4ce59873e41cc2b8  node-v6.11.1.tar.xz
