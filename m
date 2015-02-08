From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 8 Feb 2015 20:02:37 +0200
Subject: [Buildroot] [PATCH v2] perl: remove poisoned path from dynaloader
	hints
Message-ID: <20150208180237.GA29480@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/323a82776cccf17afaa00ebe3483cfc06a06f264/
http://autobuild.buildroot.net/results/7d4cf7b63fda1a062263b7a4e758c699049105af/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

---
 package/perl/0002-dynaloader-hints.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/perl/0002-dynaloader-hints.patch

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
-- 
2.0.3
