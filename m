From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 10 Oct 2019 12:24:26 +0200
Subject: [Buildroot] [PATCH v3] utils/test-pkg: return sum of build and
 legal errors
Message-ID: <20191010102426.5452-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
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
-- 
2.20.1
