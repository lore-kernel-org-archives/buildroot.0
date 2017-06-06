From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  6 Jun 2017 22:17:43 +0200
Subject: [Buildroot] [PATCH-2017.02.x 2/2] nodejs: bump 6.x version to 6.10.3
In-Reply-To: <20170606201743.16358-1-peter@korsgaard.com>
References: <20170606201743.16358-1-peter@korsgaard.com>
Message-ID: <20170606201743.16358-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

6.10.3 is the latest release in the LTS series, fixing a number of issues:

https://nodejs.org/en/blog/release/v6.10.3/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{6.10.2 => 6.10.3}/0001-gyp-force-link-command-to-use-CXX.patch   | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch     | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.10.2 => 6.10.3}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{6.10.2 => 6.10.3}/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch (100%)

diff --git a/package/nodejs/6.10.2/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.10.3/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.10.2/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.10.3/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.10.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.10.3/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.10.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.10.3/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index ad5ca050b2..5fafa8f476 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.10.2"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.10.3"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 4c63f58943..8cc6927ab2 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.10.2/SHASUMS256.txt
-sha256  80aa11333da99813973a99646e2113c6be5b63f665c0731ed14ecb94cbe846b6  node-v6.10.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.10.3/SHASUMS256.txt
+sha256  82262a703e61164e09170a14d88b1726720651b0c7ee87a277654247b21b5388  node-v6.10.3.tar.xz
-- 
2.11.0
