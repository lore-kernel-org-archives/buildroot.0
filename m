Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90312C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:39:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438D460E78
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 438D460E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1629040001;
	Sat, 24 Jul 2021 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ErcllLa_GNo; Sat, 24 Jul 2021 20:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D61402A9;
	Sat, 24 Jul 2021 20:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48E451BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38041402A9
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWbUmAI_aSiC for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:39:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 898564028E
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B7B7088C7B; Sat, 24 Jul 2021 20:05:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dfbbbb4105c47602da048c9bb9499fb8862e768
X-Git-Newrev: c339ec003743608b7d997b8582f4eafeaa3343e5
X-Patchwork-Hint: ignore
Message-Id: <20210724200527.B7B7088C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: replace old configure param
 with new equivalent
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

commit: https://git.buildroot.net/buildroot/commit/?id=c339ec003743608b7d997b8582f4eafeaa3343e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QEMU 6.0.0 replaces in [1] --(enable|disable)-git-update with
--with-git-submodules=(update|validate|ignore). "Disable" is now "ignore".

[1] https://lore.kernel.org/qemu-devel/20201016203857.62572-1-ddstreet@canonical.com/

Signed-off-by: Joseph Burt <caseorum@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e0f722cf42..470c285f16 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -198,7 +198,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-vhost-crypto \
 			--disable-libxml2 \
 			--disable-capstone \
-			--disable-git-update \
+			--with-git-submodules=ignore \
 			--disable-opengl \
 			--disable-vhost-user-blk-server \
 			--disable-virtiofsd \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
