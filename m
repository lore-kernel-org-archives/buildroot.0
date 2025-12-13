Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D5D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 16:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB89821F5;
	Sat, 13 Dec 2025 16:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn6QJp4h8tfU; Sat, 13 Dec 2025 16:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158C582C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765641774;
	bh=EhSIlK4osMZzvJieAcSwiXmRIKB7WuKxEBMC31v2+x8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V3qzT7ZZT6QudH79nD9oHPKSE6HtKA1cMk2n9okVPlRUd4t7SOa+Hxdm8EHJXU+xS
	 NhOUxSEm0nPi7z7u/tv9NthWWEWK1fy86ZY25+ekmwDjp4t+DZICL+TCCOAMRMFUry
	 1g+WUCPkyE/Wozzg/uwmtAl7+8yiJoUfTlfZKtkc4CSC8U2IUkqd8wIg275sAzcZO+
	 eshbwTDjcJF2YImg/ThBJT0m+wuVesUUOJDD8YZc983R0XGA+thKJD6m73vFSIz5+F
	 2PgPoxM4BVw88Sf1AV1fnAqZDJr4+vmDk3jXkVwHUk6EAGPp7IWPzJDoRc8F8xGgTJ
	 WqRR+zebn+4hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 158C582C3E;
	Sat, 13 Dec 2025 16:02:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18ADAE7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 155E860D70
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FonVYrYLRFeF for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 16:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1798460C15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1798460C15
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F3F786C69; Sat, 13 Dec 2025 16:02:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 16:59:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1167d0ff3d225ca9ce2b6299da28a9307d370142
X-Git-Newrev: 0f303f3abc4dff953f249eb137edfc389e774320
X-Patchwork-Hint: ignore
Message-Id: <20251213160252.0F3F786C69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.119.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f303f3abc4dff953f249eb137edfc389e774320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119_1.rst

For release 3.119.1 tarball change from nss-3.119.1.tar.gz to
nss-3_119_1.tar.gz so let's fix it accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 2 +-
 package/libnss/libnss.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1b15364a93..0581592c63 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
-sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
+sha256  1387b8478e6c681c533b1f7b0f4d4ef7f58307c1f7e3a353622ddbf841328283  nss-3_119_1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 4a9386d3a5..b6be6dbc8c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.119
-LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
+LIBNSS_VERSION = 3.119.1
+LIBNSS_SOURCE = nss-$(subst .,_,$(LIBNSS_VERSION)).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
