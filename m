From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:54:12 +0200
Subject: [Buildroot] [git commit] utils/test-pkg: ensure to exit with an
 error upon failure
Message-ID: <20191010204912.692938CA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5093435f664992449ffe2a02b701765499e85027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit modifies the main() function so that it returns the sum of
build and legal errors, making sure the overall test-pkg script exists
with a non-zero error code upon failure.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
[Thomas: improved commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/test-pkg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index f3b34d5d0d..a317d8c17a 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -138,6 +138,8 @@ main() {
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
         ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+
+    return $((nb_fail + nb_legal))
 }
 
 build_one() {
