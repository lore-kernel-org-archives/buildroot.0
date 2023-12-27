Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874C1C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F1E440969;
	Wed, 27 Dec 2023 22:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1E440969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sagAzAePYUOI; Wed, 27 Dec 2023 22:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D92F408FF;
	Wed, 27 Dec 2023 22:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D92F408FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3146F1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD2D404F8
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD2D404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjCU3RbDXMed for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4153740304
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4153740304
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A4BA83745; Wed, 27 Dec 2023 22:22:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 23:22:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f29c5b57f97bc329b9f20bba66460c4d9aa8cc35
X-Git-Newrev: 09e61e40d27daaabd41ad180eca144dd498ec75d
X-Patchwork-Hint: ignore
Message-Id: <20231227222253.2A4BA83745@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: disable python bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=09e61e40d27daaabd41ad180eca144dd498ec75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable python binding option (introduced with upstream commit [1]
since version v0.0.1).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=8aa02271fd716ed046970a0b1f89176963303f50

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/libcamera.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index c1c8bb7b33..8b33b9e708 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -19,6 +19,7 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
 	-Dtest=false \
+	-Dpycamera=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
