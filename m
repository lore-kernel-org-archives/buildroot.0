Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BE9C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44B360E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A44B360E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74414605F0;
	Sat, 28 Aug 2021 15:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDHIYiWlDVen; Sat, 28 Aug 2021 15:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35D1606C2;
	Sat, 28 Aug 2021 15:54:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFF41BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487C3426A6
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQmxd6saCz3K for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B481040712
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:54:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 040DB85F3E; Sat, 28 Aug 2021 15:53:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:50:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17a7abbafee9bf4a971e00da7870ae439910e47e
X-Git-Newrev: 21ccfccd93ea42971e7e2df779d69d883beadca3
X-Patchwork-Hint: ignore
Message-Id: <20210828155323.040DB85F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d-demos: use
 BR2_PACKAGE_MESA3D_GBM
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

commit: https://git.buildroot.net/buildroot/commit/?id=21ccfccd93ea42971e7e2df779d69d883beadca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use BR2_PACKAGE_MESA3D_GBM introduced by commit
b6c051acf787c804e732bc58ba8d7e440701a168

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-demos/mesa3d-demos.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 4289acfffb..6b5262a2e9 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -43,7 +43,7 @@ else
 MESA3D_DEMOS_CONF_OPTS += --disable-vg
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MESA3D_DEMOS_DEPENDENCIES += mesa3d
 MESA3D_DEMOS_CONF_OPTS += --enable-gbm
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
