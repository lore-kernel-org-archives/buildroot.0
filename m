Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47478E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516EA608DD;
	Sat, 14 Dec 2024 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrYHR9_lF3mg; Sat, 14 Dec 2024 20:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E7E608F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E7E608F3;
	Sat, 14 Dec 2024 20:03:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C25CE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B0B608DD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HdGxZNd5UhV for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:03:55 +0000 (UTC)
X-Greylist: delayed 399 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 14 Dec 2024 20:03:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16CDB608DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CDB608DB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.138;
 helo=smtpout1.mo533.mail-out.ovh.net; envelope-from=clement@clementramirez.fr;
 receiver=<UNKNOWN> 
Received: from smtpout1.mo533.mail-out.ovh.net
 (smtpout1.mo533.mail-out.ovh.net [51.210.94.138])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16CDB608DB
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:03:52 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4Y9cRq22BFz1T1m
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:57:11 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:57:11 +0000 (UTC)
Received: from DAG3EX1.emp3.local (unknown [10.111.182.102])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4Y9cRq0g83z86Jr
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:57:11 +0000 (UTC)
Received: from localhost.localdomain (93.8.28.88) by DAG3EX1.emp3.local
 (172.16.2.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 14 Dec
 2024 20:57:10 +0100
From: Clement Ramirez <clement@clementramirez.fr>
To: <buildroot@buildroot.org>
CC: Clement Ramirez <clement@clementramirez.fr>
Date: Sat, 14 Dec 2024 20:56:49 +0100
Message-ID: <20241214195649.917315-1-clement@clementramirez.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [93.8.28.88]
X-ClientProxiedBy: DAG3EX2.emp3.local (172.16.2.32) To DAG3EX1.emp3.local
 (172.16.2.31)
X-Ovh-Tracer-Id: 16363547773122824821
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrkeelgddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeevlhgvmhgvnhhtucftrghmihhrvgiiuceotghlvghmvghnthestghlvghmvghnthhrrghmihhrvgiirdhfrheqnecuggftrfgrthhtvghrnhepjeegveejfeeuueeltdevffdtleetjeduhefgkeefleffgeevgfffgeeufeeuffeknecuffhomhgrihhnpegsuhhshigsohigrdhnvghtnecukfhppeduvdejrddtrddtrddupdelfedrkedrvdekrdekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheptghlvghmvghnthestghlvghmvghnthhrrghmihhrvgiirdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehfeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; d=clementramirez.fr;
 s=ovhemp1147278-selector1; c=relaxed/relaxed; t=1734206230;
 h=from:to:subject:date; bh=gGa4WXx/ONkcW9/7xztswb5fDx53uFyKRa6wyR+nL6U=;
 b=IqGdN65qtmsMqjoYIRdjBBkDLII54QkEedoW3Kr+rPjpWZs7W4co+yHFGK4rGVj1wx/406o7OESrsXhV49NcztBeHkFykiUrzACt+gXHxX9WD+rLFnFdnvStGpWJ9qVssCfoHTP+I/a65TjXzo3JCPUhGIZE0HV6hQKM1ejV7TB0ZMOtMV8MhASysFcwIxUcN9VJnQO0FFAsxyQPllm48l+Lw4Em3KlukZYTftkcV0FrG8z17HXEzPbYBZEva+7BE839EolexbHCDPyx3n2XIq0kYzpsjz9cOL2bjviNAuvcZqjZjjJvtuu69bUrat2U9spULjSdwohsi2ndJzzZMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clementramirez.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=clementramirez.fr header.i=@clementramirez.fr
 header.a=rsa-sha256 header.s=ovhemp1147278-selector1 header.b=IqGdN65q
Subject: [Buildroot] [PATCH] package/busybox bump version to 1.37.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new release of busybox fixies CVE-2023-42363 [0].

git tag --contains fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa
1_37_0

In addtion to this, because of this version's bump, some patches needed
to be dropped because they are now upstream.
This is the case for both patches 0005, 0006 and 0008 which have been
introduced by commit [1], [2] and [3] on the Busybox release.

The patch 0007, strongly linked to [1] and [2] commits has not been
removed because the possibility to detect and build the getrandom()
function depending on the c library used, has not been introduced
upstream yet.

[0] https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa
[1] https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a
[2] https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf
[3] https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d

Signed-off-by: Clement Ramirez <clement@clementramirez.fr>
---
 ...r-glibc-2.24-not-providing-getrandom.patch |  39 -------
 ...glibc-2.24-not-providing-random-head.patch |  60 ----------
 ...CH-and-SIGCHLD-in-hush-interrupting-.patch | 103 ------------------
 package/busybox/busybox.hash                  |   2 +-
 package/busybox/busybox.mk                    |   2 +-
 5 files changed, 2 insertions(+), 204 deletions(-)
 delete mode 100644 package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
 delete mode 100644 package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
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
index 6eba365ecc..c2f8627115 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
-sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
