From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Sep 2014 23:17:25 +0200
Subject: [Buildroot] [PATCH] autobuild-run: SystemInfo: fix s/java/javac/
	typo
Message-ID: <1410211045-18241-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it fails on machines without javac

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 496f941..accccef 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -115,7 +115,7 @@ class SystemInfo:
                                stdout=devnull, stderr=devnull) == 1:
                 self.has_java = True
 
-        self.has_java = False
+        self.has_javac = False
         if subprocess.call(["which", "javac"], stdout=devnull, stderr=devnull) == 0:
             if subprocess.call("javac -version | grep gcj", shell=True,
                                stdout=devnull, stderr=devnull) == 1:
-- 
2.0.0
