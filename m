From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:38:16 +0200
Subject: [Buildroot] [git commit] get-developers: use --cc instead of --to
	for developers
Message-ID: <20161019213822.22A1F80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d12fe93935234ae3b635cc01665cb0c4ebb583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Output of get-developers script in our manual uses --cc for developers,
but actual output of get-developers script uses --to. This patch makes
code consistent with documentation, by using --cc for developers.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
