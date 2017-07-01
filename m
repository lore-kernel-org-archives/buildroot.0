From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:43:51 +0200
Subject: [Buildroot] [git commit] get-developers: fix handling of syntax
	error
Message-ID: <20170701174126.07EED7FE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d01452ce6ee076c244236773bb8a229869584f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When getdeveloperlib.parse_developers doesn't find anything, the script
tries sys.exit(1) but sys is not imported.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/get-developers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/get-developers b/utils/get-developers
index 40ed08f..fa6fc2f 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -2,6 +2,7 @@
 
 import argparse
 import getdeveloperlib
+import sys
 
 def parse_args():
     parser = argparse.ArgumentParser()
