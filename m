Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B581C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D575D60F6F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D575D60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2FC83DC0;
	Wed,  4 Aug 2021 01:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pzQVrtX8Zkj; Wed,  4 Aug 2021 01:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255FC83CC1;
	Wed,  4 Aug 2021 01:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4031D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B804C414A0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amk4L3EYPKWj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EBC414EE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 44D0085E9B; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 15:36:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 62f0232980c8168631b29f27edf612af8109c691
X-Git-Newrev: d974944ce8ef90094e0bd41963852f86733f8c44
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.44D0085E9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: default to
 version 2.36.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=d974944ce8ef90094e0bd41963852f86733f8c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added version 2.37, it's time to use the 2.36.x
series as the default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: also update default in binutils.mk]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6190ee4d97..91ce209583 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_35_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_36_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e469febbb4..8ec76134bc 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.35.2
+BINUTILS_VERSION = 2.36.1
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
