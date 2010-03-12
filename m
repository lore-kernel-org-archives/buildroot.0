From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Mar 2010 23:19:57 +0100
Subject: [Buildroot] [git commit master] busybox: 1.16.0 tail fix
Message-ID: <20100312225108.5A1437758B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a66aa169af82f12b80e7aacb21676b48503000a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.0-tail.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-tail.patch

diff --git a/package/busybox/busybox-1.16.0-tail.patch b/package/busybox/busybox-1.16.0-tail.patch
new file mode 100644
index 0000000..11832a8
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-tail.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.16.0/coreutils/tail.c busybox-1.16.0-tail/coreutils/tail.c
+--- busybox-1.16.0/coreutils/tail.c	2010-03-08 22:49:32.000000000 +0100
++++ busybox-1.16.0-tail/coreutils/tail.c	2010-03-12 22:16:07.105943986 +0100
+@@ -241,7 +241,8 @@ int tail_main(int argc, char **argv)
+ 						} while (nwrite);
+ 					}
+ 				}
+-				xwrite(STDOUT_FILENO, buf + nread - nwrite, nwrite);
++				if (nwrite > 0)
++					xwrite(STDOUT_FILENO, buf + nread - nwrite, nwrite);
+ 			} else if (count) {
+ 				if (COUNT_BYTES) {
+ 					taillen += nread;
-- 
1.6.3.3
