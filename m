From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  7 May 2018 10:50:42 +0200
Subject: [Buildroot] [PATCH] support/download/file: fix file:// protocol
 handling
Message-ID: <1525683042-21087-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes the file:// prefix from file url before passing it
to the cp command. It fixes also a missing / between url directory
and file part.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 support/download/file | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index fefd6d2..6dd37b0 100755
--- a/support/download/file
+++ b/support/download/file
@@ -40,4 +40,4 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "'${dir}${file}'" "'${output}'"
+_localfiles ${verbose} "'${dir##file://}/${file}'" "'${output}'"
-- 
2.7.4
