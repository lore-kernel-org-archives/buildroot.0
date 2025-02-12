Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02049C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9CDA847FC;
	Wed, 12 Feb 2025 22:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gG7fgUL8Uq8; Wed, 12 Feb 2025 22:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7B28480D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7B28480D;
	Wed, 12 Feb 2025 22:57:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CAE2C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB23847FC
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyYP_pVHvHa3 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6469D84814
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6469D84814
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:57:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FF34875C1; Wed, 12 Feb 2025 22:57:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 23:54:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ee7374098ca517c7d6e759121cfd4e225e64053
X-Git-Newrev: 6648d7046d760c2fc13ccf4fdbb2376151ac1c59
X-Patchwork-Hint: ignore
Message-Id: <20250212225728.4FF34875C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/stmicroelectronics/common/stm32mp157: restore linux hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6648d7046d760c2fc13ccf4fdbb2376151ac1c59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 9802fa0b5baa ("configs/stm32mp135f-dk: new defconfig") removed
the hash for the stm32mp157a_dk1 and stm32mp157c_dk2 configurations,
breaking the build. The patch restores this value.

Fixes: 9802fa0b5baa ("configs/stm32mp135f-dk: new defconfig")
https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933048 (stm32mp157a_dk1_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/9054933050 (stm32mp157c_dk2_defconfig)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Romain: add gitlab-ci links]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 42d02c9f78..f6a5f5e1c9 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
+sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
 sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
