Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8651C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B31436BD;
	Fri,  5 Jan 2024 13:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B31436BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71CzmROvD_Su; Fri,  5 Jan 2024 13:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50FFF4370A;
	Fri,  5 Jan 2024 13:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50FFF4370A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 883651BF995
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F4BB436E9
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F4BB436E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIGfy_fssnnt for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAAE435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AAAE435DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45BD8844F1; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 14:00:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e2e85df90104cf897378ef4a3b0a59cb8ff9a56
X-Git-Newrev: 3ab4b55b0a790d4eef105535a0a81410e2c1a842
X-Patchwork-Hint: ignore
Message-Id: <20240105130113.45BD8844F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efivar: add BR2_RISCV_64 in
 _ARCH_SUPPORTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ab4b55b0a790d4eef105535a0a81410e2c1a842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A RISC-V 64bit EFI defconfig was added in commit 82199551
"configs/qemu_riscv64_virt_efi: new defconfig". So efivar can now be
enabled for this architecture.

This commit adds BR2_RISCV_64 in BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efivar/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index d4402dbcf7..0a36335c0a 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 \
-		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el
+		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el \
+		|| BR2_RISCV_64
 
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
