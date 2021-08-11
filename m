Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B1BC4320A
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC5460EB5
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEC5460EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A415040205;
	Wed, 11 Aug 2021 20:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGgDb6m57n1N; Wed, 11 Aug 2021 20:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E3414037B;
	Wed, 11 Aug 2021 20:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B29C41BF470
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A197040205
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-XL12zDQ-_R for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 20:15:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12D404036F
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 20:15:10 +0000 (UTC)
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout04.t-online.de (Postfix) with SMTP id 2E62D1D2B;
 Wed, 11 Aug 2021 22:14:46 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (rPYevvZXYhWorVz2ZMwOTPjcpyd-rgwA19nJy7t1PkGEiA4EITl3SGTLtnLXB3RQui@[79.214.201.104])
 by fwd24.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mDuca-0pXZLs0; Wed, 11 Aug 2021 22:14:40 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:35982)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mDuca-0005oF-38; Wed, 11 Aug 2021 22:14:40 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 22:14:40 +0200
Message-Id: <20210811201440.4564-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: rPYevvZXYhWorVz2ZMwOTPjcpyd-rgwA19nJy7t1PkGEiA4EITl3SGTLtnLXB3RQui
X-TOI-EXPURGATEID: 150726::1628712880-0000AED3-3893AA3D/0/0 CLEAN NORMAL
X-TOI-MSGID: 3dbf2a3a-902f-49ba-a932-68c719f9b79e
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: remove optional
 dependency to host-python(2)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

According to
https://elinux.org/Buildroot:Python2Packages#Python_in_the_build_system
tvheadend needs to be updated to follow
"We aim at removing dependencies on host-python(2) where possible"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 2763f6ab6f..de1f44d7eb 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -12,7 +12,7 @@ TVHEADEND_DEPENDENCIES = \
 	host-gettext \
 	host-pkgconf \
 	host-pngquant \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python3 \
 	openssl
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
