From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 13 Feb 2020 11:09:06 +0100
Subject: [Buildroot] [PATCH 2/2] support/run-tests: check for empty
 sequences in a pythonic way
In-Reply-To: <20200213100906.11506-1-yegorslists@googlemail.com>
References: <20200213100906.11506-1-yegorslists@googlemail.com>
Message-ID: <20200213100906.11506-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

According to PEP8 empty sequences should be checked as booleans.

Fixes the following PEP8 warning:
Do not use `len(SEQUENCE)` to determine if a sequence is empty

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/testing/run-tests | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 77a13dc78c..022209b414 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -71,7 +71,7 @@ def main():
 
     BRConfigTest.outputdir = os.path.abspath(args.output)
 
-    if args.all is False and len(args.testname) == 0:
+    if args.all is False and not args.testname:
         print("No test selected")
         print("")
         parser.print_help()
@@ -113,7 +113,7 @@ def main():
                   "-s", test_dir,
                   "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
-    if len(args.testname) != 0:
+    if args.testname:
         nose2_args += args.testname
 
     nose2.discover(argv=nose2_args)
-- 
2.17.0
