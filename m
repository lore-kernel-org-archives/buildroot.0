From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:04:29 +0200
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 8.11.3
Message-ID: <20180617121254.8A167846DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64baf3def763fe962f19d7ca083cf019a73f6281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- (CVE-2018-7167): Fixes Denial of Service vulnerability where calling
  Buffer.fill() could hang

- (CVE-2018-7161): Fixes Denial of Service vulnerability by updating the
  http2 implementation to not crash under certain circumstances during
  cleanup

- (CVE-2018-1000168): Fixes Denial of Service vulnerability by upgrading
  nghttp2 to 1.32.0

See https://nodejs.org/en/blog/release/v8.11.3/ for more details

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 25b035d694..be4c3de4f7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From http://nodejs.org/dist/v8.11.2/SHASUMS256.txt
-sha256 539946c0381809576bed07424a35fc1740d52f4bd56305d6278d9e76c88f4979  node-v8.11.2.tar.xz
+# From http://nodejs.org/dist/v8.11.3/SHASUMS256.txt
+sha256 577c751fdca91c46c60ffd8352e5b465881373bfdde212c17c3a3c1bd2616ee0  node-v8.11.3.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0c7db83012..61cd03bb8f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.11.2
+NODEJS_VERSION = 8.11.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
