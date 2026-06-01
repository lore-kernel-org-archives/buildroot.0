Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25542CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD11B409A9;
	Mon,  1 Jun 2026 19:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82Z1Sx0s-tPV; Mon,  1 Jun 2026 19:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2B3409A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341042;
	bh=wsbBruhFvxvXTj4kZ4ffjTneygYSfsnBPCJoXCrFROY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jaEvL+HY83nxQ15wUQjBOo+XaFpNaVLZsYCUgdhllv2XJ9Ov6kso/WWMB4LrWmKU4
	 iJMJHIsqewkRIr/aelWili6S3F1/V/lhni48HLrn4ds3W/W8S7pGTbFPBii2OeFLQy
	 Dp8zBuJ4zRDNofNRTFjQAs07PJYhdmBYLsEFwv7z87ZANJ0T6HpMRuM9BohurT09pz
	 ELq6ham9Dhg52YP0zZfRidMGM2DI+d+gkaIGyik36yei/1MRWtFMUkHIhL8LWET0My
	 lIzjkiD1vKGoqnAnZCH8jtzfbvC18jLeXpG5M98bql8jy/qa/Hi1+c5J53a8hQJBoO
	 MKBjmqv0ImNXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE2B3409A8;
	Mon,  1 Jun 2026 19:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6246DD3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 531C0409A5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo9WCje48s4l for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C907409A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C907409A4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D2CB8780B; Mon,  1 Jun 2026 19:10:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:09:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9d10eed1f580bdd66a554b405122d624f38142d
X-Git-Newrev: 92cdec5a54a009ece181eaaa6446fadef0303a66
X-Patchwork-Hint: ignore
Message-Id: <20260601191026.7D2CB8780B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: correct download URL after
 5.9.1 release
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92cdec5a54a009ece181eaaa6446fadef0303a66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/

>>> zsh 5.9 Downloading
wget -nd -t 3 --no-check-certificate -O '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
URL transformed to HTTPS due to an HSTS policy
--2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2026-06-01 01:46:36 ERROR 404: Not Found.

zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved under
old/, so update ZSH_SITE to match.

https://zsh.sourceforge.io/News/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 2c464c33a8..06da8a6b89 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZSH_VERSION = 5.9
-ZSH_SITE = http://www.zsh.org/pub
+ZSH_SITE = http://www.zsh.org/pub/old
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
