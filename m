Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E59CEACFB
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E52340B1F;
	Tue,  1 Oct 2024 19:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP-LDmLNWGfL; Tue,  1 Oct 2024 19:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 764EE40B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 764EE40B14;
	Tue,  1 Oct 2024 19:34:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED3B1BF28C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B46A81346
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtLp9ziVS_XX for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 19:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65C8E812C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C8E812C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65C8E812C1
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 19:34:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0480.dip0.t-ipconnect.de [91.58.4.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F8C7A4C2CC3
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 21:34:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43230)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1svidj-000000002GQ-1trP
 for buildroot@buildroot.org; Tue, 01 Oct 2024 19:34:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Oct 2024 21:34:31 +0200
Message-Id: <20241001193431.5673-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727811272;
 bh=BZOzYhioRJEIr2GWNL724Wno+BPNLYGkrUu639HkEMg=;
 h=From:To:Subject:Date:From;
 b=DSMcDtVyoV5Zva9N3jYLPevWlL56isvO3Vfhsy5pyUG0MaQNP7WanbJcgOHC1t3Qi
 pZ4cYwHynGOwt9+Mrpq6N9AZ/qF3QphzVg5GaD0Ak1JkXPQo5QLLS7+Squhwb1AKui
 lSa621rPAutNlYXhxMcRcPCkNI2JlrVH/w+XKdgM0/+W7JhrYnylovUTC6G3bQodwj
 p3Hc2+zR1JIjyt+B0XYN2TeXMAX2GUHWmF3mjp1rUzdd9mDVTG6YhztrENKAIoeW+2
 X6X72QfthPTxZYYHjvYoOFU2oovfbmCc2D9CL+K5ZoLuiTWlub0/Zx+APghICTh5+4
 ov4o9FAJUipiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=DSMcDtVy
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.37.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which are included in this release, renumbered remaining
patches.

Release notes: https://busybox.net/news.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...r-glibc-2.24-not-providing-getrandom.patch |  39 -------
 ...random-detection-for-non-glibc-libc.patch} |   0
 ...failing-saying-ncurses-is-not-found.patch} |   0
 ...glibc-2.24-not-providing-random-head.patch |  60 ----------
 ...moved-the-definitions-related-to-CB.patch} |   0
 ...CH-and-SIGCHLD-in-hush-interrupting-.patch | 103 ------------------
 package/busybox/busybox.hash                  |   4 +-
 package/busybox/busybox.mk                    |   2 +-
 8 files changed, 3 insertions(+), 205 deletions(-)
 delete mode 100644 package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
 rename package/busybox/{0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch => 0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch} (100%)
 rename package/busybox/{0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch => 0006-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch} (100%)
 delete mode 100644 package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
 rename package/busybox/{0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch => 0007-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch} (100%)
 delete mode 100644 package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch

diff --git a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch b/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
deleted file mode 100644
index 4a194612b4..0000000000
--- a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 200a9669fbf6f06894e4243cccc9fc11a1a6073a Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 10 Apr 2023 17:26:04 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing getrandom()
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a
----
- miscutils/seedrng.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 967741dc7..7cc855141 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -45,6 +45,20 @@
- #include <sys/random.h>
- #include <sys/file.h>
- 
-+/* Fix up glibc <= 2.24 not having getrandom() */
-+#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
-+#include <sys/syscall.h>
-+# define getrandom(...) bb_getrandom(__VA_ARGS__)
-+static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
-+{
-+# if defined(__NR_getrandom)
-+	return syscall(__NR_getrandom, buffer, length, flags);
-+# else
-+	return ENOSYS;
-+# endif
-+}
-+#endif
-+
- #ifndef GRND_INSECURE
- #define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
- #endif
--- 
-2.39.1
-
diff --git a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch b/package/busybox/0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
similarity index 100%
rename from package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
rename to package/busybox/0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0006-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
similarity index 100%
rename from package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
rename to package/busybox/0006-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
diff --git a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch b/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
deleted file mode 100644
index d729884805..0000000000
--- a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From cb57abb46f06f4ede8d9ccbdaac67377fdf416cf Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 10 Apr 2023 19:58:15 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing random header
-
- - dropped the wrong define (not sure why it was there)
- - <sys/random.h> not available if glibc <= 2.24
- - GRND_NONBLOCK not defined if <sys/random.h> not included
- - ret < 0 && errno == ENOSYS has to be true to get creditable set
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf
----
- miscutils/seedrng.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 7cc855141..3bf6e2ea7 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -42,25 +42,31 @@
- #include "libbb.h"
- 
- #include <linux/random.h>
--#include <sys/random.h>
- #include <sys/file.h>
- 
- /* Fix up glibc <= 2.24 not having getrandom() */
- #if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
- #include <sys/syscall.h>
--# define getrandom(...) bb_getrandom(__VA_ARGS__)
- static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
- {
- # if defined(__NR_getrandom)
- 	return syscall(__NR_getrandom, buffer, length, flags);
- # else
--	return ENOSYS;
-+	errno = ENOSYS;
-+	return -1;
- # endif
- }
-+#else
-+#include <sys/random.h>
-+#endif
-+
-+/* Apparently some headers don't ship with this yet. */
-+#ifndef GRND_NONBLOCK
-+#define GRND_NONBLOCK 0x0001
- #endif
- 
- #ifndef GRND_INSECURE
--#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
-+#define GRND_INSECURE 0x0004
- #endif
- 
- #define DEFAULT_SEED_DIR         "/var/lib/seedrng"
--- 
-2.39.1
-
diff --git a/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch b/package/busybox/0007-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
similarity index 100%
rename from package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
rename to package/busybox/0007-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
diff --git a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
deleted file mode 100644
index 8ebb487ec6..0000000000
--- a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 93e0898c663a533082b5f3c2e7dcce93ec47076d Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 26 Jan 2023 12:56:33 +0100
-Subject: [PATCH] shell: fix SIGWINCH and SIGCHLD (in hush) interrupting line
- input, closes 15256
-
-function                                             old     new   delta
-record_pending_signo                                  32      63     +31
-lineedit_read_key                                    231     224      -7
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 1/1 up/down: 31/-7)              Total: 24 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libbb/lineedit.c | 17 ++++++++++-------
- shell/ash.c      |  3 ++-
- shell/hush.c     | 10 ++++++++--
- 3 files changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/libbb/lineedit.c b/libbb/lineedit.c
-index d6b2e76ff..b942f540a 100644
---- a/libbb/lineedit.c
-+++ b/libbb/lineedit.c
-@@ -2180,7 +2180,8 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
- 		 * "\xff\n",pause,"ls\n" invalid and thus won't lose "ls".
- 		 *
- 		 * If LI_INTERRUPTIBLE, return -1 if got EINTR in poll()
--		 * inside read_key, or if bb_got_signal != 0 (IOW: if signal
-+		 * inside read_key and bb_got_signal became != 0,
-+		 * or if bb_got_signal != 0 (IOW: if signal
- 		 * arrived before poll() is reached).
- 		 *
- 		 * Note: read_key sets errno to 0 on success.
-@@ -2197,14 +2198,16 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
- 			IF_FEATURE_EDITING_WINCH(S.ok_to_redraw = 0;)
- 			if (errno != EINTR)
- 				break;
-+			/* It was EINTR. Repeat read_key() unless... */
- 			if (state->flags & LI_INTERRUPTIBLE) {
--				/* LI_INTERRUPTIBLE bails out on EINTR,
--				 * but nothing really guarantees that bb_got_signal
--				 * is nonzero. Follow the least surprise principle:
-+				/* LI_INTERRUPTIBLE bails out on EINTR
-+				 * if bb_got_signal became nonzero.
-+				 * (It may stay zero: for example, our SIGWINCH
-+				 * handler does not set it. This is used for signals
-+				 * which should not interrupt line editing).
- 				 */
--				if (bb_got_signal == 0)
--					bb_got_signal = 255;
--				goto ret;
-+				if (bb_got_signal != 0)
-+					goto ret; /* will return -1 */
- 			}
- 		}
- 
-diff --git a/shell/ash.c b/shell/ash.c
-index 18ccc1329..5f8c8ea19 100644
---- a/shell/ash.c
-+++ b/shell/ash.c
-@@ -10821,7 +10821,8 @@ preadfd(void)
-  again:
- 		/* For shell, LI_INTERRUPTIBLE is set:
- 		 * read_line_input will abort on either
--		 * getting EINTR in poll(), or if it sees bb_got_signal != 0
-+		 * getting EINTR in poll() and bb_got_signal became != 0,
-+		 * or if it sees bb_got_signal != 0
- 		 * (IOW: if signal arrives before poll() is reached).
- 		 * Interactive testcases:
- 		 * (while kill -INT $$; do sleep 1; done) &
-diff --git a/shell/hush.c b/shell/hush.c
-index d111f0cc5..f064b8fd2 100644
---- a/shell/hush.c
-+++ b/shell/hush.c
-@@ -1946,7 +1946,12 @@ static void record_pending_signo(int sig)
- {
- 	sigaddset(&G.pending_set, sig);
- #if ENABLE_FEATURE_EDITING
--	bb_got_signal = sig; /* for read_line_input: "we got a signal" */
-+	if (sig != SIGCHLD
-+	 || (G_traps && G_traps[SIGCHLD] && G_traps[SIGCHLD][0])
-+	 /* ^^^ if SIGCHLD, interrupt line reading only if it has a trap */
-+	) {
-+		bb_got_signal = sig; /* for read_line_input: "we got a signal" */
-+	}
- #endif
- #if ENABLE_HUSH_FAST
- 	if (sig == SIGCHLD) {
-@@ -2669,7 +2674,8 @@ static int get_user_input(struct in_str *i)
- 		} else {
- 			/* For shell, LI_INTERRUPTIBLE is set:
- 			 * read_line_input will abort on either
--			 * getting EINTR in poll(), or if it sees bb_got_signal != 0
-+			 * getting EINTR in poll() and bb_got_signal became != 0,
-+			 * or if it sees bb_got_signal != 0
- 			 * (IOW: if signal arrives before poll() is reached).
- 			 * Interactive testcases:
- 			 * (while kill -INT $$; do sleep 1; done) &
--- 
-2.30.2
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 6eba365ecc..39ca8915f3 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
-sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.37.0.tar.bz2.sha256
+sha256  3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4  busybox-1.37.0.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 942875ee0e..cbd39a5e22 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.36.1
+BUSYBOX_VERSION = 1.37.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
