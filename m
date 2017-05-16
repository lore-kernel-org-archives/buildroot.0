From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 16 May 2017 22:45:31 +0200
Subject: [Buildroot] [PATCH 3/3] support/testing/run-tests: help: put the
	one-letter form before the long form
In-Reply-To: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
References: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1494967531-6463-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is what the manpages usually do, and what Python does with the
automatically-added -h/--help parameter:

Before the change:
  $ ./support/testing/run-tests
    [...]
  optional arguments:
    -h, --help            show this help message and exit
    --list, -l            list of available test cases
    --all, -a             execute all test cases

After the change:
  $ ./support/testing/run-tests
    [...]
  optional arguments:
    -h, --help            show this help message and exit
    -l, --list            list of available test cases
    -a, --all             execute all test cases

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/run-tests | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 339bb66efa34..07dad0d8b938 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -10,17 +10,17 @@ def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
     parser.add_argument('testname', nargs='*',
                         help='list of test cases to execute')
-    parser.add_argument('--list', '-l', action='store_true',
+    parser.add_argument('-l', '--list', action='store_true',
                         help='list of available test cases')
-    parser.add_argument('--all', '-a', action='store_true',
+    parser.add_argument('-a', '--all', action='store_true',
                         help='execute all test cases')
-    parser.add_argument('--stdout', '-s', action='store_true',
+    parser.add_argument('-s', '--stdout', action='store_true',
                         help='log everything to stdout')
-    parser.add_argument('--output', '-o',
+    parser.add_argument('-o', '--output',
                         help='output directory')
-    parser.add_argument('--download', '-d',
+    parser.add_argument('-d', '--download',
                         help='download directory')
-    parser.add_argument('--keep', '-k',
+    parser.add_argument('-k', '--keep',
                         help='keep build directories',
                         action='store_true')
 
-- 
2.7.4
