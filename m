Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A9CD0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEAC740995;
	Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzpDKk4yIAvU; Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE5940982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808023;
	bh=y4SzzsP86vjW30zKRRtekZ/qtn6N9QO0BzArUtxuVds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cxDohrqSbkkRIrcwSONuxwQc2dI+W0v016MPlRyzF53FspUsXceGWd/Y0un8s32By
	 i18hjv4lrieY+/CVlQgGeKe/P8QthnXCdG5KP29s2OGRW95if74C7qdukW+gyaPezT
	 oK6SoE+D6K1oFrYEjqLxOF6sIu8sDdGZV49hMvgCpYCGx3mypeGTHYtpx5boFNULCt
	 43S+hU6gOZ00V/u6RikRqK8x0Ytx68tQR8OfS6yntrN0hEg1f0g5iBXghV0Oz2GERf
	 hmGibUXWgAV/e61Yoch3wN44LxuNYx+qLdBeLTUceB+eEhAWel5U1UARJE3drKINnu
	 +tC+pLed68xaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE5940982;
	Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2989ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 004DA40877
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAJnZH1xgLoY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408034087C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408034087C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F91788354; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3e2a4318cc6eabeea13857e46b820bde222b7111
X-Git-Newrev: 7cee15ff064d108a9ede1356319088a7c997ce76
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.3F91788354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Giulio
 Benetti to tmux
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cee15ff064d108a9ede1356319088a7c997ce76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dca8423fbcc8389021ddb710cf7f9eec8aa047f3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14d051e45d..5264b16517 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1305,6 +1305,7 @@ F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/swugenerator/
 F:	package/swupdate/
+F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
