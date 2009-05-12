From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 12 May 2009 13:32:04 -0600
Subject: [Buildroot] [git commit] Fix gcc 3.4.6 build with newer host libc
	versions
Message-ID: <20090512212347.4435C777E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e114500d500ade3472db9d8663cf6013a5f928b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The build of gcc 3.4.6 fails when host libc is too new.
I pulled the fix from this bug report:

http://bugs.openembedded.net/show_bug.cgi?id=4626

Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 toolchain/gcc/3.4.6/950-open_ocreat_mode.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/3.4.6/950-open_ocreat_mode.patch

diff --git a/toolchain/gcc/3.4.6/950-open_ocreat_mode.patch b/toolchain/gcc/3.4.6/950-open_ocreat_mode.patch
new file mode 100644
index 0000000..5dba905
--- /dev/null
+++ b/toolchain/gcc/3.4.6/950-open_ocreat_mode.patch
@@ -0,0 +1,11 @@
+--- gcc-3.4.6/gcc/collect2.c.orig	2009-05-11 13:00:31.000000000 -0600
++++ gcc-3.4.6/gcc/collect2.c	2009-05-11 13:00:26.000000000 -0600
+@@ -1534,7 +1534,7 @@
+   if (redir)
+     {
+       /* Open response file.  */
+-      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT);
++      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, O_RDWR);
+ 
+       /* Duplicate the stdout and stderr file handles
+ 	 so they can be restored later.  */
-- 
1.6.0.6
