Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2533DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:07:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE1C6105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCE1C6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B4F83896;
	Thu,  5 Aug 2021 10:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYyry5axzY8n; Thu,  5 Aug 2021 10:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1B0837BC;
	Thu,  5 Aug 2021 10:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 999251BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A55883478
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkzaPf7cLfZ1 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:07:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 532498376B
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:07:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0463F8B25B; Thu,  5 Aug 2021 10:06:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:02:24 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5bec5af819da06bdf26ae531a20d8740d10654b5
X-Git-Newrev: ce09a48e3e09a26b540efcfccccfa0dfa2bda8d3
X-Patchwork-Hint: ignore
Message-Id: <20210805100655.0463F8B25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/uclibc: add
 nconfig as a kconfig editor
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce09a48e3e09a26b540efcfccccfa0dfa2bda8d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5e960d5c7c90d98e44d292159082d887910795f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7c96684d0..d22164106c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -30,6 +30,7 @@ ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
+UCLIBC_KCONFIG_EDITORS = menuconfig nconfig
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
