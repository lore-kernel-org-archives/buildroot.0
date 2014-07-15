From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:51:23 +0200
Subject: [Buildroot] [git commit] statserial: don't link against legacy
	curses
Message-ID: <20140715185128.64F849D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a95b9cc1244e3de5de294c14d8bf7f6fc9916493
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link against libncurses instead of the legacy libcurses.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../statserial/statserial-01-ncurses-link.patch    |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/statserial/statserial-01-ncurses-link.patch b/package/statserial/statserial-01-ncurses-link.patch
new file mode 100644
index 0000000..b1c41e6
--- /dev/null
+++ b/package/statserial/statserial-01-ncurses-link.patch
@@ -0,0 +1,16 @@
+Link to libncurses instead of the legacy libcurses.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura statserial-1.1.orig/Makefile statserial-1.1/Makefile
+--- statserial-1.1.orig/Makefile	2014-07-04 12:47:41.279440415 -0300
++++ statserial-1.1/Makefile	2014-07-04 12:47:47.948665740 -0300
+@@ -10,7 +10,7 @@
+ LDFLAGS = -s -N
+ 
+ statserial:	statserial.o
+-	$(LD) $(LDFLAGS) -o statserial statserial.o -lcurses
++	$(LD) $(LDFLAGS) -o statserial statserial.o -lncurses
+ 
+ statserial.o: statserial.c
+ 	$(CC) $(CFLAGS) -c statserial.c
