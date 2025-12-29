Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A2E92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06967407F2;
	Mon, 29 Dec 2025 14:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWg9Xkvb3mDI; Mon, 29 Dec 2025 14:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBE5407E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767018822;
	bh=umxZPv0IqIOg4MOn9A0c+YV4plfvWhzMYBAg8VLtU3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HIeRsocTggLYi8RAP/3Z8wPTpdpNmqFx0iWZO8Svj9wPsY3OJPhswr+7YMRPUvgSX
	 Yx8IlgDYDIy5agPc9RFUPiHf/eYYBEmJZf+b6LCQn60EOwCW/4pzPGpYhUFT80/qxT
	 LQIvgvSc7nTszI01ORHjJNltq6Y8hLXpny+22KzPLwKdRxVKpCuvuHGcTdCUURsk7q
	 Br45+eqNa2UZmRqU9sJQYbvwibF7NA3n6xRUNph3X5WOnU2pAZ6+I8iiUyn4xl1zLU
	 d2A9eQAxeJZkVcyZSjgMhmFkVSXvFWeO+oG+7s1XFKHWPPM9LysPZnUKNpnPJubsu/
	 qTP/kRy8WwJQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBE5407E2;
	Mon, 29 Dec 2025 14:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B733177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3818174A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV9JRmmv9CVm for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3320816DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3320816DC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:33:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C347A87B52; Mon, 29 Dec 2025 14:33:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:33:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8e7e6c85289f0eee1b2bf13da2c83dbfb07ef65
X-Git-Newrev: 259073938b149383c4c1e66bfe62e0616a0e8855
X-Patchwork-Hint: ignore
Message-Id: <20251229143339.C347A87B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmocka: bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=259073938b149383c4c1e66bfe62e0616a0e8855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.com/cmocka/cmocka/-/blob/cmocka-2.0.1/CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: change release note link to changelog]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmocka/cmocka.hash | 4 ++--
 package/cmocka/cmocka.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index ff561f06b4..5061cf30d0 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://cmocka.org/files/2.0/cmocka-2.0.0.tar.xz.asc
-sha256  b5686c51ea92d142958d68e5dcb932f9bfc32cd3dd01c524f9d4aa863ebc3d9c  cmocka-2.0.0.tar.xz
+# https://cmocka.org/files/2.0/cmocka-2.0.1.tar.xz.asc
+sha256  3f3533382ba29ab3abf5c4f4b27b79d165f0df51ea587de749b11b68b4019180  cmocka-2.0.1.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index b2d489b7f7..4dd78f39cc 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 2.0.0
+CMOCKA_VERSION = 2.0.1
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
