Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F37CEA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6096440FCC;
	Sun, 19 Apr 2026 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ0Ye_eUH9Rh; Sun, 19 Apr 2026 19:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B1940CFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776625387;
	bh=+TBRS52/sy4oouvsC8nqlkFvS3JUSwhJTUi8cGToBIk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ja7+oUwTlB3MxvYXi5K4+IgAmEatPmKh3NKRZMM1M8vygSqREDchk14pbWR5D702r
	 2A+pilXHzWF33i8bBBhWlAwzv5I+SEF6dnnnT0yZk5ZIC1xclTRaopzqNhz2lu309H
	 v5DbOz6qhG6zgp6UWCsfZeCh2t+Fz9yPo6s5TxMaJO5Y5W+AZiRkp+4h6iXHzuZMgN
	 1HzRYwABm2UxE2ELQf/sEvU5LnIB0Iqq0mm8inohEkU8ClVrupLsli1okigL8JZkES
	 FTUfD9mrVRjn4fih19stTCTb4uU20LhVVVC7myE6Lw8ZKpIui/LN28066jrtoFh/V9
	 tdxlz/MdSfFXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B1940CFF;
	Sun, 19 Apr 2026 19:03:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 580782B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E35840CFF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8xbPriTS5t0 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E69640CEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E69640CEC
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:03:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 430B581F7B; Sun, 19 Apr 2026 19:03:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 20:58:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93f486ac566d26a3b0014d6ad3b34ec85e6558e4
X-Git-Newrev: 6300c1237f8e9e5fd623fe2fbd04f0c5928a5417
X-Patchwork-Hint: ignore
Message-Id: <20260419190304.430B581F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.99.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6300c1237f8e9e5fd623fe2fbd04f0c5928a5417
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Fix clang version parser
- FreeBSD: Drop deprecated kf_sock_inpcb, add FreeBSD 15 support
- Linux: Fix kernel version in CFLAGS, handle Linux 6.9 pidfs changes
- Add closefrom_shim fallback for better portability
- Fix C23 build compatibility
- Documentation improvements

https://github.com/lsof-org/lsof/releases/tag/4.99.6

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index e8e2aac1cd..8002080e23 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90d02ae35cd14341bfb04ce80e0030767476b0fc414a0acb115d49e79b13d56c  lsof-4.99.4.tar.gz
+sha256  2ce65158694e9c44dfc54916f5b843d887763c03128e0a1c77d62ae106537009  lsof-4.99.6.tar.gz
 sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fb2309ae7b..62a4d15d8c 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.99.4
+LSOF_VERSION = 4.99.6
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
