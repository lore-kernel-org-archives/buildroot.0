Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07196C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C743660E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C743660E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96AF940520;
	Wed,  4 Aug 2021 12:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgaLVE8WeMFU; Wed,  4 Aug 2021 12:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79FCF40431;
	Wed,  4 Aug 2021 12:36:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E523F1BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02F78001F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLUqtsnETCTN for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36CCE814B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0132B810A6; Wed,  4 Aug 2021 12:34:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 14:28:57 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5ea8c852dfb214adc640297b1d19a573d6c413cd
X-Git-Newrev: 659514808c43393b360299070d4992bfeb3dffd3
X-Patchwork-Hint: ignore
Message-Id: <20210804123439.0132B810A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gqrx: fix comment
 dependency in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=659514808c43393b360299070d4992bfeb3dffd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

comment message for gqrx is always displayed. This is due to an invert
dependency: GQRX depends on !BR2_STATIC_LIBS so comment must depends
on BR2_STATIC_LIBS.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9512b08a4812c695f31c6f4925f4d78dca6ba68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqrx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index af4d69381e..60942c36c8 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -3,7 +3,7 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
