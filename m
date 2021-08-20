Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C00C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C81260FF2
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C81260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C99F407E2;
	Thu, 26 Aug 2021 22:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgvOxbO-fvEM; Thu, 26 Aug 2021 22:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35469407B3;
	Thu, 26 Aug 2021 22:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B91A1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9EC2407B8
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpbAxKo5rSkf for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E158407CB
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C24318DC52; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 17:58:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89857df2d1233f60ca7702b387d8e2a17e125d23
X-Git-Newrev: dbe3af5532bfc2ecceca5ea2a4604a82021a8748
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.C24318DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: fix syntax
 error in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbe3af5532bfc2ecceca5ea2a4604a82021a8748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The typo was introduced in 6aa318d91e66731d66dca485c4c30391fe0e2423

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 9308d2a6ac..8c3021242a 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -9,7 +9,7 @@ comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic lib
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 &&
+		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
 		  (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
 
 config BR2_PACKAGE_LIBVIRT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
