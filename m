Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52E6C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990CD4106D;
	Fri, 31 Jul 2026 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlfIzRQZrO-l; Fri, 31 Jul 2026 12:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B124105D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500449;
	bh=zQOq84joDA90RkzRiU8TVdSaahJbPfLcHmwMhsK0AcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TJUiHuxtWQGnUrgeR78pgai3jHO0VydZP6C81k7aHt3Wc48eyvQjAP4aeb+rAhUPu
	 YS1cuUHGI+VI5T64U/xSDVu2ekGq0/6VMxv/f6+obx3i1WdRm8fIeE8/DGLy1jS1cz
	 nVITjAV6qYNz2LhWf2Y9LHpsMo0KZQduGjWqRcdhYT6NW/WGOpQz2S6XAOhjdcGBFo
	 Uvr780nl8mFB3mxb5ogjeWZckbYImV7CwS7QljGSXWYdaw975QJd9CnQZhf8J507eH
	 FTbnXECH5SNvmb2VsWlzPIqRyuGCcJhMwenuip0tt9oNpwnUq+aS6lriYcU8rb2Cdl
	 71X1U19bOZXCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B124105D;
	Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14EB1381
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0544D41065
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n24X1vokQlw6 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FAB4105F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0FAB4105F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC2E48B746; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:13:02 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 738e71b98b2e5dcb332b0230e9c5dcf99f622a4e
X-Git-Newrev: e46a64a5face0d1ae73c8ac8100defa09b092de8
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.BC2E48B746@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ugetty: use
 correct SPDX license identifier
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e46a64a5face0d1ae73c8ac8100defa09b092de8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the LICENSE file, and LICENSE.0BSD matches the 0BSD license text
[1].

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2a17921b60cd4a7e237287c791812a93164de11e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ugetty/ugetty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index d3424bee42..6214498094 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -6,7 +6,7 @@
 
 UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
 UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
-UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
+UGETTY_LICENSE = 0BSD or MIT or CC0-1.0
 UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
 
 define UGETTY_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
