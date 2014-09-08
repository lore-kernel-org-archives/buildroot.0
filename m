From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Sep 2014 22:17:51 +0200
Subject: [Buildroot] [PATCH] autobuild-run: also check for timeout
Message-ID: <1410207471-16986-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Timeout is part of coreutils since v8, so older distributions don't have it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index d9f55f3..496f941 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -87,7 +87,7 @@ def check_version():
 
 def check_requirements(http_login, http_password):
     devnull = open(os.devnull, "w")
-    needed_progs = ["make", "git", "gcc"]
+    needed_progs = ["make", "git", "gcc", "timeout"]
     missing_requirements = False
 
     if http_login and http_password:
-- 
2.0.0
