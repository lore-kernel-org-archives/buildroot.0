Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B695D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE98F826DA;
	Fri, 12 Dec 2025 07:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4_bzW7sHcBN; Fri, 12 Dec 2025 07:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D3B982A17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526158;
	bh=KOsqEmzuKcPM5EfYxMySklOyrvb5ZIFlZSmUont3oDQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jmI8t8eLoJGCRpF0fQdR0ae/mhDEQLFBbFnp0dro5YdNxJONc29yiL8ZlkbxAsZEt
	 I2gy9egz3Y1GoXtowlNnLNiFh2KLreYuKIJydU3e3fZ2r6ZIEy60kXvh1ajNBQCZ5P
	 cnyfgGB0qI0F0jDNyGeP/8N3VUjR79Md6zxvmdzg/nAfH6qxpABtPHqphn0IaeT1IZ
	 HS94UOh2tiFHDZake643/f2DmoqEHSv3zd0U07DRQDbYAY3IUIfksn99wWQuKtFISV
	 s3s3dl6VMqZOto+06ABTpiDEzUbz/mF51M1r/Zw7JZt4hdVDFBx4EHRXPkRR/ijIpL
	 NZ5S89oIjRNEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3B982A17;
	Fri, 12 Dec 2025 07:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE952EB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9518402A8
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSrywj0T7fPM for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47A904024C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A904024C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AB5786CA1; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:03:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7599c95be65e17c9bad813e7643d7a8eb3e4b601
X-Git-Newrev: c8845983ae593553b22cd94876fd8a2491b36c43
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.3AB5786CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: bump to version 10.5.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
