From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2019 14:44:08 +0100
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 12.14.0
Message-ID: <20191219133600.B39BB8C9DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65b89f393d274a558ac04715142422c1e134ac8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities (in npm):

- CVE-2019-16775: Versions of the npm CLI prior to 6.13.3 are vulnerable to
  an Arbitrary File Write.  It is possible for packages to create symlinks
  to files outside of thenode_modules folder through the bin field upon
  installation
  https://www.npmjs.com/advisories/1436

- CVE-2019-16776: Versions of the npm CLI prior to 6.13.3 are vulnerable to
  an Arbitrary File Write.  It fails to prevent access to folders outside of
  the intended node_modules folder through the bin field
  https://www.npmjs.com/advisories/1434

- CVE-2019-16777: Versions of the npm CLI prior to 6.13.4 are vulnerable to
  an Arbitrary File Overwrite.  It fails to prevent existing
  globally-installed binaries to be overwritten by other package
  installations
  https://www.npmjs.com/advisories/1437

For further details, see the upstream announcements:

https://blog.npmjs.org/post/189618601100/binary-planting-with-the-npm-cli
https://nodejs.org/en/blog/vulnerability/december-2019-security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 24df89017c..bde0ac0167 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.13.0/SHASUMS256.txt
-sha256 a82b1541cf670318a0102c32e06f296662b5ccccae764c1f32be4a3cf038bef6  node-v12.13.0.tar.xz
+# From https://nodejs.org/dist/v12.14.0/SHASUMS256.txt
+sha256 088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71  node-v12.14.0.tar.xz
 
 # Hash for license file
 sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 107e0b8d19..62c4c1abb1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.13.0
+NODEJS_VERSION = 12.14.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
