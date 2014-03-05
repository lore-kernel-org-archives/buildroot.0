From: Philip Paeps <philip@paeps.cx>
Date: Wed,  5 Mar 2014 11:04:41 +0100
Subject: [Buildroot] [PATCH] support: fix typo in mkusers
Message-ID: <1394013881-34422-1-git-send-email-philip@paeps.cx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the spurious "[: too many arguments" errors from mkusers.

Signed-off-by: Philip Paeps <philip@paeps.cx>
---
 support/scripts/mkusers |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index a67356a..90d1df7 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -63,7 +63,7 @@ get_uid() {
 get_ugid() {
     local username="${1}"
 
-    awk -F:i -v username="${username}"                          \
+    awk -F: -v username="${username}"                          \
         '$1 == username { printf( "%d\n", $4 ); }' "${PASSWD}"
 }
 
-- 
1.7.10.4
