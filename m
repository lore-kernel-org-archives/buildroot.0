Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BB7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:00:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49AD61206
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A49AD61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA50607D2;
	Sat, 11 Sep 2021 15:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svL-dEXQR7Fw; Sat, 11 Sep 2021 15:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 916B861BD0;
	Sat, 11 Sep 2021 15:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCE8C1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98D3415A2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVDHbgWp9fq2 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F089340513
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C271089077; Sat, 11 Sep 2021 14:58:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:50:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dda79970661090f202e1f20e5982ba53fdaeb95
X-Git-Newrev: 4672478a7a6b2d52cb4ce7a450da3892d4c19bb1
X-Patchwork-Hint: ignore
Message-Id: <20210911145842.C271089077@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump version to 5.14.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4672478a7a6b2d52cb4ce7a450da3892d4c19bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...issue-when-name-open-_to_handle_at-is-not.patch | 114 ---------------------
 package/iproute2/iproute2.hash                     |   2 +-
 package/iproute2/iproute2.mk                       |   2 +-
 3 files changed, 2 insertions(+), 116 deletions(-)

diff --git a/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch b/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
deleted file mode 100644
index b4e6374874..0000000000
--- a/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From c5b72cc56bf88160bbf477ec8565fed865e7a1c9 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Sat, 8 May 2021 08:49:26 +0200
-Subject: [PATCH] lib/fs: fix issue when {name,open}_to_handle_at() is not
- implemented
-
-With commit d5e6ee0dac64 the usage of functions name_to_handle_at() and
-open_by_handle_at() are introduced. But these function are not available
-e.g. in uclibc-ng < 1.0.35. To have a backward compatibility check for the
-availability in the configure script and in case of absence do a direct
-syscall.
-
-Fixes: d5e6ee0dac64 ("ss: introduce cgroup2 cache and helper functions")
-Cc: Dmitry Yakunin <zeil@yandex-team.ru>
-Cc: Petr Vorel <petr.vorel@gmail.com>
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
-Signed-off-by: David Ahern <dsahern@kernel.org>
-[ upstream-status: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=c5b72cc56bf88160bbf477ec8565fed865e7a1c9 ]
----
- configure | 28 ++++++++++++++++++++++++++++
- lib/fs.c  | 25 +++++++++++++++++++++++++
- 2 files changed, 53 insertions(+)
-
-diff --git a/configure b/configure
-index 2c363d3b..179eae08 100755
---- a/configure
-+++ b/configure
-@@ -202,6 +202,31 @@ EOF
-     rm -f $TMPDIR/setnstest.c $TMPDIR/setnstest
- }
-
-+check_name_to_handle_at()
-+{
-+    cat >$TMPDIR/name_to_handle_at_test.c <<EOF
-+#define _GNU_SOURCE
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
-+int main(int argc, char **argv)
-+{
-+	struct file_handle *fhp;
-+	int mount_id, flags, dirfd;
-+	char *pathname;
-+	name_to_handle_at(dirfd, pathname, fhp, &mount_id, flags);
-+	return 0;
-+}
-+EOF
-+    if $CC -I$INCLUDE -o $TMPDIR/name_to_handle_at_test $TMPDIR/name_to_handle_at_test.c >/dev/null 2>&1; then
-+        echo "yes"
-+        echo "CFLAGS += -DHAVE_HANDLE_AT" >>$CONFIG
-+    else
-+        echo "no"
-+    fi
-+    rm -f $TMPDIR/name_to_handle_at_test.c $TMPDIR/name_to_handle_at_test
-+}
-+
- check_ipset()
- {
-     cat >$TMPDIR/ipsettest.c <<EOF
-@@ -492,6 +517,9 @@ fi
- echo -n "libc has setns: "
- check_setns
-
-+echo -n "libc has name_to_handle_at: "
-+check_name_to_handle_at
-+
- echo -n "SELinux support: "
- check_selinux
-
-diff --git a/lib/fs.c b/lib/fs.c
-index f161d888..05697a7e 100644
---- a/lib/fs.c
-+++ b/lib/fs.c
-@@ -25,11 +25,36 @@
-
- #include "utils.h"
-
-+#ifndef HAVE_HANDLE_AT
-+# include <sys/syscall.h>
-+#endif
-+
- #define CGROUP2_FS_NAME "cgroup2"
-
- /* if not already mounted cgroup2 is mounted here for iproute2's use */
- #define MNT_CGRP2_PATH  "/var/run/cgroup2"
-
-+
-+#ifndef HAVE_HANDLE_AT
-+struct file_handle {
-+	unsigned handle_bytes;
-+	int handle_type;
-+	unsigned char f_handle[];
-+};
-+
-+static int name_to_handle_at(int dirfd, const char *pathname,
-+	struct file_handle *handle, int *mount_id, int flags)
-+{
-+	return syscall(__NR_name_to_handle_at, dirfd, pathname, handle,
-+	               mount_id, flags);
-+}
-+
-+static int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
-+{
-+	return syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
-+}
-+#endif
-+
- /* return mount path of first occurrence of given fstype */
- static char *find_fs_mount(const char *fs_to_find)
- {
---
-2.31.1
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index de4d09a3c1..2837edb09d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36  iproute2-5.13.0.tar.xz
+sha256  210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4  iproute2-5.14.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 46d3662767..fdf442a429 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.13.0
+IPROUTE2_VERSION = 5.14.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
