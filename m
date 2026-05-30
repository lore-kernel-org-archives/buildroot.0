Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D90CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71D2470A7;
	Tue,  9 Jun 2026 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ziFEg1nRszN; Tue,  9 Jun 2026 13:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF6E49823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010362;
	bh=IO7ViGchfUQ0ZITFhb9gC1JlrNtJiKAdJdLCQbpjuZI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A5Fnp0jAGcV8T5yvgZoY+8GKRN8K++KWIltsoraIvGyHcdkxNet4UFZP4Tisy7zPv
	 VSZiaINEB8lJ7xZpGkwhi1LAUqCHEjd3kcxc46vdWVeSWtCAdmvqa57ulBSEHq6whi
	 FeNEldPMWaWp+sz72QT6M5TkGiEyXJZdhwpvZB1/dM+IGqE5jrsKYX3OHlsWOnmC6W
	 45pKB+MR8ZV837HkWWOlZ+Q6GB7RP6ETGgmibWwPSNktpt9hdcuCLEIrOlkb3NxtMU
	 zLHvDYUPVn1EIBDmvygHNCSUW3S3tNBCvS0XoUXyZDWcX6AlNgO0sPOX2HuG1EYD+k
	 dEnxWPISzv//g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF6E49823;
	Tue,  9 Jun 2026 13:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C600A2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC4A426BF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r90ukt4W8S8k for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98190426D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98190426D6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3A6D87E7E; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:24:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9874899101ee9b7436296841d03cb8e0940c5d7c
X-Git-Newrev: a295c5bb0cc8c6f18c005bcc9dfc42c731b4a92a
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.D3A6D87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20260529
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7870392514382310644=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7870392514382310644==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a295c5bb0cc8c6f18c005bcc9dfc42c731b4a92a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/linux-test-project/ltp/releases/tag/20260529

Removed patch backported from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t2-define-_GNU_SOURCE-and-include-fcntl.h.patch | 84 ----------------------
 package/ltp-testsuite/ltp-testsuite.hash           |  4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)

diff --git a/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch b/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch
deleted file mode 100644
index e4b654b319..0000000000
--- a/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 767b3e519e85095dfee3a47d15a373a403fe3dab Mon Sep 17 00:00:00 2001
-From: Li Wang <liwang@redhat.com>
-Date: Tue, 3 Feb 2026 10:43:19 +0800
-Subject: [PATCH] openat2: define _GNU_SOURCE and include <fcntl.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On Fedora Rawhide (glibc 2.43+), libc exposes openat2() and struct open_how,
-so our configure script defines HAVE_OPENAT2 and the fallback definition in
-lapi/openat2.h gets skipped. But openat20*.c never included <fcntl.h> (and
-lacked _GNU_SOURCE), so the libc-provided prototype and struct stayed hidden,
-so compilation failed:
-
-  # uname -r
-  6.18.0-65.fc44.x86_64
-
-  # rpm -qf /usr/include/fcntl.h
-  glibc-devel-2.43-1.fc44.x86_64
-
-  # nm -D /usr/lib64/libc.so.6 | grep -w openat2
-  00000000000eb890 W openat2@@GLIBC_2.43
-
-  # make -C testcase/kernel/syscalls/openat2
-  openat201.c:27:62: error: invalid application of ‘sizeof’ to incomplete type ‘struct open_how’
-    27 |         {&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, 0, &how, sizeof(*how)},
-
-Define _GNU_SOURCE and include <fcntl.h> in openat2 tests to make the
-prototype available and fix the build.
-
-Signed-off-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-
-Upstream: https://github.com/linux-test-project/ltp/commit/767b3e519e85095dfee3a47d15a373a403fe3dab
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- testcases/kernel/syscalls/openat2/openat201.c | 3 +++
- testcases/kernel/syscalls/openat2/openat202.c | 3 +++
- testcases/kernel/syscalls/openat2/openat203.c | 3 +++
- 3 files changed, 9 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/openat2/openat201.c b/testcases/kernel/syscalls/openat2/openat201.c
-index ecd63b150e4..40ac2f6d9ad 100644
---- a/testcases/kernel/syscalls/openat2/openat201.c
-+++ b/testcases/kernel/syscalls/openat2/openat201.c
-@@ -4,6 +4,9 @@
-  *
-  * Basic openat2() test.
-  */
-+#define _GNU_SOURCE
-+#include <fcntl.h>
-+
- #include "tst_test.h"
- #include "lapi/openat2.h"
- 
-diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
-index 6d1b5a67c7d..329c6a4a5cb 100644
---- a/testcases/kernel/syscalls/openat2/openat202.c
-+++ b/testcases/kernel/syscalls/openat2/openat202.c
-@@ -4,6 +4,9 @@
-  *
-  * openat2() tests with various resolve flags.
-  */
-+#define _GNU_SOURCE
-+#include <fcntl.h>
-+
- #include "tst_test.h"
- #include "lapi/openat2.h"
- 
-diff --git a/testcases/kernel/syscalls/openat2/openat203.c b/testcases/kernel/syscalls/openat2/openat203.c
-index 6ac49ef4c9e..cd0c00d7523 100644
---- a/testcases/kernel/syscalls/openat2/openat203.c
-+++ b/testcases/kernel/syscalls/openat2/openat203.c
-@@ -4,6 +4,9 @@
-  *
-  * Basic openat2() test to check various failures.
-  */
-+#define _GNU_SOURCE
-+#include <fcntl.h>
-+
- #include "tst_test.h"
- #include "lapi/openat2.h"
- 
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index e1861ae4e4..1284362138 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20260130/ltp-full-20260130.tar.xz.sha256
-sha256  5effc9d3eb3f5cd45d47e8ac3d78f59cb8f3f73c8598a2f182ef5b40ddfff311  ltp-full-20260130.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20260529/ltp-full-20260529.tar.xz.sha256
+sha256  685d83c6e370ac09201fb79593412f868fe031ee2890e204b5727fedcf51fb47  ltp-full-20260529.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 2e4767b1a5..d1fb40ed55 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20260130
+LTP_TESTSUITE_VERSION = 20260529
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 

--===============7870392514382310644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7870392514382310644==--
