From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  9 Dec 2018 23:18:30 +0100
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.14.0
Message-ID: <20181209221830.13407-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

- Node.js: Denial of Service with large HTTP headers (CVE-2018-12121)
- Node.js: Slowloris HTTP Denial of Service (CVE-2018-12122 / Node.js)
- Node.js: Hostname spoofing in URL parser for javascript protocol
  (CVE-2018-12123)
- Node.js: HTTP request splitting (CVE-2018-12116)
- OpenSSL: Timing vulnerability in DSA signature generation (CVE-2018-0734)
- OpenSSL: Microarchitecture timing vulnerability in ECC scalar
  multiplication (CVE-2018-5407)

For more details, see the announcement:
https://nodejs.org/en/blog/release/v8.14.0/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 70d67730b1..13a5c2daa5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.12.0/SHASUMS256.txt
-sha256 5a9dff58016c18fb4bf902d963b124ff058a550ebcd9840c677757387bce419a  node-v8.12.0.tar.xz
+# From https://nodejs.org/dist/v8.14.0/SHASUMS256.txt
+sha256 8ce252913c9f6aaa9871f2d9661b6e54858dae2f0064bd3c624676edb09083c4  node-v8.14.0.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 429642b795..8c8afbc332 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.12.0
+NODEJS_VERSION = 8.14.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.11.0
