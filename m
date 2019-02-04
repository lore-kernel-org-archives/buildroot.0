From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Feb 2019 10:39:55 -0600
Subject: [Buildroot] [PATCH] support/testing: use minimal build for test_git
Message-ID: <1549298395-7248-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Original configuration results in a full Buildroot internal toolchain
build.  This config update drops the build time to ~60sec from ~700sec.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/tests/download/test_git.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 156784d..2d48ccf 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -6,7 +6,8 @@ import infra
 
 
 class GitTestBase(infra.basetest.BRTest):
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        infra.basetest.MINIMAL_CONFIG + \
         """
         BR2_BACKUP_SITE=""
         """
-- 
1.9.1
