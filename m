Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ED0C432BE
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88B56103A
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88B56103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 956A580D0C;
	Fri, 13 Aug 2021 13:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKQ7yk-A1g_y; Fri, 13 Aug 2021 13:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C994A80E8F;
	Fri, 13 Aug 2021 13:12:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0FFD1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA8B607B1
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9jcwN4F7_DV for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:12:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A00A606B8
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:12:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D63B787D3B; Fri, 13 Aug 2021 13:11:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:11:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 38a154f142d6dd752c6661ad60f62c62fca60ca3
X-Git-Newrev: 37f75b756182dd17871d1cd9e8bca83f326de690
X-Patchwork-Hint: ignore
Message-Id: <20210813131134.D63B787D3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tvheadend: always use
 host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=37f75b756182dd17871d1cd9e8bca83f326de690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

According to
https://elinux.org/Buildroot:Python2Packages#Python_in_the_build_system
tvheadend needs to be updated to follow
"We aim at removing dependencies on host-python(2) where possible"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b694c44e3b..cd8fedf1f0 100644
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
