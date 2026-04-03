Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE9E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB407822B1;
	Fri,  3 Apr 2026 18:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5ama7PDlCX7; Fri,  3 Apr 2026 18:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190FF81CE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239556;
	bh=9mJd4/S0qq6pRd38aG3P0T+sHbq+N99XEN4tOfVNeXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jQ8eLm4881+Jjklg0A8/9Y1MkvfwHHEpDhYxaHPRhOjsDVbVYx8enUqpRcJAD+u9B
	 wW2wyqxgiGmXORIu0Hf3+jo3ox6BW94yPdCHKHluflzR7oeyEU/oo2mmdR5GXs08RA
	 tqxjw177Maqbjm4K5LG1in1bIxDu2S5XFZHJnctZLqYA73XIlIG8gB+qa/Gg7LyLlP
	 yYTfQASN1sR1wL8v3v2vnmgq9yatyxoDHsPRzZL/n0UNCf2z5c8yLk0SQiHSE/kSZ7
	 RU1zbmDfArFDnnGaejk9N5HTO+omIUJ6YHHTa2QURB3OsLtx01Ss5o2DJw3ab4ZPhM
	 hNqQQNi6WoL1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190FF81CE7;
	Fri,  3 Apr 2026 18:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A56541A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975B640B7D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjbKGsWbbuUh for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC2B40B3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBC2B40B3A
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:05:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38AB880212; Fri,  3 Apr 2026 18:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 20:04:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 927227e1899e503e8bbc18f292e33bb56e48289f
X-Git-Newrev: ec6b4dfd32dcd877a24a80bd4ed5597944e6b68e
X-Patchwork-Hint: ignore
Message-Id: <20260403180553.38AB880212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: bump version to 2.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec6b4dfd32dcd877a24a80bd4ed5597944e6b68e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.6/docs/v2.8.6-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c8e76bab9e..dada277347 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  46f7a5b5b228b28ce17f43bcb891b442dc0f1f56df2370646131131e4d702e92  cryptsetup-2.8.5.tar.xz
+sha256  8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a  cryptsetup-2.8.6.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 80abf88a94..716a244915 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
