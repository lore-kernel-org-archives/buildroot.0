From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 11 Apr 2015 15:40:32 +0200
Subject: [Buildroot] [PATCH v2 2/2] docs/manual: documentation for recursive
	makedevs syntax
In-Reply-To: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428759632-17060-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1428759632-17060-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the documentation for the new makedevs
recursive syntax.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/manual/makedev-syntax.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index e02b79d..afb4ae2 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -24,6 +24,7 @@ There are a few non-trivial blocks:
 - +type+ is the type of the file, being one of:
   * f: a regular file
   * d: a directory
+  * r: a directory recursively
   * c: a character device file
   * b: a block device file
   * p: a named pipe
@@ -38,7 +39,14 @@ Let's say you want to change the permissions of a given file; using
 this syntax, you will need to put:
 
 ----
-/usr/bin/foobar f 644 0 0 - - -	- -
+/usr/bin/foobar f 644 0 0 - - - - -
+----
+
+Alternatively, if you want to change owner/permission of a folder
+recursively, you can put:
+
+----
+/usr/share/myapp r 750 myuser myuser - - - - -
 ----
 
 On the other hand, if you want to create the device file +/dev/hda+
-- 
1.9.1
