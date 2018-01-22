From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:40 -0200
Subject: [Buildroot] [PATCH 12/14] size-stats-compare: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-13-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E129 visually indented line with same indent as next logical line
E302 expected 2 blank lines, found 1

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/size-stats-compare | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index e5a1ec3..f69c3ed 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -24,6 +24,7 @@ import csv
 import argparse
 import sys
 
+
 def read_file_size_csv(inputf, detail=None):
     """Extract package or file sizes from CSV file into size dictionary"""
     sizes = {}
@@ -31,7 +32,7 @@ def read_file_size_csv(inputf, detail=None):
 
     header = next(reader)
     if (header[0] != 'File name' or header[1] != 'Package name' or
-        header[2] != 'File size' or header[3] != 'Package size'):
+            header[2] != 'File size' or header[3] != 'Package size'):
         print(("Input file %s does not contain the expected header. Are you "
                "sure this file corresponds to the file-size-stats.csv "
                "file created by 'make graph-size'?") % inputf.name)
@@ -45,6 +46,7 @@ def read_file_size_csv(inputf, detail=None):
 
     return sizes
 
+
 def compare_sizes(old, new):
     """Return delta/added/removed dictionaries based on two input size
     dictionaries"""
@@ -64,6 +66,7 @@ def compare_sizes(old, new):
 
     return delta
 
+
 def print_results(result, threshold):
     """Print the given result dictionary sorted by size, ignoring any entries
     below or equal to threshold"""
-- 
2.7.4
