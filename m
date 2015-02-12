From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 08:50:32 +0100
Subject: [Buildroot] [git commit] ntp: rebase nano patch to apply cleanly
Message-ID: <20150212080451.1BDC78178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfa6311d2a0c6dfa5e3041ef371d272a774b695f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0001-nano.patch |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/ntp/0001-nano.patch b/package/ntp/0001-nano.patch
index d16046c..bce3478 100644
--- a/package/ntp/0001-nano.patch
+++ b/package/ntp/0001-nano.patch
@@ -3,10 +3,15 @@ http://bugs.gentoo.org/show_bug.cgi?id=270483
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura ntp-4.2.6p2.orig/include/ntp_syscall.h ntp-4.2.6p2/include/ntp_syscall.h
---- ntp-4.2.6p2.orig/include/ntp_syscall.h	2009-12-09 04:36:37.000000000 -0300
-+++ ntp-4.2.6p2/include/ntp_syscall.h	2011-01-27 13:09:05.072336628 -0300
-@@ -14,6 +14,14 @@
+Rebase to apply cleanly.
+
+Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+
+
+diff -purN a/include/ntp_syscall.h b/include/ntp_syscall.h
+--- a/include/ntp_syscall.h	2015-02-11 08:42:37.794576469 -0500
++++ b/include/ntp_syscall.h	2015-02-11 08:43:03.216957279 -0500
+@@ -10,6 +10,14 @@
  # include <sys/timex.h>
  #endif
  
@@ -19,5 +24,5 @@ diff -Nura ntp-4.2.6p2.orig/include/ntp_syscall.h ntp-4.2.6p2/include/ntp_syscal
 +#endif
 +
  #ifndef NTP_SYSCALLS_LIBC
- #ifdef NTP_SYSCALLS_STD
- # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
+ # ifdef NTP_SYSCALLS_STD
+ #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
