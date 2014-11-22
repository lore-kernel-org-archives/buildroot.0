From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:12:38 +0100
Subject: [Buildroot] [git commit] manual: Rework makedevs syntax
Message-ID: <20141122191255.4F67C7FDF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58cb4918753dd9821a505ce42fd092013cf4fb9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

State that it should be a space separated list and fix the example.
Also reduce the number of dash used to 4.

[Thomas: replace tab by space, as noted by Yann.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/makedev-syntax.txt |   24 +++++++++++++-----------
 1 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 2fd7b59..e02b79d 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -11,13 +11,14 @@ create and how to create them, in order to avoid calls to mknod.
 This syntax is derived from the makedev utility, and more complete
 documentation can be found in the +package/makedevs/README+ file.
 
-It takes the form of a line for each file, with the following layout:
+It takes the form of a space separated list of fields, one file per
+line; the fields are:
 
 |===========================================================
 |name |type |mode |uid |gid |major |minor |start |inc |count
 |===========================================================
 
-There are a few non-trivial blocks here:
+There are a few non-trivial blocks:
 
 - +name+ is the path to the file you want to create/modify
 - +type+ is the type of the file, being one of:
@@ -35,22 +36,23 @@ There are a few non-trivial blocks here:
 
 Let's say you want to change the permissions of a given file; using
 this syntax, you will need to put:
--------------------------------------------------------------------
-/usr/bin/foobar	f	644	0	0	-	-	-	-	-
--------------------------------------------------------------------
+
+----
+/usr/bin/foobar f 644 0 0 - - -	- -
+----
 
 On the other hand, if you want to create the device file +/dev/hda+
 and the corresponding 15 files for the partitions, you will need for
 +/dev/hda+:
 
--------------------------------------------------------------------
-/dev/hda	b	640	0	0	3	0	0	0	-
--------------------------------------------------------------------
+----
+/dev/hda b 640 0 0 3 0 0 0 -
+----
 
 and then for device files corresponding to the partitions of
 +/dev/hda+, +/dev/hdaX+, +X+ ranging from 1 to 15:
 
--------------------------------------------------------------------
-/dev/hda	b	640	0	0	3	1	1	1	15
--------------------------------------------------------------------
+----
+/dev/hda b 640 0 0 3 1 1 1 15
+----
 
