Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8237C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A324057A;
	Sat,  5 Feb 2022 15:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EWkalp4Wl1y; Sat,  5 Feb 2022 15:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70AC840018;
	Sat,  5 Feb 2022 15:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47ACB1BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4287B40385
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnJk1WxcVReU for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:32:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57D3940018
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:32:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EECE182967; Sat,  5 Feb 2022 15:25:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:30:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9c94d126f5579a68f85584a6ebe1dd20130b39f
X-Git-Newrev: d0e519ad3d459e8e38c77216b3d30a4ec383a991
X-Patchwork-Hint: ignore
Message-Id: <20220205152506.EECE182967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: add or1k support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0e519ad3d459e8e38c77216b3d30a4ec383a991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

or1k is supported since version 1.18 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=c143fa81462584ad39ea780908266bce3fb9a49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/Config.in | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 44e9d67aaf..03157dd9fe 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -2,14 +2,19 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	bool
 	# see src/syscfg/
 	default y if \
-		BR2_aarch64	|| BR2_aarch64_eb	|| BR2_arm	|| \
-		BR2_armeb	|| BR2_i386		|| BR2_mips	|| \
-		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
-		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
-		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_RISCV_64	|| \
-		BR2_RISCV_32	|| BR2_s390x		|| BR2_sh4	|| \
-		BR2_sh4eb	|| BR2_sh4a		|| BR2_sh4aeb	|| \
-		BR2_sparc	|| BR2_sparc64		|| BR2_x86_64
+		BR2_aarch64	|| BR2_aarch64_eb	|| \
+		BR2_arm		|| BR2_armeb		|| \
+		BR2_i386	|| BR2_mips		|| \
+		BR2_mipsel	|| BR2_mips64		|| \
+		BR2_mips64el	|| BR2_m68k		|| \
+		BR2_nios2	|| BR2_or1k		|| \
+		BR2_powerpc	|| BR2_powerpc64 	|| \
+		BR2_powerpc64le	|| BR2_RISCV_64		|| \
+		BR2_RISCV_32	|| BR2_s390x		|| \
+		BR2_sh4		|| BR2_sh4eb		|| \
+		BR2_sh4a	|| BR2_sh4aeb		|| \
+		BR2_sparc	|| BR2_sparc64		|| \
+		BR2_x86_64
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
@@ -36,6 +41,8 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_m68k
 	default "nios2-unknown-linux-gnu" \
 		if BR2_nios2
+	default "or1k-unknown-linux-gnu" \
+		if BR2_or1k
 	default "powerpc-unknown-linux-gnu" \
 		if BR2_powerpc
 	default "powerpc64-unknown-linux-gnu" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
