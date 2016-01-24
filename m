From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:31:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: fix musl build
In-Reply-To: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453642260-24302-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/78d/78daf927aa43591401a072230b582591add1204c/
http://autobuild.buildroot.net/results/b7e/b7e42137e2a7379ea8acb76b2d4faece86ab488a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xl2tp/0002-musl.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/xl2tp/0002-musl.patch

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
-- 
2.7.0.rc3
