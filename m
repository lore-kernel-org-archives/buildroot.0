From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Mar 2018 08:33:48 +0100
Subject: [Buildroot] [git commit] tremor: security bump to fix CVE-2018-5146
Message-ID: <20180320073407.C00A981334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80266c95052024381898cada4c51d44207fddd80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prevent out-of-bounds write in codebook decoding.

Codebooks that are not an exact divisor of the partition size are now
truncated to fit within the partition.

Upstream has migrated from subversion to git, so change to git and bump the
version to include the fix for CVE-2018-5146.

While we're at it, also add a hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tremor/tremor.hash | 3 +++
 package/tremor/tremor.mk   | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
new file mode 100644
index 0000000000..89661a64cd
--- /dev/null
+++ b/package/tremor/tremor.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 ba94cfdf886399c550f76908285bfa9e322f24085de6f1810c2abea565c13a15  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz
+sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 05996e2a8a..835fe36172 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
-TREMOR_SITE_METHOD = svn
-TREMOR_VERSION = 19427
+TREMOR_VERSION = 7c30a66346199f3f09017a09567c6c8a3a0eedc8
+TREMOR_SITE = https://git.xiph.org/tremor.git
+TREMOR_SITE_METHOD = git
 TREMOR_LICENSE = BSD-3-Clause
 TREMOR_LICENSE_FILES = COPYING
 
