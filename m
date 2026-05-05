Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C9EFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BD8606F7;
	Tue,  5 May 2026 21:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHyp2CR0hwgN; Tue,  5 May 2026 21:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6B560866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016830;
	bh=XAnsaxLuXEQQpBJKhdh8Sva7MXapZjAdRTc9zhXxqzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VKCKGzUP8Ro/lGrP0xCjdMEmR/Zrfo96eh6ubnhTmvpZL6K9fWLsCYAtZcgG+8d6y
	 UXTj6QZGA83J+0hYbng7dCAexdw7fXWJHvZdkK9+3aWV1Fhv4/xeix6pSqJnzwMBY3
	 JbjOps1rEdSA19dM4exIEC3/Z5mpNHaeoh59DdaM2vYRYkY043j4RdJsM22cNPa2cH
	 EkGn2/L8QHN9W4QkH1hz2PudhkH44TC/L7dCAjX9bBkCkDWqJFPzgQhWpPQCIqGbDy
	 iJcnbeUcgkQDEI9M7uG0ugsiSflG0BfmIvNL73HGMQf2S9Mc5HAYWijKg7f1I/h6wL
	 Ih+ezNlABPKRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A6B560866;
	Tue,  5 May 2026 21:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1336D280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054E860866
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXO9UTMPb0iB for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26013606F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26013606F7
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:33:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CC99846A6; Tue,  5 May 2026 21:33:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:29:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256eb4b881437f6ee88d9e3d53810921248bdad5
X-Git-Newrev: b30dd9c7a1d16c9eedf055d3e55e10bc654dd528
X-Patchwork-Hint: ignore
Message-Id: <20260505213347.0CC99846A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.53.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b30dd9c7a1d16c9eedf055d3e55e10bc654dd528
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_53_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 49d0012ded..d520096a3b 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a  sqlite-autoconf-3530000.tar.gz
+sha256  83e6b2020a034e9a7ad4a72feea59e1ad52f162e09cbd26735a3ffb98359fc4f  sqlite-autoconf-3530100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 721af0d840..e2f1a426e7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.0
-SQLITE_TAR_VERSION = 3530000
+SQLITE_VERSION = 3.53.1
+SQLITE_TAR_VERSION = 3530100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
