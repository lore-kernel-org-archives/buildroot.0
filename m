From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2020 10:13:08 +0100
Subject: [Buildroot] [git commit] support/run-tests: reorder imports
Message-ID: <20200217090133.D4EF78E378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5abe7e4ce3e098ddb7a060e24f2f8aa60b0353a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorder imports using the isort utility to fix a warning from pylint3:

wrong-import-order: standard import "import multiprocessing" should be
placed before "import nose2"

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/run-tests | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index f295c053ff..022209b414 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -1,9 +1,10 @@
 #!/usr/bin/env python3
 import argparse
-import sys
+import multiprocessing
 import os
+import sys
+
 import nose2
-import multiprocessing
 
 from infra.basetest import BRConfigTest
 
