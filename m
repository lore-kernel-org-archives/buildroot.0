From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Mar 2014 22:52:43 +0100
Subject: [Buildroot] [git commit] igmpproxy: uclinux is also linux
Message-ID: <20140313220037.6475C9BF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5cb5c3605cc3ce6c54601080aa421ec0c93d06f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3dc/3dcb26947d7eee7ae4f17a082a144912c44f0526/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/igmpproxy/igmpproxy-01-uclinux.patch |   16 ++++++++++++++++
 package/igmpproxy/igmpproxy.mk               |    2 ++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/igmpproxy/igmpproxy-01-uclinux.patch b/package/igmpproxy/igmpproxy-01-uclinux.patch
new file mode 100644
index 0000000..7fa4a23
--- /dev/null
+++ b/package/igmpproxy/igmpproxy-01-uclinux.patch
@@ -0,0 +1,16 @@
+configure.ac: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura igmpproxy-0.1.orig/configure.ac igmpproxy-0.1/configure.ac
+--- igmpproxy-0.1.orig/configure.ac	2014-03-12 18:43:02.369323771 -0300
++++ igmpproxy-0.1/configure.ac	2014-03-12 18:43:22.129979179 -0300
+@@ -7,7 +7,7 @@
+ 
+ AC_CANONICAL_HOST
+ case $host_os in
+-	linux*) os=linux;;
++	linux*|uclinux*) os=linux;;
+ 	freebsd*) os=freebsd;;
+ 	netbsd*) os=netbsd;;
+ 	openbsd*) os=openbsd;;
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 577717c..cdf3774 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -6,6 +6,8 @@
 
 IGMPPROXY_VERSION = 0.1
 IGMPPROXY_SITE = http://downloads.sourceforge.net/project/igmpproxy/igmpproxy/$(IGMPPROXY_VERSION)
+# igmpproxy-01-uclinux.patch
+IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPLv2+
 IGMPPROXY_LICENSE_FILES = COPYING
 
