Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB1C6FA83
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D14404DB;
	Fri, 23 Sep 2022 21:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D14404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXdHWv9Qf8Ef; Fri, 23 Sep 2022 21:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B77B540220;
	Fri, 23 Sep 2022 21:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B77B540220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F39761BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF48140220
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF48140220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3rkjM_RPziX for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:55:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4104013B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4104013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08F3685F56; Fri, 23 Sep 2022 21:55:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:54:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a954d39a588614967c1cb357676805e971c3c443
X-Git-Newrev: 10fc3fa81d08f8af5bddce0b9a44dc07f001becc
X-Patchwork-Hint: ignore
Message-Id: <20220923215507.08F3685F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add support for RISC-V
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

commit: https://git.buildroot.net/buildroot/commit/?id=10fc3fa81d08f8af5bddce0b9a44dc07f001becc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QEMU is supported on both 32-bit and 64-bit RISC-V hosts, so let's
enable support for it in buildroot.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e960a062cb..15d6c7d6b5 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
+	default y if BR2_riscv
 	default y if BR2_x86_64
 
 comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
