From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jul 2014 14:03:01 -0300
Subject: [Buildroot] [PATCH 2/2] statserial: don't link against legacy curses
In-Reply-To: <1404493381-24414-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404493381-24414-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404493381-24414-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link against libncurses instead of the legacy libcurses.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/statserial/statserial-01-ncurses-link.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/statserial/statserial-01-ncurses-link.patch

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
-- 
1.8.5.5
