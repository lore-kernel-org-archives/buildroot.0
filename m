Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2DC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6622E80D04;
	Mon, 31 Oct 2022 10:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6622E80D04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wi8vwBqFhf_i; Mon, 31 Oct 2022 10:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 982BD80C46;
	Mon, 31 Oct 2022 10:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 982BD80C46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB641BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159F8401CA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159F8401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPBeg66sIcwY for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:43:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6591C40192
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6591C40192
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD9E878A1; Mon, 31 Oct 2022 10:43:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:43:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d76655c86ecc8ce302490422e8d6a286857ef36c
X-Git-Newrev: 23407308e51d2112b030d7b135517949f3d50c1f
X-Patchwork-Hint: ignore
Message-Id: <20221031104347.4FD9E878A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cni-plugins: add missing
 BR2_USE_MMU dependency on Config.in comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23407308e51d2112b030d7b135517949f3d50c1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main option has a BR2_USE_MMU dependency, so the Config.in comment
should have it as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cni-plugins/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
index e01cadc026..25e6ff534d 100644
--- a/package/cni-plugins/Config.in
+++ b/package/cni-plugins/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_CNI_PLUGINS
 comment "cni-plugins needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
