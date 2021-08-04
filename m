Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC4BC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE49F60EBB
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE49F60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B31BD40555;
	Thu,  5 Aug 2021 19:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhHcyoVhCQSf; Thu,  5 Aug 2021 19:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEC3640532;
	Thu,  5 Aug 2021 19:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A44971BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8296783BA1
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVSG5gr_xvjg for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9A783B82
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A7BD8904D; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:05:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 135945c6c325c3b8e22038a984270e542c1f579e
X-Git-Newrev: a4951aac074801e147c2c46b022a4847c7a8dff8
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.9A7BD8904D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/system-config-printer:
 add host desktop-file-utils dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
