Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C69C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D2D83F6E;
	Sat, 13 May 2023 10:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D2D83F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd7FVGGuL3Ry; Sat, 13 May 2023 10:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A575C83F25;
	Sat, 13 May 2023 10:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A575C83F25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC771BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E793483F25
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E793483F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNOyXy0HsvlA for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:49:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF8C83F20
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF8C83F20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A9786497; Sat, 13 May 2023 10:49:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 12:49:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 791c163b2f9f07d4c02b18eabd9b195918e1c603
X-Git-Newrev: e1e30504164700e9dc7d0bce9d1b4f546923c9c2
X-Patchwork-Hint: ignore
Message-Id: <20230513104934.07A9786497@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: document that the zynqmp pmufw
 can be in ELF format
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1e30504164700e9dc7d0bce9d1b4f546923c9c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This feature was added in commit d07e6b7071cf ("boot/uboot/uboot.mk: add
pmufw.elf support"), document it in kconfig.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f5c20f5168..085397d03d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -492,6 +492,8 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	  (e.g. http://...), and it will be downloaded and used from
 	  the download directory.
 
+	  The PMU firmware binary can be either in ELF or BIN format.
+
 	  If empty, the generated boot.bin will not contain a PMU
 	  firmware.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
