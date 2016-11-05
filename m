From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:49:05 +0100
Subject: [Buildroot] [git commit] get-developers: fix parentheses for print
Message-ID: <20161105104930.47043817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c29f023fc60392384f69b7530d729723913b778d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python3 complains about missing parentheses.

$ ./support/scripts/get-developers
  File "./support/scripts/get-developers", line 45
    print f
          ^
SyntaxError: Missing parentheses in call to 'print'

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/get-developers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/get-developers b/support/scripts/get-developers
index 83f1e5b..40ed08f 100755
--- a/support/scripts/get-developers
+++ b/support/scripts/get-developers
@@ -42,7 +42,7 @@ def __main__():
     if args.check:
         files = getdeveloperlib.check_developers(devs)
         for f in files:
-            print f
+            print(f)
 
     # Handle the architecture action
     if args.architecture is not None:
