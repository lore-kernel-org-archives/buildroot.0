From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jan 2017 14:53:02 +1100
Subject: [Buildroot] [git commit] package/uclibc: Fix removal of libintl.h
Message-ID: <20170117040205.48E967FEA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2720755adcec82d433b69d2fd6eccc1b3e7d6085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to fix
http://autobuild.buildroot.net/results/6be/6be94fe2542f3ac9fb785dd22f504e25c2a7802e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0004-Makefile.in-Fix-removal-of-libintl.h.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch b/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch
new file mode 100644
index 0000000..7cbcd47
--- /dev/null
+++ b/package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch
@@ -0,0 +1,33 @@
+From 5f7b66fe28a785330a874a11001d7758dd5a59d7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 16 Jan 2017 21:01:43 +0100
+Subject: [PATCH 1/1] Makefile.in: Fix removal of libintl.h
+
+A wrong filename was present in Makefile.in leaving libintl.h installed
+even if libintl support is disabled leading to wrong configure checks
+by other packages.
+
+Patch sent upstream:
+http://mailman.uclibc-ng.org/pipermail/devel/2017-January/001360.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c8afe1cd0..bb3549c19 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -281,7 +281,7 @@ HEADERS_RM-$(UCLIBC_HAS_GETOPT_LONG)         += getopt.h
+ HEADERS_RM-$(UCLIBC_HAS_IPV6)                += netinet/ip6.h netinet/icmp6.h
+ HEADERS_RM-$(UCLIBC_HAS_BACKTRACE)           += execinfo.h
+ HEADERS_RM-$(UCLIBC_HAS_LIBICONV)            += iconv.h
+-HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += intl.h
++HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += libintl.h
+ HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += bits/uClibc_ctype.h
+ HEADERS_RM-$(UCLIBC_HAS_PTY)                 += pty.h
+ HEADERS_RM-$(UCLIBC_HAS_REALTIME)            += mqueue.h bits/mqueue.h sched.h \
+-- 
+2.11.0
+
