Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C827EC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 12:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C6144188A;
	Thu, 26 Oct 2023 12:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C6144188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKagwElTBs9w; Thu, 26 Oct 2023 12:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 704D7418D0;
	Thu, 26 Oct 2023 12:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704D7418D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69F361BF414
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 12:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7AF418CC
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 12:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E7AF418CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_xooUqoqKy3 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 12:12:41 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4645441841
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 12:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4645441841
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vzE4qkDM9rpFEvzE4qWiYp; Thu, 26 Oct 2023 14:12:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 14:12:35 +0200
Message-Id: <20231026121235.567459-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHZn612u8dC7NvMG14swxWr4jbRcW+C7/BO2fZw9jofXvmAnI+o/kU80o2ePWarz5ojLISc8EFjMhnrRy9UaaKJ/UhLGs6FKtYL3LtuaiXkrehKUY2Fk
 ZRRUFDtex3ep7wFBaeF1F92GPc+faV5qvpCqbhpKu8sYg2M4BeUot/5exqQBAoQWdwmgeU9SRZlVO1X5sgnuql7i0wWAUTbQSrJAeB24SSAyHm9u+vQn/vQG
 r8KW/dzXS/lsRxMIyZRxZKeRuUGCjHOWB1RrsBqNWP/e6KrX029IB/abAJZYAgdAt0SPBwXbbTQ+oV7/YcMunw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698322357; bh=bvgv7xz27JVwRtYDvEQOSGxAngH3PMyIhFwCIlLbwyc=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zg+o8h9uOKWSpmK22z7trKIs7Ld3GISKsuzswlxj0ka9ZfY6hmbZLEEKgEQYWQcgJ
 CMPqlIQpe8VQ8PdB6u68eLERIZRV6sxDuStcSCwDfi4dUANhSV2tzAMCPNiezr5Yoo
 mZuB07q7vQLDb7/HzHJ9H3Y0mnQzoHrcfJ1i5vKZ/CBaG374raciTRi3TQgkiHSLHg
 xPknbz6xZnNa6bZLe4Xa28wK6fB/ViQNVAvmtO6+/8aNGQggeqgR85wdysNUztATKk
 QNjmaaMUBPiAYXMLtz37+Kp4iWLhE+7cZl1rBr+LO1JeO5YkprMELoql/KW2dB1zR/
 s1MyOepyGL8KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Zg+o8h9u
Subject: [Buildroot] [PATCH] package/nfs-utils: fix build failure due to
 glibc <= 2.24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patches pending upstream that check if <sys/random.h> exists or
not. If it doesn't exist it uses uses the corresponding syscall if present,
otherwise it fails to build during autotools configuration. This happens
only on Linux < 3.17.

Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...e-due-to-glibc-2.24-and-check-for-Li.patch | 98 +++++++++++++++++++
 .../0004-Drop-unused-sys-random.h.patch       | 40 ++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 package/nfs-utils/0003-Fix-build-failure-due-to-glibc-2.24-and-check-for-Li.patch
 create mode 100644 package/nfs-utils/0004-Drop-unused-sys-random.h.patch

diff --git a/package/nfs-utils/0003-Fix-build-failure-due-to-glibc-2.24-and-check-for-Li.patch b/package/nfs-utils/0003-Fix-build-failure-due-to-glibc-2.24-and-check-for-Li.patch
new file mode 100644
index 0000000000..4febfee9e4
--- /dev/null
+++ b/package/nfs-utils/0003-Fix-build-failure-due-to-glibc-2.24-and-check-for-Li.patch
@@ -0,0 +1,98 @@
+From b99d073193502efdead21a6d2488350e1a29bac4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 26 Oct 2023 13:18:51 +0200
+Subject: [PATCH] Fix build failure due to glibc <= 2.24 and check for Linux
+ 3.17+
+
+Function getrandom() is present only with glibc 2.24+ so add a direct
+syscall otherwise. This is only possible with Linux 3.17+ so let's also
+check for it and in case emit error on autotools configure.
+
+Upstream: https://patchwork.kernel.org/project/linux-nfs/patch/20231026114522.567140-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ configure.ac                      | 32 +++++++++++++++++++++++++++++++
+ support/reexport/backend_sqlite.c | 17 +++++++++++++++-
+ 2 files changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6fbcb974..7efca90c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -328,6 +328,38 @@ AC_CHECK_HEADERS([sched.h], [], [])
+ AC_CHECK_FUNCS([unshare fstatat statx], [] , [])
+ AC_LIBPTHREAD([])
+ 
++AC_MSG_CHECKING([for getrandom (Linux 3.17+, glibc 2.25+)])
++AC_LINK_IFELSE([AC_LANG_SOURCE([
++  #include <stdlib.h>  /* for NULL */
++  #include <sys/random.h>
++  int main() {
++    return getrandom(NULL, 0U, 0U);
++  }
++])], [
++    AC_DEFINE([HAVE_GETRANDOM], [1],
++        [Define to 1 if you have the `getrandom' function.])
++    AC_MSG_RESULT([yes])
++], [
++    AC_MSG_RESULT([no])
++
++    AC_MSG_CHECKING([for syscall SYS_getrandom (Linux 3.17+)])
++    AC_LINK_IFELSE([AC_LANG_SOURCE([
++      #include <stdlib.h>  /* for NULL */
++      #include <unistd.h>  /* for syscall */
++      #include <sys/syscall.h>  /* for SYS_getrandom */
++      int main() {
++        syscall(SYS_getrandom, NULL, 0, 0);
++        return 0;
++      }
++    ])], [
++        AC_DEFINE([HAVE_SYSCALL_GETRANDOM], [1],
++            [Define to 1 if you have `syscall' and `SYS_getrandom'.])
++        AC_MSG_RESULT([yes])
++    ], [
++        AC_MSG_ERROR(['syscall' and 'SYS_getrandom' not found.])
++    ])
++])
++
+ # rpc/rpc.h can come from the glibc or from libtirpc
+ nfsutils_save_CPPFLAGS="${CPPFLAGS}"
+ CPPFLAGS="${CPPFLAGS} ${TIRPC_CFLAGS}"
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 132f30c4..f1e390bc 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -7,13 +7,28 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/random.h>
+ #include <unistd.h>
+ 
+ #include "conffile.h"
+ #include "reexport_backend.h"
+ #include "xlog.h"
+ 
++/* Fix up glibc <= 2.24 not having getrandom() */
++#if defined HAVE_GETRANDOM
++#include <sys/random.h>
++#else
++#include <sys/syscall.h>
++static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
++{
++# if defined(__NR_getrandom)
++	return syscall(__NR_getrandom, buffer, length, flags);
++# else
++	errno = ENOSYS;
++	return -1;
++# endif
++}
++#endif
++
+ #define REEXPDB_DBFILE NFS_STATEDIR "/reexpdb.sqlite3"
+ #define REEXPDB_DBFILE_WAIT_USEC (5000)
+ 
+-- 
+2.34.1
+
diff --git a/package/nfs-utils/0004-Drop-unused-sys-random.h.patch b/package/nfs-utils/0004-Drop-unused-sys-random.h.patch
new file mode 100644
index 0000000000..b8467a573d
--- /dev/null
+++ b/package/nfs-utils/0004-Drop-unused-sys-random.h.patch
@@ -0,0 +1,40 @@
+From 03946584e9ecadb72b09433ff86cc70d297a970f Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 26 Oct 2023 13:23:44 +0200
+Subject: [PATCH] Drop unused <sys/random.h>
+
+Upstream: https://patchwork.kernel.org/project/linux-nfs/patch/20231026114522.567140-2-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/reexport/fsidd.c    | 1 -
+ support/reexport/reexport.c | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index d4b245e8..352de1be 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -10,7 +10,6 @@
+ #include <limits.h>
+ #include <stdint.h>
+ #include <stdio.h>
+-#include <sys/random.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index d9a700af..c59e6b2f 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -7,7 +7,6 @@
+ #endif
+ #include <stdint.h>
+ #include <stdio.h>
+-#include <sys/random.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/vfs.h>
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
