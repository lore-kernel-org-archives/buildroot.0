Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B4CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F32D427B7;
	Wed,  3 Jun 2026 18:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql3lljRIP15i; Wed,  3 Jun 2026 18:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663D742849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512918;
	bh=Bci7EFi0nfMcq83bYoF22Elhi10SJhRVkLtiLR07a1M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PXpQxqdFwOAlpFTCAtEzwWec8vrHE3GccaaDtOpm8jLm9Zqmkh7ooUjevQtGk+v0n
	 nO7RD8/vA4nOf08VhYnyyskAxYL83Y7HZxFD+o2QsMqrsoGNgN0yidD1D2RowggF8+
	 rGQjMce8Obu9BWVmOLrnhKKuHKInwZDXeu85xSD12j38aHbVshKegHWoJTsm0PCU8+
	 ih0t/J1U9/ajV6C8lA1fJtn1qYrMnPzW1Sw4E1D3cg+Bb7y4AuJS0ob8HmGS3zdAfX
	 FXoMUG/QWf8s85ibTsMvV3nUwW5wZMLAsNyaKNk/SioAdC7ts+dWubtDe584h4RrzW
	 yodiYc1NnBdRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 663D742849;
	Wed,  3 Jun 2026 18:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D6E2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AEA242863
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBa_JIyvtAUi for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D385742849
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D385742849
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C711A87994; Wed,  3 Jun 2026 18:55:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:51:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 71009e5890400fecd4eda9ee94552f59c9e1bdfa
X-Git-Newrev: 3da85ac72997ee2638cb8af1e8705a22fc02036c
X-Patchwork-Hint: ignore
Message-Id: <20260603185500.C711A87994@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-utils: bump
 version to 1.2.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3da85ac72997ee2638cb8af1e8705a22fc02036c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 5f6ecc2be6..699c8921d7 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a  alsa-utils-1.2.15.2.tar.bz2
+sha256  092399d5e8749a1d5e188e393157521cec4b75693b60ebb79bbce728cff2232c  alsa-utils-1.2.16.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 5a5f18b64f..946f0d8059 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.15.2
+ALSA_UTILS_VERSION = 1.2.16
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
