From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:40 -0300
Subject: [Buildroot] [PATCH v4] testing/infra/basetest: support br2-external
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

This change will be needed when adding a common class to test the git
download infra.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v3 -> v4:
  - allow the use of multiple br2-external trees, simplifying the code

Changes v2 -> v3:
  - new patch
  - search for "support for BR2_EXTERNAL directly in BRTest" in
    http://patchwork.ozlabs.org/patch/806161/
---
 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 4773312585..67076701e7 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -29,6 +29,7 @@ MINIMAL_CONFIG = \
 
 class BRTest(unittest.TestCase):
     config = None
+    br2_external = list()
     downloaddir = None
     outputdir = None
     logtofile = True
@@ -55,7 +56,7 @@ class BRTest(unittest.TestCase):
             self.b.delete()
 
         if not self.b.is_finished():
-            self.b.configure()
+            self.b.configure(["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
 
     def tearDown(self):
         self.show_msg("Cleaning up")
-- 
2.14.1
