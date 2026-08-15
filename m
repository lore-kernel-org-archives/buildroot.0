Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E0C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A784068C;
	Sat, 15 Aug 2026 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E99P9XIFobAZ; Sat, 15 Aug 2026 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49174058E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786832788;
	bh=5XpERtj//WEWOeuox5JZ3eulKT5mIt+MqvwGXozz5LI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ncIDoRe8aKwvr06uCJSbNuMm6SQF1FO0nfNifzu5RylOgs6N9jMi//KRCJ2ozR9zh
	 AfSsXg9ziiEwd7fCZ3yEJRzbyD2fXJXsgHr8qimM9epePT8SG6EVkvdA+UZ9fSY0zi
	 C4kKZkFqutolS1TS2xz5ruZeJ9UYYjMfvAi0CCAQJgIPue+RwKsqKsDYlshtsHjny1
	 gj+7ccJ+0c7QZgCTnkklldtZZuGMoV+gHUTRX5eI8YnJUUYQiP1rlppVZk+bYXp0ur
	 PnXgEx8ae45+dgKqrY7qhWhAm76jolR+CdM4adKde+GKUZ/C0ZF3/V891e4wrBRQ2+
	 ioMk+3kRjN6/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49174058E;
	Sat, 15 Aug 2026 22:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 184A523F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F226280E85
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYd3P_dZvxYm for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EB380E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43EB380E84
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82B1D8D9D6; Sat, 15 Aug 2026 22:25:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 00:11:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f187644e0029e511572225991029a49f97da81fa
X-Git-Newrev: e389f1b44c54660c7bb5512207a561e684b41595
X-Patchwork-Hint: ignore
Message-Id: <20260815222535.82B1D8D9D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: bump version to 2.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e389f1b44c54660c7bb5512207a561e684b41595
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.7/docs/v2.8.7-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index dada277347..c6ce35a52b 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a  cryptsetup-2.8.6.tar.xz
+sha256  e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da  cryptsetup-2.8.7.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 758d8ef403..28b9927e4a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
