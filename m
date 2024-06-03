Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DB7C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C02A4068F;
	Mon,  3 Jun 2024 09:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixwnLryJpBPU; Mon,  3 Jun 2024 09:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B74A9406AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74A9406AC;
	Mon,  3 Jun 2024 09:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAC41BF868
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16C004068C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBMQGNAmZc60 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161D440648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 161D440648
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F2CE8780A; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:03:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f37a3fb49895c36bc9271693d0e1478d89267f23
X-Git-Newrev: 88dc6a6e492be30875dcedc8b19802aa0ac3880b
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.0F2CE8780A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmnl: use https for _SITE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=88dc6a6e492be30875dcedc8b19802aa0ac3880b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmnl/libmnl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 08eebbaed9..3bd3a03c89 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -6,7 +6,7 @@
 
 LIBMNL_VERSION = 1.0.5
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
-LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
+LIBMNL_SITE = https://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
 LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
