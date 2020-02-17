From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2020 23:38:49 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 12.16.0
Message-ID: <20200217223849.16987-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues (12.15.0):

- CVE-2019-15606: HTTP header values do not have trailing OWS trimmed

- CVE-2019-15605: HTTP request smuggling using malformed Transfer-Encoding
  header

- CVE-2019-15604: Remotely trigger an assertion on a TLS server with a
  malformed certificate string

For more details, see the advisory:
https://nodejs.org/en/blog/vulnerability/february-2020-security-releases/

On top of this, 12.16.0 brings a number of changes and bugfixes.

Update the license hash for an addition of the (MIT) licensing terms for the
uvwsai module:

+
+- uvwasi, located at deps/uvwasi, is licensed as follows:
+  """
+    MIT License
+
+    Copyright (c) 2019 Colin Ihrig and Contributors
+
+    Permission is hereby granted, free of charge, to any person obtaining a copy
+    of this software and associated documentation files (the "Software"), to deal
+    in the Software without restriction, including without limitation the rights
+    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+    copies of the Software, and to permit persons to whom the Software is
+    furnished to do so, subject to the following conditions:
+
+    The above copyright notice and this permission notice shall be included in all
+    copies or substantial portions of the Software.
+
+    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+    SOFTWARE.
+  """

While we are at it, adjust the white space in the .hash function to match
the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 92369105ff..8a56c04713 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.14.1/SHASUMS256.txt
-sha256 877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb  node-v12.14.1.tar.xz
+# From https://nodejs.org/dist/v12.16.0/SHASUMS256.txt
+sha256  b8c90637473fce4444a0b4fdae2c1560a1cf9f5959fdf9670541fc52868cf925  node-v12.16.0.tar.xz
 
 # Hash for license file
-sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE
+sha256  3f5749f7a58edaadd77843057a90063a18067f472d8b26c0a76905cafa1063e3  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e6eb73d576..0de3495df9 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.14.1
+NODEJS_VERSION = 12.16.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.20.1
