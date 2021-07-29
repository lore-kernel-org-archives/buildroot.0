Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B2DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949A860C41
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 949A860C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 577C34026E;
	Fri, 30 Jul 2021 21:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cm_hmeg-zTiH; Fri, 30 Jul 2021 21:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61C074026A;
	Fri, 30 Jul 2021 21:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB07E1BF9C2
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E8C60ADF
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NP78a1IQVdbC for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4AE360603
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 63B878A33A; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 23:23:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0d37e275a915539a581c4ac7fd066eddc41fc8c
X-Git-Newrev: da5a3878cf999d7780d5b74e28b216259914a78a
X-Patchwork-Hint: ignore
Message-Id: <20210730213535.63B878A33A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtalloc: add proper Config.in
 comment for dynlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=da5a3878cf999d7780d5b74e28b216259914a78a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtalloc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
index bb671128fb..849becf180 100644
--- a/package/libtalloc/Config.in
+++ b/package/libtalloc/Config.in
@@ -8,3 +8,7 @@ config BR2_PACKAGE_LIBTALLOC
 	  used in Samba.
 
 	  https://talloc.samba.org/talloc/doc/html/index.html
+
+comment "libtalloc needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
