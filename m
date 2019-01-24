From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:55:08 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/nodejs: bump
 version to v8.15.0
Message-ID: <20190124105511.528808E2BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c433d6b97ad0bbc1552ed9ab501ca9e9d9b22dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes regressions introduced by the v8.14.0 security release.  From the
announcement:

The 8.14.0 security release introduced some unexpected breakages on the 8.x
release line.  This is a special release to fix a regression in the HTTP
binary upgrade response body and add a missing CLI flag to adjust the max
header size of the http parser.

https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V8.md#8.15.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f68e5cf72118b2c6441172511812853c803202d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 13a5c2daa5..5a06e5328c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.14.0/SHASUMS256.txt
-sha256 8ce252913c9f6aaa9871f2d9661b6e54858dae2f0064bd3c624676edb09083c4  node-v8.14.0.tar.xz
+# From https://nodejs.org/dist/v8.15.0/SHASUMS256.txt
+sha256 968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633  node-v8.15.0.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 27751eef0b..d266493de9 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.14.0
+NODEJS_VERSION = 8.15.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
