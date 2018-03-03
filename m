From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Mar 2018 15:36:19 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/check-uniq-files: add
 indices in format string
Message-ID: <20180303143620.16859-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using {} in format strings is only supported in sufficiently recent
Python versions. Python 2.6 doesn't support this, and only format
strings with numbered arguments: {0}, {1}, etc.

Python 2.7:

$ python -c 'print("foo {}".format(12))'
foo 12
$ python -c 'print("foo {0}".format(12))'
foo 12

Python 2.6:

$ python -c 'print("foo {}".format(12))'
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ValueError: zero length field name in format
$ python -c 'print("foo {0}".format(12))'
foo 12

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-uniq-files | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index a3d176710e..be808cce03 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -5,7 +5,7 @@ import csv
 import argparse
 from collections import defaultdict
 
-warn = 'Warning: {} file "{}" is touched by more than one package: {}\n'
+warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
 
 
 def main():
-- 
2.14.3
