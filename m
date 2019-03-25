From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 23:21:39 +0100
Subject: [Buildroot] [PATCH-2019.02] package/nodejs: security bump to
 version 8.15.1
Message-ID: <20190325222139.5666-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

Node.js: Slowloris HTTP Denial of Service with keep-alive (CVE-2019-5737)
OpenSSL: 0-byte record padding oracle (CVE-2019-1559)

For more details, see the CHANGELOG:
https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V8.md#8.15.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 5a06e5328c..ad8ad4ad99 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.15.0/SHASUMS256.txt
-sha256 968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633  node-v8.15.0.tar.xz
+# From https://nodejs.org/dist/v8.15.1/SHASUMS256.txt
+sha256 6b6486a3f452624941f6e11dd5f878c298d43e9c21b5f43ca1721dc7ce25add1  node-v8.15.1.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 446cb77dbf..06d2eaad99 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.15.0
+NODEJS_VERSION = 8.15.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.11.0
