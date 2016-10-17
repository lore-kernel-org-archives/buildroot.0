From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 17 Oct 2016 22:31:31 +0530
Subject: [Buildroot] [PATCH 1/2] get-developers: use --cc instead of --to
	for developers
Message-ID: <1476723692-22814-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Output of get-developers script in our manual uses --cc for developers,
but actual output of get-developers script uses --to. This patch makes
code consistent with documentation, by using --cc for developers.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 support/scripts/get-developers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/get-developers b/support/scripts/get-developers
index f73512f..8b1891d 100755
--- a/support/scripts/get-developers
+++ b/support/scripts/get-developers
@@ -74,7 +74,7 @@ def __main__():
 
         result = "--to buildroot at buildroot.org"
         for dev in matching_devs:
-            result += " --to \"%s\"" % dev
+            result += " --cc \"%s\"" % dev
 
         if result != "":
             print("git send-email %s" % result)
-- 
2.6.2
