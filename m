Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FEEC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB8560F44
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FB8560F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17ADF4033B;
	Mon, 26 Jul 2021 20:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDkSii4Jt7lR; Mon, 26 Jul 2021 20:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D50440333;
	Mon, 26 Jul 2021 20:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB8671BF995
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D99401D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKgGLm-qRm2g for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 531A540144
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C557C88EEA; Mon, 26 Jul 2021 19:40:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fec042412ccb460a9a77b260863a66bcaecf3f56
X-Git-Newrev: 9a53e2810378fb255df0b5ec1d632a906b25a97f
X-Patchwork-Hint: ignore
Message-Id: <20210726194026.C557C88EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xl2tp: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a53e2810378fb255df0b5ec1d632a906b25a97f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for xl2tp is added by the services/l2tp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xl2tp/xl2tp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 89ca65a7e4..ca404060a2 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -9,6 +9,7 @@ XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
+XL2TP_SELINUX_MODULES = l2tp
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XL2TP_LDLIBS = LDLIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
