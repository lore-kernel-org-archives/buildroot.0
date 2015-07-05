From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2015 19:43:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: security bump
In-Reply-To: <cover.1436118128.git.yann.morin.1998@free.fr>
References: <cover.1436118128.git.yann.morin.1998@free.fr>
Message-ID: <7521a4379f6888a5f5269441914ecd71fc5b1560.1436118128.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Critical security flaw:
    https://medium.com/@iojs/important-security-upgrades-for-node-js-and-io-js-8ac14ece5852

Fixes #8201.

Reported-by: Chris Becker <goabonga@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
 .../{0.12.5 => 0.12.6}/0002-gyp-force-link-command-to-use-CXX.patch   | 0
 .../0003-Use-a-python-variable-instead-of-hardcoding-Python.patch     | 0
 .../0004-fix-build-error-without-OpenSSL-support.patch                | 0
 package/nodejs/Config.in                                              | 4 ++--
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename package/nodejs/{0.12.5 => 0.12.6}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

diff --git a/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.6/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/0.12.6/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.6/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.12.6/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.6/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/0.12.6/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.6/0004-fix-build-error-without-OpenSSL-support.patch
similarity index 100%
rename from package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch
rename to package/nodejs/0.12.6/0004-fix-build-error-without-OpenSSL-support.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5b871ea..ff7f56c 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -34,7 +34,7 @@ config BR2_BR2_PACKAGE_NODEJS_0_10_X
 
 # V8 included with v0.12.5 requires at least ARMv6
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
-	bool "v0.12.5"
+	bool "v0.12.6"
 	depends on !BR2_ARM_CPU_ARMV5
 
 endchoice
@@ -42,7 +42,7 @@ endchoice
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
-	default "0.12.5"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
+	default "0.12.6"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 816d602..f3b2831 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
 sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt
-sha256	4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2  node-v0.12.5.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.12.6/SHASUMS256.txt
+sha256	7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2  node-v0.12.6.tar.gz
-- 
1.9.1
