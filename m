Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED4FC43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D732640B15;
	Sun, 12 Jun 2022 15:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwK9bcPVCZLJ; Sun, 12 Jun 2022 15:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 128AC4062A;
	Sun, 12 Jun 2022 15:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D3D1BF3D0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D18974172A
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUxjqM_pRTCB for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:11:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B664023B
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 02CE186E00; Sun, 12 Jun 2022 14:59:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 17:11:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3f441aea23dbf84fec85a9cef1aaf276c4484f0
X-Git-Newrev: 217b054197773792f6e1ee0747b826f0573764f3
X-Patchwork-Hint: ignore
Message-Id: <20220612145956.02CE186E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: update
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=217b054197773792f6e1ee0747b826f0573764f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

m68k is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/f3697b4fedc2d8f2311eaaebed051f6a44182bb2

s390x is supported since at least version 20180600 and
https://github.com/abseil/abseil-cpp/commit/a7e522daf1ec9cda69b356472f662142dd0c1215

sh is supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a2d7f453c635e90b356017dd47049b89407c2d88

sparc and sparc64 are supported since version 20210324.0 and
https://github.com/abseil/abseil-cpp/commit/3fcd00d7dddafe65ced638acca560105a414cba5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 222e3a092a..45f339ff26 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -5,9 +5,13 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
