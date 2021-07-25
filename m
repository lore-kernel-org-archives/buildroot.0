Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD98C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8019E60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8019E60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 530FB82803;
	Sun, 25 Jul 2021 21:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqPWQCiqRT5J; Sun, 25 Jul 2021 21:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E2182974;
	Sun, 25 Jul 2021 21:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EBA41BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E46C82A5D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gn_HgomQCZh2 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8AA98272D
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 05AE688F96; Sun, 25 Jul 2021 20:51:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:25:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fb3216a80c64c08375429d89497eaeec5622150
X-Git-Newrev: 48dbac9b79174038fb2c02c37b84a67d26d54fd5
X-Patchwork-Hint: ignore
Message-Id: <20210725205116.05AE688F96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=48dbac9b79174038fb2c02c37b84a67d26d54fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for cups is added by the services/cups module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 8490fe109a..80aecdba5e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -10,6 +10,7 @@ CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSI
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
 CUPS_LICENSE_FILES = LICENSE NOTICE
 CUPS_CPE_ID_VENDOR = cups
+CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
