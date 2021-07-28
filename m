Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05768C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32F860F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C32F860F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 966CC82AB9;
	Tue,  3 Aug 2021 22:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSRK2EyJimdv; Tue,  3 Aug 2021 22:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3C282980;
	Tue,  3 Aug 2021 22:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43CD51BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAF940594
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QQlr0JAvtxX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4605F40593
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9047787E2D; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 22:14:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: daa5459b6aaa059ca16cb98a1cc16b6fb9964cc6
X-Git-Newrev: 14296940be1c5f7c999530e058c5563b0a94ce22
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.9047787E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: add dynamic
 library comment for NFSv4/NFSv4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=14296940be1c5f7c999530e058c5563b0a94ce22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index f2997b9c91..df9c12ca44 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	help
 	  Enable NFSv4/NFSv4.1 support
 
+comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_NFS_UTILS_GSS
 	bool "gss"
 	depends on BR2_PACKAGE_NFS_UTILS_NFSV4
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
