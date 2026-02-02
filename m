Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EA0E73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E1C4091D;
	Mon,  2 Feb 2026 08:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C54N61ToZqz5; Mon,  2 Feb 2026 08:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69CA40927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770020694;
	bh=il1LyxUHrFvCM8uDrULTFU2RzgEoKLF2FVTvbLzHxoY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZL3FsU0z8xc93mL7vV/AXMgjvp3JJbNZMH/qeAqzDCUXapl1hUx1XQGzDjMJft2rw
	 a8SyQMS6TPbz6FVzZzPFDNT/5X9Lhm827ahTals8TXfcD6XWRbNci5QIKD7c+PrCT7
	 W8GyaihPbK5DmCJR0Y89oHbsCCpDgTjiHEPZOb1nSfm3CVzWQemzLK/RCwAxMUBRQx
	 9MFxlLz8JEw433DGQ6TfoXj1bYG1CzZ25tYz48N0unXKdF0AGoPaCNsNgDLR0CUlNk
	 tBnDUZxBvM5ggJMbH40c0kmCxvj4fS+CDk1yo72NbglUJTH/oYIJqKjD14u96LMJ20
	 vG8ogaRf3bMWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69CA40927;
	Mon,  2 Feb 2026 08:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD984149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C029F401D0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otj53B6UQRgI for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893714018B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893714018B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 797D98623C; Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:10:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8501cb30fb21f2ca33d6cf23d670f0456e25aca3
X-Git-Newrev: 386c34cc38ddad5afb4e48029bd8ebb4d8b64fe4
X-Patchwork-Hint: ignore
Message-Id: <20260202082450.797D98623C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: bump version to 4.0.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=386c34cc38ddad5afb4e48029bd8ebb4d8b64fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/procps-ng/procps/-/blob/v4.0.6/NEWS

Removed patch which is included in this release.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...grep-provide-definition-for-nr-pidfd_open.patch | 57 ----------------------
 package/procps-ng/procps-ng.hash                   |  8 +--
 package/procps-ng/procps-ng.mk                     |  7 +--
 3 files changed, 6 insertions(+), 66 deletions(-)

diff --git a/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch b/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
deleted file mode 100644
index 9c83124311..0000000000
--- a/package/procps-ng/0001-pgrep-provide-definition-for-nr-pidfd_open.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44 Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@broadcom.com>
-Date: Wed, 11 Dec 2024 14:53:33 -0800
-Subject: [PATCH] pgrep: provide definition for __NR_pidfd_open if needed
-
-We already implement pidfd_open() ourselves if libc doesn't provide it.
-Let's also provide our own definition of __NR_pidfd_open in case the
-kernel headers don't contain it.
-
-This way, pgrep can provide its full capabilities after being built
-against older kernel headers (for increased compatibility) but being run
-on systems with newer kernels.
-
-Signed-off-by: Markus Mayer <mmayer@broadcom.com>
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/90a0ddcd64c2d43dc2c2c856b1b42b5cae6b8a44
-Signed-off: Michael Nosthoff <buildroot@heine.tech>
----
- configure.ac | 2 +-
- src/pgrep.c  | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1e984b12..14ba3ad7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -325,7 +325,7 @@ AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
-    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
- #include <sys/syscall.h>
- #ifndef __NR_pidfd_open
--#error __NR_pidfd_open not defined
-+#warning __NR_pidfd_open not defined; using our definition
- #endif
-       ])],
-       AC_MSG_RESULT([yes]),
-diff --git a/src/pgrep.c b/src/pgrep.c
-index 2c6b06b8..6fc25dd4 100644
---- a/src/pgrep.c
-+++ b/src/pgrep.c
-@@ -874,6 +874,15 @@ static int signal_option(int *argc, char **argv)
- }
-
- #if defined(ENABLE_PIDWAIT) && !defined(HAVE_PIDFD_OPEN)
-+
-+#ifndef __NR_pidfd_open
-+#ifdef __alpha__
-+#define __NR_pidfd_open 544
-+#else
-+#define __NR_pidfd_open 434
-+#endif
-+#endif
-+
- static int pidfd_open (pid_t pid, unsigned int flags)
- {
- 	return syscall(__NR_pidfd_open, pid, flags);
---
-GitLab
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 21c661192c..8877099145 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5  90803e64f51f192f3325d25c3335d057  procps-ng-4.0.5.tar.xz
-sha1  a36b8ab95950addb4b34251fcf23195c45a63eda  procps-ng-4.0.5.tar.xz
+md5  20c23dc3dd1569a2bb1d1fa93de213ed  procps-ng-4.0.6.tar.xz
+sha1  6e23f716a86dbec3174c05bdc23a02aa72ac3185  procps-ng-4.0.6.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.5.tar.xz.asc
-sha256  c2e6d193cc78f84cd6ddb72aaf6d5c6a9162f0470e5992092057f5ff518562fa  procps-ng-4.0.5.tar.xz
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.6.tar.xz.asc
+sha256  67bea6fbc3a42a535a0230c9e891e5ddfb4d9d39422d46565a2990d1ace15216  procps-ng-4.0.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 56fe1790c3..ffd76eeb91 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 4.0.5
+PROCPS_NG_VERSION = 4.0.6
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
-PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
+PROCPS_NG_SITE = https://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_CPE_ID_VALID = YES
@@ -14,9 +14,6 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-# Applying 0001-pgrep-provide-definition-for-nr-pidfd_open.patch touches configure.ac
-PROCPS_NG_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
