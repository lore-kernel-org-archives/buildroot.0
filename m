Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD43F588E1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 14:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAACD410C7;
	Mon, 20 Apr 2026 14:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVIZJHuGPGh7; Mon, 20 Apr 2026 14:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E5F41108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776696255;
	bh=BS9k+RVJeqXuUImox4mSC332FWO3XsXBazXaa/iX5WA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oPGIZzzoZf2ETBqi4TZ0HWw441ezRgNH0BsMf+KNkwEqurRPJkiOfF+6dSmzNj78j
	 YKgVDMTYWAcJzvjILlh8S9ientdFUZn4oVcu7HeDQ34lqchx6+W4l6zcsaLz5mpHjn
	 FtJTFR+b/cogocWIM7qjcl3eT2e3rpCPAhorJu3Nj7MK+XW72aK3DQSe1BLTOuG3vR
	 MwNGA6uWWHr095fQNTZ+UNLKy2UopK/+buLYISmKFJa/2zhx6CWy1mG/dzhLfut1YP
	 wBOMtJOtEDNz2Dbv6KaSjkop3hIJ8LPB3DH4FZuCH/b+/cbVcYsAuJXbuGmRDXpFij
	 jxxFEMDmuabLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E5F41108;
	Mon, 20 Apr 2026 14:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6141259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85EE410FA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xt2AzJPZXTjC for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 14:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C66A84107D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C66A84107D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E73A81F7A; Mon, 20 Apr 2026 14:44:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 16:32:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6e0ad3858687d5a0194a3abb4171770fd49be35
X-Git-Newrev: aaeebf981e5a7382d05b16f8d2f5496fa8faa7ee
X-Patchwork-Hint: ignore
Message-Id: <20260420144412.6E73A81F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: bump version to 6.19.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aaeebf981e5a7382d05b16f8d2f5496fa8faa7ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.19.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 24c2e20a7e..03ace91fb6 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199  xfsprogs-6.18.0.tar.xz
+sha256  f3b0d758ed3802b20f838fefc42bbff431e0f0df2fe03cd50d0aa4ad86dcd0fc  xfsprogs-6.19.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 729f4f753f..d84d479500 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.18.0
+XFSPROGS_VERSION = 6.19.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
