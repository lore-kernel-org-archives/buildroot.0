From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:39 +0100
Subject: [Buildroot] [PATCH v2 06/10] autobuild-run: reorganize imports
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-7-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* move "re", "mmap" to the top of the file

* sort imports alphabetically

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 38e5bae..fd294d4 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -111,17 +111,19 @@ __doc__ = doc
 
 import contextlib
 import csv
-from random import randint
-import subprocess
+import docopt
+import errno
+import hashlib
+import mmap
 import multiprocessing
-import signal
 import os
-import errno
+from random import randint
+import re
 import shutil
-from time import localtime, strftime
+import signal
+import subprocess
 import sys
-import hashlib
-import docopt
+from time import localtime, strftime
 
 if sys.hexversion >= 0x3000000:
     import configparser
@@ -584,7 +586,6 @@ def send_results(result, **kwargs):
             ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
             stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
-        import re
         regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
         for line in lastlines:
             m = regexp.search(line)
@@ -606,7 +607,6 @@ def send_results(result, **kwargs):
         if not reason:
             extract_last_500_lines()
         else:
-            import mmap
             f = open(os.path.join(outputdir, "logfile"), 'r')
             mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
             mf.seek(0)
-- 
2.3.2
