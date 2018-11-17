From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 21:56:20 -0600
Subject: [Buildroot] [PATCH v2 4/6] testing/infra/basetest: support
 br2-external
In-Reply-To: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542426982-54683-4-git-send-email-matthew.weber@rockwellcollins.com>
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
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v2
 - New from: http://patchwork.ozlabs.org/patch/912354/
---
 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5014fef..8413943 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -30,6 +30,7 @@ MINIMAL_CONFIG = \
 
 class BRTest(unittest.TestCase):
     config = None
+    br2_external = list()
     downloaddir = None
     outputdir = None
     logtofile = True
@@ -58,7 +59,7 @@ class BRTest(unittest.TestCase):
 
         if not self.b.is_finished():
             self.show_msg("Building")
-            self.b.configure()
+            self.b.configure(["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
             self.b.build()
             self.show_msg("Building done")
 
-- 
1.9.1
