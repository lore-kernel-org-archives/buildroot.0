From: Sascha Arthur <sascha.arthur@gmail.com>
Date: Sun, 21 Sep 2014 18:46:26 +0200
Subject: [Buildroot] [PATCH 1/1] Removed X depency for make build-graphs
Message-ID: <1411317986-793-1-git-send-email-sascha.arthur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sascha Arthur <sascha.arthur@gmail.com>
---
 support/scripts/graph-build-time |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 524c30d..4bb90c2 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -49,9 +49,10 @@
 #   * argparse (by default in Python 2.7, requires python-argparse if
 #     Python 2.6 is used)
 
-import matplotlib
+import matplotlib as mpl
 import numpy
 
+mpl.use('Agg')
 import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
 import csv
-- 
1.7.10.4
