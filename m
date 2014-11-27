From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 13:48:17 -0300
Subject: [Buildroot] [PATCH 1/2] skeleton: make /run a directory
Message-ID: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using a /tmp symlink makes it racy (mode 1777 for /tmp proper) and ugly.
While at it also point /var/run to /run until everything is moved there like
it should be.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/run        | 1 -
 system/skeleton/run/.empty | 0
 system/skeleton/var/run    | 2 +-
 3 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 120000 system/skeleton/run
 create mode 100644 system/skeleton/run/.empty

diff --git a/system/skeleton/run b/system/skeleton/run
deleted file mode 120000
index 1c2f433..0000000
--- a/system/skeleton/run
+++ /dev/null
@@ -1 +0,0 @@
-tmp
\ No newline at end of file
diff --git a/system/skeleton/run/.empty b/system/skeleton/run/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/system/skeleton/var/run b/system/skeleton/var/run
index 1431b0e..84ba55b 120000
--- a/system/skeleton/var/run
+++ b/system/skeleton/var/run
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run
\ No newline at end of file
-- 
2.0.4
