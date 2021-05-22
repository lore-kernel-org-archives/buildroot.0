Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FF1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:37:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A99960F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A99960F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0534583CAF;
	Tue,  3 Aug 2021 22:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rq3yZoryCfHs; Tue,  3 Aug 2021 22:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F06083C9F;
	Tue,  3 Aug 2021 22:37:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 619011BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4EF4405A9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAKzArtNjWgh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AE9C404FC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D9447FCEC; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 May 2021 18:58:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8d8f456d59ca5b1e70e37f899743b8d41514cb40
X-Git-Newrev: 0403dd7d76de21b220a00e1378a37d7a0b8d161f
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.9D9447FCEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uhd: USRP1 needs gcc
 >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=0403dd7d76de21b220a00e1378a37d7a0b8d161f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit c577eac16eaae515973faf3013da197516bfd391 forgot to add
dependencies of BR2_PACKAGE_UHD_USB to BR2_PACKAGE_UHD_USRP1

Fixes:
 - http://autobuild.buildroot.org/results/eaae6548fb536e2b0ea539c236cd7579e63fa21e

Note: threads dependency is already guaranteed as uhd itself depends on
NPTL already.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uhd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index fae0887509..f61bbf0e8f 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -129,10 +129,14 @@ comment "USB support needs a toolchain w/ gcc >= 4.9"
 
 config BR2_PACKAGE_UHD_USRP1
 	bool "USRP1 support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable USRP1 support
 
+comment "USRP1 support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_UHD_USRP2
 	bool "USRP2 support"
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
