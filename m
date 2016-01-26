From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:52:51 +0100
Subject: [Buildroot] [git commit] package/xl2tp: fix musl build
Message-ID: <20160201224702.B55D17F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9693d44aac1251a6ae3e877a04fbc75ccce0b68c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/78d/78daf927aa43591401a072230b582591add1204c/
http://autobuild.buildroot.net/results/b7e/b7e42137e2a7379ea8acb76b2d4faece86ab488a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xl2tp/0002-musl.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/xl2tp/0002-musl.patch b/package/xl2tp/0002-musl.patch
new file mode 100644
index 0000000..44238e8
--- /dev/null
+++ b/package/xl2tp/0002-musl.patch
@@ -0,0 +1,19 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/xl2tpd/xl2tpd-compile.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -u --recursive src.orig/xl2tpd-1.3.6/xl2tpd.c src/xl2tpd-1.3.6/xl2tpd.c
+--- xl2tpd-1.3.6.orig/xl2tpd.c	2014-01-15 21:58:37.000000000 -0100
++++ xl2tpd-1.3.6/xl2tpd.c	2014-06-21 07:22:21.195278618 -0200
+@@ -33,8 +33,6 @@
+ #if (__GLIBC__ < 2)
+ # if defined(FREEBSD) || defined(OPENBSD)
+ #  include <sys/signal.h>
+-# elif defined(LINUX)
+-#  include <bsd/signal.h>
+ # elif defined(SOLARIS)
+ #  include <signal.h>
+ # endif
