From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:09:06 +0200
Subject: [Buildroot] [git commit] support/tests: use relative test_dir
Message-ID: <20170905190220.36DBF81971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebe61135c9a242ac39204cbd901fa9f407dae069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we list the available tests, we use test_dir, which is set from
the path of the script. However, when we run the tests, we use the
hard-coded path.

Ditto to find the config file.

For consistency, always use test_dir.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/run-tests | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 95c1565..ae0bd33 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -108,8 +108,8 @@ def main():
 
     nose2_args = ["-v",
                   "-N", str(args.testcases),
-                  "-s", "support/testing",
-                  "-c", "support/testing/conf/unittest.cfg"]
+                  "-s", test_dir,
+                  "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
     if len(args.testname) != 0:
         nose2_args += args.testname
