From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 10:40:15 +0100
Subject: [Buildroot] [git commit] testing/download: GIT use BRConfigTest
Message-ID: <20190206093859.95E90860F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6386be05b814dbfda94b0a00b164f87dbe24796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables the test to use the new non-emulator base class which takes
significantly less test time.

Cc: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/download/test_git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 121c9191d8..723f00d188 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -6,7 +6,7 @@ from gitremote import GitRemote
 import infra
 
 
-class GitTestBase(infra.basetest.BRTest):
+class GitTestBase(infra.basetest.BRConfigTest):
     config = \
         """
         BR2_BACKUP_SITE=""
