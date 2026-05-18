Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D52CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177FF856F2;
	Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5UHGqPdJQzr; Tue,  9 Jun 2026 13:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2726856FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010130;
	bh=Otm/jPUTI/cPg9MKF4AJAA7q8F+4Q0efR29aH6xodaQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b3vKFXQXHxSqm5a7lDD27W7qdP6sB4PfrS7jsY5jUzaR8wa/mW49oseExS7+c3qPk
	 DVY9nOUgAq2++2gxLVDTHqgKMDGiSj72Eu2nvsl5Ob+EJrkuXh5kAk/ujdKt9aaZqI
	 YE59B9hVsW5AaINHh29QJEsKuvKDZopSJtLbQ2NJu2mHU4rL3LOSsYQZAxFudrMM+3
	 3KtAHTdBjUYUpgDZa6sWFjfFT0q75FNtyXALJG6Kua4f1KDL9jFh1OGMOvHIR/ZjOB
	 0CGynzSHjXZREe7srtoa40mrijvMZWJM44M3yZjC3DUhX68o6iB1OotoWomAHUC0Jx
	 EXuMjky5RfdgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2726856FB;
	Tue,  9 Jun 2026 13:02:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51658196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37BC36F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMqthOfGQMmy for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E854F6F690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E854F6F690
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F0C387E8D; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:48:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a5b27453fb06bd25c5c78012ae1e5bcd7e2c07e
X-Git-Newrev: 6fda245fea3d162b47472240bd1f0af7bd98753a
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.2F0C387E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: Do not unpack libpq-fs.h
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fda245fea3d162b47472240bd1f0af7bd98753a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The file was introduced in the project when postgresql support was added,
and has since never been used by the project internally.

They already depend on postgresql when the option is selected, so
let the postgresql package provide the header. Otherwise, the header
file provided by poco conflicts with the one provided by postgresql.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/poco/poco.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index fe1dd29855..40dcc1c502 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,6 +11,8 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
+POCO_EXCLUDES = **/libpq/libpq-fs.h
+
 POCO_DEPENDENCIES = \
 	pcre2 \
 	utf8proc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
