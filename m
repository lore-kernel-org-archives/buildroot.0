From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 Jul 2017 19:29:50 +0200
Subject: [Buildroot] [PATCH] get-developers: fix handling of syntax error
Message-ID: <20170701172950.6869-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When getdeveloperlib.parse_developers doesn't find anything, the script
tries sys.exit(1) but sys is not imported.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/get-developers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/get-developers b/utils/get-developers
index 40ed08ffe1..fa6fc2fc68 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -2,6 +2,7 @@
 
 import argparse
 import getdeveloperlib
+import sys
 
 def parse_args():
     parser = argparse.ArgumentParser()
-- 
2.13.1
