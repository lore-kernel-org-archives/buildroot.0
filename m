From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Dec 2016 21:16:52 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump 0.10.x series to 0.10.48
Message-ID: <20161202201652.17515-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

c-ares: fix for single-byte buffer overwrite, CVE-2016-5180, more
information at https://c-ares.haxx.se/adv_20160929.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{0.10.47 => 0.10.48}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.47 => 0.10.48}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 .../{0.10.47 => 0.10.48}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.47 => 0.10.48}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{0.10.47 => 0.10.48}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{0.10.47 => 0.10.48}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.10.47 => 0.10.48}/0003-fix-musl-USE-MISC-build-issue.patch (100%)
 rename package/nodejs/{0.10.47 => 0.10.48}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/0.10.47/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.47/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.47/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.47/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.47/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.47/0003-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.47/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.47/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index a47ba37..832152b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "6.9.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.47"
+	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 5df79af..e55bb16 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.47/SHASUMS256.txt
-sha256  335bdf4db702885a8acaf2c9f241c70cabd62497361da81aca65c8e8a8e7ff09  node-v0.10.47.tar.xz
+# From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
+sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v6.9.1/SHASUMS256.txt
 sha256  0bdd8d1305777cc8cd206129ea494d6c6ce56001868dd80147aff531d6df0729  node-v6.9.1.tar.xz
-- 
2.10.2
