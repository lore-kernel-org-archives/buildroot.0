From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] support/testing: check ubi image before
 booting
Message-ID: <20190903133617.9E6D88A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8de4291bd2097d8142cd9d77a2b3315d3693443b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do the same as other fs tests and minimally check the ubi image before
booting.
The call to 'file' was already there, but the output wasn't tested for
some unknown reason. Add the assert for the output of the command.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_ubi.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 015d82f769..e024d417df 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -25,6 +25,7 @@ class TestUbi(infra.basetest.BRTest):
                                       cwd=self.builddir,
                                       env={"LANG": "C"})
         out = out.splitlines()
+        self.assertIn("UBI image, version 1", out[0])
 
         subprocess.call(["truncate", "-s 128M", img])
 
