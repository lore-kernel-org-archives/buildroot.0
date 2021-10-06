Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086EBC433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2954610EA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2954610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98258837B6;
	Wed,  6 Oct 2021 14:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGyeu2yjeO0Q; Wed,  6 Oct 2021 14:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A9F58386F;
	Wed,  6 Oct 2021 14:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64E031BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54721405C9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1I1U-vj_m48 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 077C94059E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:40:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E5CA99233B; Wed,  6 Oct 2021 14:37:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:37:20 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 9ea6fe93886a0535749b8fb57970ff6f5b76530a
X-Git-Newrev: 5cacb345e4a50d71582084723e08b2ee3afbcdcd
X-Patchwork-Hint: ignore
Message-Id: <20211006143746.E5CA99233B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/runc: fix typo of
 toolchain in config.in
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cacb345e4a50d71582084723e08b2ee3afbcdcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b03ea972ae650434b2d72085e1fd5d676cb6c5f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index f181ee334f..66203896a8 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_RUNC
 comment "runc needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
