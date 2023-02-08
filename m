Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEECC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FD14F3BF;
	Tue, 21 Feb 2023 00:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33FD14F3BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3F6NnTyDfmm; Tue, 21 Feb 2023 00:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D49447BF;
	Tue, 21 Feb 2023 00:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D49447BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A301BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D4C40C1A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D4C40C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mXLddz2qQdo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EA5D417F0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EA5D417F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B77D8648F; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:52:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7d195622f2388edd021c6f71ba78eb3d2f9539f7
X-Git-Newrev: 5ee78c0a8b7854b4e8b260e1791909b8591ae5ed
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.6B77D8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tinycompress: install
 to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ee78c0a8b7854b4e8b260e1791909b8591ae5ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will be needed for upcoming pipewire compress offload support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycompress/tinycompress.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index 062233ec80..c9cfbb574b 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -9,5 +9,6 @@ TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
 TINYCOMPRESS_LICENSE_FILES = COPYING
+TINYCOMPRESS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
