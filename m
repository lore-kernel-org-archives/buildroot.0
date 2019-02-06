From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 21:25:30 -0600
Subject: [Buildroot] [PATCH v7 2/2] testing/download: GIT use BRConfigTest
In-Reply-To: <1549423530-12795-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549423530-12795-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1549423530-12795-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables the test to use the new non-emulator base class which takes
significantly less test time.

Cc: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes v7
  - New patch
---
 support/testing/tests/download/test_git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 156784d..7ea0895 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -5,7 +5,7 @@ from gitremote import GitRemote
 import infra
 
 
-class GitTestBase(infra.basetest.BRTest):
+class GitTestBase(infra.basetest.BRConfigTest):
     config = \
         """
         BR2_BACKUP_SITE=""
-- 
1.9.1
