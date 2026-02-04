Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F66E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A18611D1;
	Wed,  4 Feb 2026 17:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR6KhmFQh_69; Wed,  4 Feb 2026 17:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D6D611CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224882;
	bh=zEG3ZK2lJAMDz1c28qEFyEBWbrCHtyYxD80N1cq93hE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RCXGJ2ibTRuen2k4zFfNwvLmWkcU8Bl+RSoEO4NmYzC/3aUHP0oweRw/CyQa/RsMY
	 kEdZc5AwywqjIEIGtJtchbA6ejcNQNh4NIgn9XGxO72FS19rH0Kh9LxPfmyTGxXLJn
	 mXsrvGtaMJrPzg9RGjsD5qIub3NRUw3ced7lcKGicpgC24xUzq0SDfm9xQzxhZ3ix7
	 aTYAL5yfdPjBT6d2TeFrYm4UBB4AUrVhyyc3NQ8qr7O2vJqM/GZbosWbr3+JFWZI7d
	 HwFHy+mUrxWtN777USYdHB84ElQq/BBK/LnYcpXvQ2SrBTLyIXvQUXqy1lX5H+t4xr
	 EMhC6/fB4/oBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D6D611CC;
	Wed,  4 Feb 2026 17:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C9D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E06083CA3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 535iwhEseimw for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5666083F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5666083F10
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C67486975; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:44:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c48a4b966c45f60c6909c7436116e42ac204df3a
X-Git-Newrev: 26eda22e6a059ad44dba99a867ebb436b1a69c36
X-Patchwork-Hint: ignore
Message-Id: <20260204170638.4C67486975@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/expat: bump to
 version 2.7.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26eda22e6a059ad44dba99a867ebb436b1a69c36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 11ab6b6314a4753f7649e79ddda7132532cda11b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 2346efbde5..9d99c38a45 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  21b778b34ec837c2ac285aef340f9fb5fa063a811b21ea4d2412a9702c88995c  expat-2.7.2.tar.xz
+sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 02dda3b12c..07aba205cf 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.2
+EXPAT_VERSION = 2.7.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
