Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797F4C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ACA860F90
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ACA860F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F80607D2;
	Mon, 26 Jul 2021 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bY45LTB5mB24; Mon, 26 Jul 2021 21:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F42D607C7;
	Mon, 26 Jul 2021 21:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F40791BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0FBD4045F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cvReg4sGadU for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:44:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3022E4045B
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 597F98901B; Mon, 26 Jul 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:44:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b436b82411305839abc76bb438fe92661a067526
X-Git-Newrev: 732c993c9031d95ddb16637d48782ff3c80074c3
X-Patchwork-Hint: ignore
Message-Id: <20210726211009.597F98901B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=732c993c9031d95ddb16637d48782ff3c80074c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtirpc/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 1899edefbf..31f1636ef5 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
+	depends on !BR2_STATIC_LIBS # libkrb5
 	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
@@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS
 
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libtirpc gss support needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBTIRPC
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
