Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D7FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32EC604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C32EC604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B63F83837;
	Tue,  3 Aug 2021 22:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnAtQGIERCX5; Tue,  3 Aug 2021 22:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D95831CA;
	Tue,  3 Aug 2021 22:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4191BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E124061B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZyFpYvtQgRF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D6C9405A1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D7B8843F5; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 14:12:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ca86f8f35100fefbb1fbcb461f9dcab7d44764df
X-Git-Newrev: 7075cc34558cf650aea96c4e661e374f366dd3eb
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.6D7B8843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender: requires MD4
 and RMD160 support in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=7075cc34558cf650aea96c4e661e374f366dd3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable MD4 and RMD160 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/0b9ad028609f7e3e4eddd4439deaf7b3aa1d1273

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ac8bb1676..cccb46361b 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
