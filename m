From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:19:22 +0200
Subject: [Buildroot] [git commit] support/scripts/check-uniq-files: remove
 csv module import
Message-ID: <20180425192128.53CE780F79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34d32e911fa72b22369021dba9b92e1f200cc98f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 5563a1c6a48716debe2983869ddb757318094dce
("support/check-uniq-files: support weird locales and filenames"), the
'csv' Python module is no longer used by the check-uniq-files.

Due to this, flake8 complains with:

support/scripts/check-uniq-files:4:1: F401 'csv' imported but unused

Fix this by dropping the useless csv import.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-uniq-files | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index f110176274..fbc6b5d6e7 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -1,7 +1,6 @@
 #!/usr/bin/env python
 
 import sys
-import csv
 import argparse
 from collections import defaultdict
 
