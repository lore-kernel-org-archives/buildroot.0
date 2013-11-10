From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 10:07:41 +0100
Subject: [Buildroot] [git commit] uclibc-snapshot: enable option
	UCLIBC_HAS_OBSTACK
Message-ID: <20131110093323.97AB79BB5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38dbd33b91adb4543e922e644b09430fa3836068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to uClibc commit f143f920694c, uClibc used to always include the
gnu obstack extension, which is used and required by many tools, such as
binutils.

Because of the change mentioned above, obstack is now optional, and got
disabled per default, so enable it in the uClibc snapshot configuration file.

Signed-off-by: Chris Zankel <chris@zankel.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index cb6258d..145f709 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -113,6 +113,7 @@ UCLIBC_HAS_LFS=y
 # MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
 MALLOC_GLIBC_COMPAT=y
+UCLIBC_HAS_OBSTACK=y
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV3_LEGACY=y
