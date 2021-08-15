Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6920C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 14:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B71261159
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 14:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B71261159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50A03400AF;
	Sun, 15 Aug 2021 14:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlXkiCn_YQWu; Sun, 15 Aug 2021 14:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D1E140175;
	Sun, 15 Aug 2021 14:54:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34E851BF376
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 14:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E124033A
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 14:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcSSrEzRtgve for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 14:54:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F9E40283
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 14:54:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5B2418C9F9; Sun, 15 Aug 2021 14:53:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 16:53:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770ff2bc25404fb219221b843de2a0b35d2522eb
X-Git-Newrev: d02d60071d7cd31261d480adfe83d1fd7816d0e6
X-Patchwork-Hint: ignore
Message-Id: <20210815145342.5B2418C9F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txtorcon: depend comment on
 BR2_PACKAGE_PYTHON3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d02d60071d7cd31261d480adfe83d1fd7816d0e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txtorcon/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index 9677eb4da8..e8a1a233db 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_PYTHON_TXTORCON
 	  https://github.com/meejah/txtorcon
 
 comment "python-txtorcon needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
