From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  1 Oct 2020 20:49:22 +0200
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 12.18.4
Message-ID: <20201001184922.18748-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-8201: HTTP Request Smuggling due to CR-to-Hyphen conversion

  Affected Node.js versions converted carriage returns in HTTP request
  headers to a hyphen before parsing.  This can lead to HTTP Request
  Smuggling as it is a non-standard interpretation of the header.

  Impacts:
    All versions of the 14.x and 12.x releases line

- CVE-2020-8252: fs.realpath.native may cause buffer overflow

  libuv's realpath implementation incorrectly determined the buffer size
  which can result in a buffer overflow if the resolved path is longer than
  256 bytes.

  Impacts:
    All versions of the 10.x release line
    All versions of the 12.x release line

For more details, see the advisory:
https://nodejs.org/en/blog/vulnerability/september-2020-security-releases/

Adjust license hash for the addition of the BSD-3c licensed highlight.js:
https://github.com/nodejs/node/commit/6f8b7a85d239129273948386c34775810f2dc4a3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 60d69a8638..33fb407882 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.18.0/SHASUMS256.txt
-sha256  d4688636a378367f5157f02bd5c13902f5c193356f8f7a35c99dfa383b03b13f  node-v12.18.0.tar.xz
+# From https://nodejs.org/dist/v12.18.4/SHASUMS256.txt
+sha256  25f03cb18e53b6d0959d0c219e701a85eb4693f526bdda7c72bc6199b364f609  node-v12.18.4.tar.xz
 
 # Hash for license file
-sha256  cd2e5817a25d7d28efba927b01056cae04a616b673014159f9eafeb008a0e747  LICENSE
+sha256  0dc03af08b95ea0c1e27f8fd591dee4383eb6f2c304db6eb6cdfb6751f7da87b  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e384d4c8a0..b159b10253 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.18.0
+NODEJS_VERSION = 12.18.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.20.1
