Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E32D116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27EE6119A;
	Mon,  1 Dec 2025 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6F20mpkM8xQ; Mon,  1 Dec 2025 20:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAA661182
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAA661182;
	Mon,  1 Dec 2025 20:17:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90F92FA
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6E140671
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACZERg1SMY79 for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 20:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBBC640107
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBC640107
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:16:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9DA886341; Mon,  1 Dec 2025 20:16:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:03:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7599c95be65e17c9bad813e7643d7a8eb3e4b601
X-Git-Newrev: c8845983ae593553b22cd94876fd8a2491b36c43
X-Patchwork-Hint: ignore
Message-Id: <20251201201658.A9DA886341@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/frr: bump to version
 10.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8845983ae593553b22cd94876fd8a2491b36c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update FRR to the latest stable version (10.5.0; see [1]).

The 'lib-make-getloadavg-optional-in-late-timer-warnings' patch can be
dropped, as it has been merged upstream in FRR 10.5.

[1] https://github.com/FRRouting/frr/releases/tag/frr-10.5.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...etloadavg-optional-in-late-timer-warnings.patch | 49 ----------------------
 package/frr/frr.hash                               |  2 +-
 package/frr/frr.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
deleted file mode 100644
index d03f64882e..0000000000
--- a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d76100a2b9a2ec814ad0a1fb844a395a6dc2f6bd Mon Sep 17 00:00:00 2001
-From: Maxime Leroy <maxime@leroys.fr>
-Date: Mon, 11 Aug 2025 13:44:02 +0200
-Subject: [PATCH] lib: make getloadavg() optional in late timer warnings
-
-Commit ff76fb21d7b3 ("lib: improve late timer warnings") added an
-unconditional getloadavg() call. Older libcs (e.g. uClibc, dietlibc)
-lack this function, breaking the build. Before, no system load was
-shown, so skipping it restores prior behavior.
-
-Fixes: ff76fb21d7b3 ("lib: improve late timer warnings")
-Signed-off-by: Maxime Leroy <maxime@leroys.fr>
-Upstream: https://github.com/FRRouting/frr/pull/19366
----
- configure.ac | 1 +
- lib/event.c  | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 87eba6784a..b8ef7bb777 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1369,6 +1369,7 @@ dnl ---------------
- AC_CHECK_FUNCS([ \
- 	strlcat strlcpy \
- 	getgrouplist \
-+	getloadavg \
- 	openat \
- 	unlinkat \
- 	posix_fallocate \
-diff --git a/lib/event.c b/lib/event.c
-index 1eb41d07ce..22876574fb 100644
---- a/lib/event.c
-+++ b/lib/event.c
-@@ -1924,7 +1924,11 @@ static void event_tardy_warn(struct event *thread, unsigned long since_us)
- 	double loadavg[3];
- 	int rv;
- 
-+#ifdef HAVE_GETLOADAVG
- 	rv = getloadavg(loadavg, array_size(loadavg));
-+#else
-+	rv = -1;
-+#endif
- 	if (rv < 0)
- 		bprintfrr(&fb, "not available");
- 	else {
--- 
-2.43.0
-
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 12030a0df8..3ba034606d 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8e4003eaba168626c5ea7a6735f2c85c87b04214e6f8c8f2715b21f8ae40970b  frr-10.4.1.tar.gz
+sha256  a84b973e713349dca09e2009f33dc499564f2e9faba01c0d3cba9204802b0cd5  frr-10.5.0.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e41ee33caa..9282e13fbd 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.4.1
+FRR_VERSION = 10.5.0
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
