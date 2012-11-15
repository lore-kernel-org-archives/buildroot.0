From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:52 +0100
Subject: [Buildroot] [git commit] manual: add make-tips.txt
Message-ID: <20121115230539.A02829A031@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0cdae65f7e062ccfa00790fe6c4419b4c143b36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/make-tips.txt    |   58 ++++++++++++++++++++++++++++++++++++++++++
 docs/manual/working-with.txt |    2 +
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
new file mode 100644
index 0000000..5b00536
--- /dev/null
+++ b/docs/manual/make-tips.txt
@@ -0,0 +1,58 @@
+// -*- mode:doc -*- ;
+
+[[make-tips]]
+'make' tips
+-----------
+
+Because Buildroot is a set of Makefiles and patches, there are few
+things useful to know, such as:
+
++make *config+ commands offer a search tool. Read the help message in
+the different frontend menu to know how to use it:
+
+* in _menuconfig_, search tool is called by pressing +/+;
+* in _xconfig_, search tool is called by pressing +ctrl+ + +f+.
+
+The result of the search show the help message of the matching items.
+
+Display all command executed by make:
+
+--------------------
+ $ make V=0|1 <target>
+--------------------
+
+Display all available targets:
+
+--------------------
+ $ make help
+--------------------
+
+Note that some settings in the +.config+ file may hide some targets:
+
+* +busybox-menuconfig+ depends on whether +busybox+ is enabled or not
+  in the +Package selection+ menu
+* +linux-menuconfig+ and +linux-savedefconfig+ depend on whether
+  +linux+ is enabled or not
+* +uclibc-menuconfig+ depends on whether the toolchain uses the
+  Buildroot internal toolchain backend or not
+* +ctng-menuconfig+ depends on whether the toolchain uses the
+  crosstool-NG backend or not
+* +barebox-menuconfig+ and +barebox-savedefconfig+ depend on whether
+  +barebox+ bootloader is enabled or not
+
+Delete all build products (including build directories, host, staging
+and target trees, the images and the toolchain):
+
+--------------------
+ $ make clean
+--------------------
+
+Delete all build products as well as the configuration:
+
+--------------------
+ $ make distclean
+--------------------
+
+Note that if +ccache+ is enabled, running +make clean|distclean+ does
+not empty the cache of compiler used by Buildroot. To delete it, refer
+to xref:ccache[].
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index 3c57504..4ea9239 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -6,6 +6,8 @@ Working with Buildroot
 This section explains how you can customize Buildroot to fit your
 needs.
 
+include::make-tips.txt[]
+
 include::customize.txt[]
 
 include::common-usage.txt[]
