Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9AC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287C841710;
	Wed, 10 Jan 2024 15:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287C841710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HW9A6yKdHT4I; Wed, 10 Jan 2024 15:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FCDD421B7;
	Wed, 10 Jan 2024 15:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FCDD421B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C791F1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C8743583
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C8743583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gI_CwmABlsdy for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C6C1400DD
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C6C1400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58B4C856C9; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:38:56 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a2c303136ff005d49370ad2850736075413e8290
X-Git-Newrev: 9a6a2f9155b84587c62e126b269b34e5b3286420
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.58B4C856C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcamera:
 disable python bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a6a2f9155b84587c62e126b269b34e5b3286420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Disable python binding option (introduced with upstream commit [1]
since version v0.0.1).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=8aa02271fd716ed046970a0b1f89176963303f50

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 09e61e40d27daaabd41ad180eca144dd498ec75d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
