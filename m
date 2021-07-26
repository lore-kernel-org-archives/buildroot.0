Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B7BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:45:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3230B60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3230B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC9E60892;
	Tue,  3 Aug 2021 22:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAe70M8zLJBN; Tue,  3 Aug 2021 22:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 750D160681;
	Tue,  3 Aug 2021 22:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7FB1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E3E6090C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqLczHzKUTmI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2747860879
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 705FE84369; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc22746a5b429dbc13844e0d0ca3378a4b0d3cc4
X-Git-Newrev: fec042412ccb460a9a77b260863a66bcaecf3f56
X-Patchwork-Hint: ignore
Message-Id: <20210803211019.705FE84369@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/irqbalance: add
 SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=fec042412ccb460a9a77b260863a66bcaecf3f56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for irqbalance is added by the services/irqbalance module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/irqbalance/irqbalance.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index b099f7c6e2..eb7c3e9f3b 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -8,6 +8,7 @@ IRQBALANCE_VERSION = 1.7.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
+IRQBALANCE_SELINUX_MODULES = irqbalance
 IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2
 # Autoreconf needed because package is distributed without a configure script
 IRQBALANCE_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
