Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B05E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F0640857;
	Mon,  2 Feb 2026 18:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46434swUF9aT; Mon,  2 Feb 2026 18:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F7D40858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056811;
	bh=cOc++sJVWwmUIw/nofposdrh36fKxFRXZH0jprLfTOI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k9/Y9rmT1CfbeXyntZBDvivja0RnQwMO3WSTroFQO8S44c8thCM0dXTvcysm8LfMU
	 1GreMSDH6TRtlCPLf9AP+FxippacTZcTA1s2TVmKBvUcHpHjRf6MHBhsQCbGElo2gW
	 DvuKbAmJv2fOmBFoBfvweYRiGPEDQ2J7vsghySQHc5v6Mb6vbh2QuTvk0eCaklYNUM
	 +YCCu4l59VOxbxzq7IO+UGzKGscgDUmXAJ/DCrcOUaOccNmVdX2zFDSym6qSj90fLX
	 AMG8CXaR9CrvGX9ND8yogSYTeRZCy2jUSPBlKWxB6KMp+VVmHNiG8xhNIOEwZ75sAq
	 4zBK+5eHehicQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F7D40858;
	Mon,  2 Feb 2026 18:26:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CFE3F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE80400C5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lan8lwXEK0F1 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C8A240409
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C8A240409
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D7968649D; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 19:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c497b8ae99a8d73ccfdbbe953ddf7728c825a90a
X-Git-Newrev: a22fca0055e09b05c3ec402d1d69b5463253a5d7
X-Patchwork-Hint: ignore
Message-Id: <20260202182643.0D7968649D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dc3dd: needs host-bison
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

commit: https://git.buildroot.net/buildroot/commit/?id=a22fca0055e09b05c3ec402d1d69b5463253a5d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/f11/f11b0b9154e9979f3f2d7ea84a019f7719565e8f/

    ../build-aux/ylwrap: line 176: bison: command not found

The build error occurred already in 2024:
https://autobuild.buildroot.net/results/dea/dea779bbbbc08c7192f89073b93db768c41832f4/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/dc3dd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index c31ab9e1f3..e9cb6ec7ac 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -10,6 +10,7 @@ DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
 DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
 DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
+DC3DD_DEPENDENCIES = host-bison
 # We are patching Makefile.am, so we need to autoreconf. We also need to
 # enable autopoint as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
