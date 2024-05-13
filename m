Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB24C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B30040526;
	Mon, 13 May 2024 20:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ij4AzjnZyz7q; Mon, 13 May 2024 20:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0553C4054B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0553C4054B;
	Mon, 13 May 2024 20:49:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 695251BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D374012A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFujE9BP6dl4 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE7C400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAE7C400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:49:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97E3087175; Mon, 13 May 2024 20:49:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:47:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 103a55028c75dace312470ba05a197886c6b6100
X-Git-Newrev: e23a44bbcba067935708d9949c23fae9c5814cd0
X-Patchwork-Hint: ignore
Message-Id: <20240513204901.97E3087175@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix typo in help text of
 BR2_PACKAGE_QEMU_TARGET_RISCV32
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

commit: https://git.buildroot.net/buildroot/commit/?id=e23a44bbcba067935708d9949c23fae9c5814cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

33-bit was obviously a typo.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8d53ced300..91e0de884f 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -289,7 +289,7 @@ config BR2_PACKAGE_QEMU_TARGET_RISCV32
 	bool "riscv32"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  RISC-V 33-bit architecture.
+	  RISC-V 32-bit architecture.
 
 config BR2_PACKAGE_QEMU_TARGET_RISCV64
 	bool "riscv64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
