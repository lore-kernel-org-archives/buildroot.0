From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 23:10:40 +0100
Subject: [Buildroot] [git commit] makedevs: Rework README
Message-ID: <20141108230842.D9CC7B3814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba82e50f8d7fa3d25c1a02a12b32539ce6cd069b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make all the example as a space separated list.
The definition of the different type was modified to look like the same
section on the manual.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/README |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

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
