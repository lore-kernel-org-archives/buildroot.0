From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:38:03 +0100
Subject: [Buildroot] [git commit] support/run-tests: check for empty
 sequences in a pythonic way
Message-ID: <20200216143626.3090C8E252@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea31dc1cd4b3cd660831635cf60bf94f5d76e105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to PEP8 empty sequences should be checked as booleans.

Fixes the following PEP8 warning:
Do not use `len(SEQUENCE)` to determine if a sequence is empty

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/run-tests | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 74741aee1b..f295c053ff 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -70,7 +70,7 @@ def main():
 
     BRConfigTest.outputdir = os.path.abspath(args.output)
 
-    if args.all is False and len(args.testname) == 0:
+    if args.all is False and not args.testname:
         print("No test selected")
         print("")
         parser.print_help()
@@ -112,7 +112,7 @@ def main():
                   "-s", test_dir,
                   "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
-    if len(args.testname) != 0:
+    if args.testname:
         nose2_args += args.testname
 
     nose2.discover(argv=nose2_args)
