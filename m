From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:40:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/nodejs: security
 bump to version 8.17.0
Message-ID: <20191224075305.BC6308E19A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc3fa46ca20aec1c6504aeb64cb3fa0dca3fd19e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
index d1e2b39c35..ce987e6833 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.16.1/SHASUMS256.txt
-sha256 d8c190acdf2d967faf49c22df883d31a8d4e249d67852dae3c2d8a0f756b0512  node-v8.16.1.tar.xz
+# From https://nodejs.org/dist/v8.17.0/SHASUMS256.txt
+sha256 5b0d96db482b273f0324c299ead86ecfbc5d033516e5fc37c92cfccb933ef6ff  node-v8.17.0.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 583b2276e2..72346a516d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.16.1
+NODEJS_VERSION = 8.17.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
