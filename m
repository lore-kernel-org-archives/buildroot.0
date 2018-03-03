From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Mar 2018 17:17:41 +0100
Subject: [Buildroot] [git commit] support/scripts/check-uniq-files: add
 indices in format string
Message-ID: <20180303162031.C38C6815FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62fa5e17cbce8cc5f7f308b5916b2ed5fd98816d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
