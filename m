Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14888D1D48A
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87F540C40;
	Thu,  8 Jan 2026 20:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvB7sUM7BX2C; Thu,  8 Jan 2026 20:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92A8640BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767905340;
	bh=hhoDf8Kk29+Oy83Xl0aU28+03vDYRSoE7rxZA7UDL4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CIUxAPrZwXDMJbZrBOEKtV5svp6W6Ts5FIeICLftzNiQZDc+aQholyeZnF6vv24Nb
	 EjMdGVKCv9mspENzkV4ikWGSfGvO0F/hzu5wHmZJJvHDM9Dwc4svyN7g3dQe/eyhSE
	 VSTtp87Uc1izMqWmsUQwPzULuCtciSVgSv0TlySQLXW9ckKdDKcBlg5vsgbNRMv3ZG
	 QL9WQQ2J7Q2cDaxEeaEppLPl1576/6504JItSnFSYt5zrjLHj9wSdnqlRCLJ9/lUYu
	 XDoZUsdFqhl0pQHTB13McUMoTzgn2HndZeTW76oxgEembtx02/8Kdkw1PvciAj7XOU
	 /SSLgFZLrVAfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A8640BC9;
	Thu,  8 Jan 2026 20:49:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8BA27B1
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB49F830A7
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbZKIJacwG_s for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CAF8174C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17CAF8174C
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:48:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12CE08847E; Thu,  8 Jan 2026 20:48:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 21:36:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f190162e0dbdbbea7fa20cf5fda1d6976270b425
X-Git-Newrev: b521f25764c80ec06d50f0bbc0fdf75b80f645d2
X-Patchwork-Hint: ignore
Message-Id: <20260108204859.12CE08847E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spdlog: bump to version 1.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b521f25764c80ec06d50f0bbc0fdf75b80f645d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update LICENSE hash due to changed line endings, updated date (" - present")
and updated contributors ("spdlog contributors").

Changelog: https://github.com/gabime/spdlog/releases/tag/v1.17.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spdlog/spdlog.hash | 4 ++--
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 947acb0dfc..94c51f919e 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8741753e488a78dd0d0024c980e1fb5b5c85888447e309d9cb9d949bdb52aa3e  spdlog-1.16.0.tar.gz
-sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
+sha256  d8862955c6d74e5846b3f580b1605d2428b11d97a410d86e2fb13e857cd3a744  spdlog-1.17.0.tar.gz
+sha256  d678c20826e1392578508e1c78649a1e3c31bda05ef4388d967dbd654461b140  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 245feac801..b12666613c 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.16.0
+SPDLOG_VERSION = 1.17.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
