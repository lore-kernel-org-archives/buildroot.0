Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DDBC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3830560F43
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3830560F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDE8660A8D;
	Wed,  4 Aug 2021 21:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srZ0DGiVwuva; Wed,  4 Aug 2021 21:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D31660A73;
	Wed,  4 Aug 2021 21:07:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1CF31BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF355400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLpBOl1LvwXe for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:07:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6EA9400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:07:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A72498B7A9; Wed,  4 Aug 2021 21:07:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:05:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 135945c6c325c3b8e22038a984270e542c1f579e
X-Git-Newrev: a4951aac074801e147c2c46b022a4847c7a8dff8
X-Patchwork-Hint: ignore
Message-Id: <20210804210741.A72498B7A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/system-config-printer: add host
 desktop-file-utils dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a4951aac074801e147c2c46b022a4847c7a8dff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/33f/33f00aa38d55e5d3acb7171428a7ef23532afa94

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/system-config-printer/system-config-printer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
index b20bea7dc4..e275743026 100644
--- a/package/system-config-printer/system-config-printer.mk
+++ b/package/system-config-printer/system-config-printer.mk
@@ -9,7 +9,7 @@ SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VER
 SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
 SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0+
 SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
-SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-intltool host-pkgconf
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-desktop-file-utils host-intltool host-pkgconf
 
 # 0001-Add-option-to-disable-xmlto-manual-generation.patch
 # 0002-configure-accept-non-system-cups-config.patch
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
