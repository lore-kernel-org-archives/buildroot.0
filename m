From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 11:58:27 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/nodejs: security
 bump version to 8.11.4
Message-ID: <20180824095129.1AD538E63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cfc7801d2e50579702c643d1d8e08aa2d6be43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Release notes:
https://nodejs.org/en/blog/vulnerability/august-2018-security-releases/

Fixes CVE-2018-12115, also CVEs were fixed in included OpenSSL code
which do not use for the target build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bfc5dc9920ffa9913b096cdc85572a06980ee9e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index be4c3de4f7..8285172215 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From http://nodejs.org/dist/v8.11.3/SHASUMS256.txt
-sha256 577c751fdca91c46c60ffd8352e5b465881373bfdde212c17c3a3c1bd2616ee0  node-v8.11.3.tar.xz
+# From http://nodejs.org/dist/v8.11.4/SHASUMS256.txt
+sha256 fbce7de6d96b0bcb0db0bf77f0e6ea999b6755e6930568aedaab06847552a609  node-v8.11.4.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 61cd03bb8f..e2c94ba8db 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.11.3
+NODEJS_VERSION = 8.11.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
