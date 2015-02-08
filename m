From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Feb 2015 22:19:45 +0100
Subject: [Buildroot] [git commit] perl: remove poisoned path from dynaloader
	hints
Message-ID: <20150208212304.6AAFD805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6790b66a0d914a9a4d910e1095cb3094ed3788
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/323a82776cccf17afaa00ebe3483cfc06a06f264/
http://autobuild.buildroot.net/results/7d4cf7b63fda1a062263b7a4e758c699049105af/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/0002-dynaloader-hints.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/perl/0002-dynaloader-hints.patch b/package/perl/0002-dynaloader-hints.patch
new file mode 100644
index 0000000..2653b78
--- /dev/null
+++ b/package/perl/0002-dynaloader-hints.patch
@@ -0,0 +1,13 @@
+Buildroot puts nlist.h into sysroot/usr/include,
+which is in the default include path.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/ext/DynaLoader/hints/linux.pl
++++ b/ext/DynaLoader/hints/linux.pl
+@@ -1,5 +1 @@
+-# XXX Configure test needed.
+-# Some Linux releases like to hide their <nlist.h>
+-$self->{CCFLAGS} = $Config{ccflags} . ' -I/usr/include/libelf'
+-	if -f "/usr/include/libelf/nlist.h";
+ 1;
