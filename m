Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D1F60C30;
	Tue,  4 Jan 2022 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB7yonNPpubA; Tue,  4 Jan 2022 22:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0922960C08;
	Tue,  4 Jan 2022 22:12:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B64611BF2BE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F89C410D3
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxbFmJdSQnGN for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909D1410BB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 88C20832AD; Tue,  4 Jan 2022 22:06:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 23:12:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0be734b7b2272b9adfa9a5e51a40ca48e650eb9
X-Git-Newrev: d9290c6ea591ec1280c9a526c412a6a2ecf33d2a
X-Patchwork-Hint: ignore
Message-Id: <20220104220637.88C20832AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix removed bootlin
 riscv64 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9290c6ea591ec1280c9a526c412a6a2ecf33d2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
bootlin toolchains by RISC-V LP64D. However, Config.in.legacy was added
for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE, which never
existed (the stable version was only added after the switch to LP64D).
Conversely, BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE,
which was removed, was not mentioned in Config.in.legacy.

Correct the symbol name and its comment in Config.in.legacy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5994d94487..e5349e58ac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,8 +153,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
 	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
 	  in favor of RISC-V 64-bit LP64D toolchains.
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE
-	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE
+	bool "Bootlin riscv64 musl bleeding-edge toolchain removed"
 	select BR2_LEGACY
 	help
 	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
