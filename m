From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  8 Aug 2019 20:10:11 -0300
Subject: [Buildroot] [PATCH 1/5] support/testing: check ubi image before
 booting
In-Reply-To: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
References: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
Message-ID: <20190808231015.14330-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do the same as other fs tests and minimally check the ubi image before
booting.
The call to 'file' was already there, but the output wasn't tested for
some unknown reason. Add the assert for the output of the command.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
 
-- 
2.17.1
