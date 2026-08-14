Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA5CC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE6F6083D;
	Fri, 14 Aug 2026 13:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1udNetk0bRm; Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD1160897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713596;
	bh=pLWXwjU2bg2mMN1hn96cv4XS4Kox6YatEIJR1lBwA6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YfwH8VwXC9iIliWNR0OfH1Ga5sI13X/VBTlLSQaG8pnajv82vrLLm0SUPIId/egXu
	 R23z9sfzcwMQtLix6hJ7JOwwQCEmZPX0es80U9Jj9qU94w9rBjsmx1Ofm5LmPJ/9lR
	 GKbfXUGzFwZw6FiPZE7T9GJJ1iwhyKeNPatE13ATP+zxOL6jC0Z47Mek4hUaSMBfj0
	 Sr9VSovkB9EqP0b4QTEu79EmUIRRXFIL4zUBQtF7sdO6CJpC+dbHlPNguGKiNklH+f
	 Qt7OZDuHG/Ue7LCl0vtXMJbNC1ZeRrfWdZqeJ1avXH9Tkz4zaszXJGuIgQ7kZVpJn1
	 oNqYARvb2DpRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD1160897;
	Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0ACF139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B59A881117
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3T1mcV0SbdnK for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84A480E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E84A480E48
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECDEF8D667; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 80251a06cf88d47385afd74e5e25f68f93bccca7
X-Git-Newrev: 37ca7f68b1401d0117781786e89625663eb23f2c
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.ECDEF8D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apr-util:
 security bump to version 1.6.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37ca7f68b1401d0117781786e89625663eb23f2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
CVE-2026-34502.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 209117f1dd8a833c8a588c6fdffcff30abb1eaf3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 7e2793cd77..b8fff95de6 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
-sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
+sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 477db1c593..c11957bc56 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.3
+APR_UTIL_VERSION = 1.6.4
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
