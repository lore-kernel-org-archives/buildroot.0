From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:39:53 +0100
Subject: [Buildroot] [PATCH 4/6] makedevs: Rework README
In-Reply-To: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414971595-9972-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make all the example as a space separated list.
The definition of the different type was modified to look like the same
section on the manual.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/makedevs/README | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/makedevs/README b/package/makedevs/README
index 6c54052..70844bf 100644
--- a/package/makedevs/README
+++ b/package/makedevs/README
@@ -6,7 +6,7 @@ You can do all sorts of interesting things with a device table file.
 For example, if you want to adjust the permissions on a particular
 file you can just add an entry like:
 
-  /sbin/foobar        f       2755    0       0       -       -       -       -       -
+  /sbin/foobar f 2755 0 0 - - - - -
 
 and (assuming the file /sbin/foobar exists) it will be made setuid
 root (regardless of what its permissions are on the host filesystem.
@@ -15,20 +15,20 @@ Furthermore, you can use a single table entry to create a many device
 minors.  For example, if I wanted to create /dev/hda and
 /dev/hda[0-15] I could just use the following two table entries:
 
-  /dev/hda    b       640     0       0       3       0       0       0       -
-  /dev/hda    b       640     0       0       3       1       1       1       15
+  /dev/hda b 640 0 0 3 0 0 0 -
+  /dev/hda b 640 0 0 3 1 1 1 15
 
 Device table entries take the form of:
 
-<name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+<name> <type> <mode> <uid> <gid> <major> <minor> <start> <inc> <count>
 
 where name is the file name,  type can be one of:
 
-      f       A regular file
-      d       Directory
-      c       Character special device file
-      b       Block special device file
-      p       Fifo (named pipe)
+      f: A regular file
+      d: Directory
+      c: Character special device file
+      b: Block special device file
+      p: Fifo (named pipe)
 
 uid is the user id for the target file, gid is the group id for the
 target file.  The rest of the entries (major, minor, etc) apply only
-- 
2.1.1
