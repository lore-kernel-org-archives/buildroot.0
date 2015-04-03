From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:32:11 +0200
Subject: [Buildroot] [git commit] package/apache: fix nios2 detection
Message-ID: <20150403133542.C267B81990@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6947697783e85bc032cffefb103965e954645602
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apache treats nios2 as OS/2 which is wrong.

Fixes
http://autobuild.buildroot.net/results/27c/27c5848a344c7e16feefcbd3773b50a78d6e63f0/
http://autobuild.buildroot.net/results/d8c/d8cf103033c63e79ed2db0b600f120f6fcb5b5e9/
http://autobuild.buildroot.net/results/1de/1dec866cf9a5f731a9ed93dff5b8b98001863635/
http://autobuild.buildroot.net/results/776/776be8ef579e3444123d8183dca1062ece656436/
http://autobuild.buildroot.net/results/5d2/5d21ac2d8f008d984d6f8b359ebb0e2482545683/
http://autobuild.buildroot.net/results/87f/87f25b20f63eebf7f75e35064bad79e3d383e7a8/
http://autobuild.buildroot.net/results/1b7/1b75f52c70af7880d523185565b7aaf59d9f9b3e/

[Thomas: adjust patch so that it continues to match OS/2 properly,
while still not matching NIOS2.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/0002-nios2_is_not_os2.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/apache/0002-nios2_is_not_os2.patch b/package/apache/0002-nios2_is_not_os2.patch
new file mode 100644
index 0000000..9da8cca
--- /dev/null
+++ b/package/apache/0002-nios2_is_not_os2.patch
@@ -0,0 +1,18 @@
+Fix nios2 detection.
+
+Apache treats nios2 as OS/2.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr httpd-2.4.12.org/configure.in httpd-2.4.12/configure.in
+--- httpd-2.4.12.org/configure.in	2015-01-22 18:33:07.000000000 +0100
++++ httpd-2.4.12/configure.in	2015-04-02 22:01:32.851102219 +0200
+@@ -268,7 +268,7 @@
+ AC_MSG_NOTICE([])
+ 
+ case $host in
+-  *os2*)
++  *-os2*)
+       # Use a custom made libtool replacement
+       echo "using aplibtool"
+       LIBTOOL="$abs_srcdir/srclib/apr/build/aplibtool"
