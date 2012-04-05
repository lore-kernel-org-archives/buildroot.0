From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 13:15:17 +0200
Subject: [Buildroot] [git commit] uClibc: add MSG_WAITFORONE /
	MSG_CMSG_CLOEXEC for 0.9.33
Message-ID: <20120405111656.4C97E96A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=006e073cca1532d2c845389c18697b018d368992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. systemd. Patch from yocto:

http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch    |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch b/toolchain/uClibc/uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch
new file mode 100644
index 0000000..c699b6b
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33-define-MSG_CMSG_CLOEXEC.patch
@@ -0,0 +1,28 @@
+Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
+
+From yocto:
+http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
+
+Upstream-Status: Pending
+
+Index: git/libc/sysdeps/linux/common/bits/socket.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:23:21.537456132 -0800
++++ git/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:25:10.125461388 -0800
+@@ -235,8 +235,15 @@
+ #define	MSG_ERRQUEUE	MSG_ERRQUEUE
+     MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
+ #define	MSG_NOSIGNAL	MSG_NOSIGNAL
+-    MSG_MORE		= 0x8000  /* Sender will send more.  */
++    MSG_MORE		= 0x8000,  /* Sender will send more.  */
+ #define	MSG_MORE	MSG_MORE
++    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to return.*/
++#define MSG_WAITFORONE  MSG_WAITFORONE
++
++    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
++                                           descriptor received through
++                                           SCM_RIGHTS.  */
++#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
+   };
+ 
+ 
