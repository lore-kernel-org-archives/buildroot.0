From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 18:03:25 +0200
Subject: [Buildroot] [git commit] docs/manual: documentation for recursive
	makedevs syntax
Message-ID: <20150411160341.D5EA77FD44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68cb6a88c1c0da1567cabd83684170ccb820ae98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the documentation for the new makedevs
recursive syntax.

[Thomas: s/folder/directory/ as suggested by Yann.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/makedev-syntax.txt |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index e02b79d..283119d 100644
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
+Alternatively, if you want to change owner/permission of a directory
+recursively, you can put:
+
+----
+/usr/share/myapp r 750 myuser myuser - - - - -
 ----
 
 On the other hand, if you want to create the device file +/dev/hda+
