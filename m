Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE0EE4998
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 071C9418D5;
	Fri, 18 Aug 2023 22:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071C9418D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TdTwJHagIIt; Fri, 18 Aug 2023 22:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35B97419B4;
	Fri, 18 Aug 2023 22:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B97419B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF3B61BF301
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9771D4187D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9771D4187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbK-jMv72QF9 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD11405C6
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD11405C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B03B85DCB; Fri, 18 Aug 2023 22:12:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 23:50:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cbd91e89e43d600172c62fd1cbd33aa74d0a851a
X-Git-Newrev: 5e012a07041a4d9000da0a007dd4132f9a85e75a
X-Patchwork-Hint: ignore
Message-Id: <20230818221229.9B03B85DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/microchip_mpfs_icicle_defconfig: update instruction sets
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e012a07041a4d9000da0a007dd4132f9a85e75a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the instruction sets for MPFS icicle kit to mirror the
configuration update, i.e. It is now classed as a RISC-V G core with
support for C, IMAFDC.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/microchip_mpfs_icicle_defconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 3fec246938..a3b3093982 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,9 +1,6 @@
 BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_RVM=y
-BR2_RISCV_ISA_RVF=y
-BR2_RISCV_ISA_RVD=y
-BR2_RISCV_ISA_RVC=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
