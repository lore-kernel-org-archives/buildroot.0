Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B47CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB3085A38;
	Tue,  9 Jun 2026 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH18QG1HF9Qp; Tue,  9 Jun 2026 13:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA3DA8596B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010210;
	bh=bAJ2Z02/f8FsLl/ZjzNH3+HLv774nTyPQoZzOsuZ/Jw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SJoG9cB+SY6alUituwsynrg04kZ5hfqkHcL/bCEcUMF9ZNZJUC7s1pqcBDhvPmiaN
	 R5VhztsnZ92SjYRSQYpjSR+9cJcnxutl6uIx0bwzvqFB4Mmzje4e/d8HOdzubrIJUD
	 9LYnhObtkwByhExI3n36lgNaa8q2/lBZUfPZH/010Po5/MajPfFAy1No4Akt5qT5Ir
	 O+NKVBGfZpVnPXglvcagpzSelK5LIy3EEbeGIQxAvg3LxbY0/ifBe50/trAmHpW9dQ
	 wT8CsIZhc1uhWOMK3o6tBiJhpcdNwh0IlD17b4dkcYhYhiF2QRPkC6NDZYgmouW4O0
	 DgByLUX2ZRl0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3DA8596B;
	Tue,  9 Jun 2026 13:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4AB190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E49645BF2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fdfcrLExAsP for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5426743B5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5426743B5B
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F82887E7E; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 20:25:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a85bcf789d2ccc844c77a1c6238c53e8518ea380
X-Git-Newrev: f5ff9e3cca644ee9a8401cd3c950f80d8ea7b083
X-Patchwork-Hint: ignore
Message-Id: <20260609130118.8F82887E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: bump version to 1.0.54
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5ff9e3cca644ee9a8401cd3c950f80d8ea7b083
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jedisct1/pure-ftpd/blob/1.0.54/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pure-ftpd/pure-ftpd.hash | 2 +-
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b31afb2956..dfda62f0c1 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  c2bef41f9635c3a87efd65f089c16ca5df9fd02db199d9fdcf12b206b93d41a6  pure-ftpd-1.0.54.tar.bz2
 sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index bf2599ecaf..daf8e6eda8 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.53
+PURE_FTPD_VERSION = 1.0.54
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
