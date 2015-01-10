From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:43:50 +0100
Subject: [Buildroot] [git commit] newt: avoid poisoned paths
Message-ID: <20150110105031.9736B801D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51eeca9f9751f0f17958bd1c408c3c88b07b08c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/cb908f73b14e1510bea890167b3927afbf708d6f/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...makefile.patch => 0001-newt-fix-makefile.patch} |    0
 package/newt/0002-slang-include-dir.patch          |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/newt/newt-fix-makefile.patch b/package/newt/0001-newt-fix-makefile.patch
similarity index 100%
rename from package/newt/newt-fix-makefile.patch
rename to package/newt/0001-newt-fix-makefile.patch
diff --git a/package/newt/0002-slang-include-dir.patch b/package/newt/0002-slang-include-dir.patch
new file mode 100644
index 0000000..a88ee70
--- /dev/null
+++ b/package/newt/0002-slang-include-dir.patch
@@ -0,0 +1,15 @@
+slang.h is in sysroot/usr/include, no need to use -I
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -5,7 +5,7 @@
+ CPP = @CPP@
+ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+-CPPFLAGS = -D_GNU_SOURCE -I/usr/include/slang @CPPFLAGS@ 
++CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
+ GNU_LD = @GNU_LD@
+ 
+ VERSION = @VERSION@
