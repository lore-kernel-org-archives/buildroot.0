From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 13:57:10 +0200
Subject: [Buildroot] [PATCH] uclibc: add missing defines for m68k/microblaze
Message-ID: <20160731115709.GA9180@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

POLLRDHUP supported since Linux 2.6.17.
http://man7.org/linux/man-pages/man2/poll.2.html

Fixes:
http://autobuild.buildroot.net/results/0f5ed287f1756fbec710454e9c694202c3206dbe/
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...issing-Linux-extension-headers-for-poll.h.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch

diff --git a/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch b/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch
new file mode 100644
index 0000000..f28cd80
--- /dev/null
+++ b/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch
@@ -0,0 +1,71 @@
+From 7a575d98449780a95fc4004b179a2ea0dcd0f468 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sun, 31 Jul 2016 13:22:00 +0200
+Subject: [PATCH] include missing Linux extension headers for poll.h
+
+This was found by Buildroot autobuilders for m68k.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/sysdeps/linux/c6x/bits/poll.h        | 7 +++++++
+ libc/sysdeps/linux/m68k/bits/poll.h       | 7 +++++++
+ libc/sysdeps/linux/microblaze/bits/poll.h | 7 +++++++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/libc/sysdeps/linux/c6x/bits/poll.h b/libc/sysdeps/linux/c6x/bits/poll.h
+index 1d845eb..4c984cc 100644
+--- a/libc/sysdeps/linux/c6x/bits/poll.h
++++ b/libc/sysdeps/linux/c6x/bits/poll.h
+@@ -34,6 +34,13 @@
+ # define POLLWRBAND	0x100		/* Priority data may be written.  */
+ #endif
+ 
++#ifdef __USE_GNU
++/* These are extensions for Linux.  */
++# define POLLMSG	0x400
++# define POLLREMOVE	0x1000
++# define POLLRDHUP	0x2000
++#endif
++
+ /* Event types always implicitly polled for.  These bits need not be set in
+    `events', but they will appear in `revents' to indicate the status of
+    the file descriptor.  */
+diff --git a/libc/sysdeps/linux/m68k/bits/poll.h b/libc/sysdeps/linux/m68k/bits/poll.h
+index 1d845eb..4c984cc 100644
+--- a/libc/sysdeps/linux/m68k/bits/poll.h
++++ b/libc/sysdeps/linux/m68k/bits/poll.h
+@@ -34,6 +34,13 @@
+ # define POLLWRBAND	0x100		/* Priority data may be written.  */
+ #endif
+ 
++#ifdef __USE_GNU
++/* These are extensions for Linux.  */
++# define POLLMSG	0x400
++# define POLLREMOVE	0x1000
++# define POLLRDHUP	0x2000
++#endif
++
+ /* Event types always implicitly polled for.  These bits need not be set in
+    `events', but they will appear in `revents' to indicate the status of
+    the file descriptor.  */
+diff --git a/libc/sysdeps/linux/microblaze/bits/poll.h b/libc/sysdeps/linux/microblaze/bits/poll.h
+index 9b284c8..27c3219 100644
+--- a/libc/sysdeps/linux/microblaze/bits/poll.h
++++ b/libc/sysdeps/linux/microblaze/bits/poll.h
+@@ -34,6 +34,13 @@
+ # define POLLWRBAND	0x0200		/* Priority data may be written.  */
+ #endif
+ 
++#ifdef __USE_GNU
++/* These are extensions for Linux.  */
++# define POLLMSG	0x400
++# define POLLREMOVE	0x1000
++# define POLLRDHUP	0x2000
++#endif
++
+ /* Event types always implicitly polled for.  These bits need not be set in
+    `events', but they will appear in `revents' to indicate the status of
+    the file descriptor.  */
+-- 
+2.7.4 (Apple Git-66)
+
-- 
2.1.4
