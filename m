Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F1BC7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C74AE416D0;
	Tue, 13 Jun 2023 12:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C74AE416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOT-YlcPGOX1; Tue, 13 Jun 2023 12:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DA9416FE;
	Tue, 13 Jun 2023 12:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DA9416FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05C311BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFDCB4155F
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDCB4155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaK5nV8LD309 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:42:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED3F54154A
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3F54154A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7240828CC; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 14:38:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a23eee38f7139559dbf24f6826670b23e3e2e497
X-Git-Newrev: 6b293cf0aba93174bd3a9ec8c714a2be8475b610
X-Patchwork-Hint: ignore
Message-Id: <20230613124201.D7240828CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/uboot: document that
 the zynqmp pmufw can be in ELF format
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b293cf0aba93174bd3a9ec8c714a2be8475b610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This feature was added in commit d07e6b7071cf ("boot/uboot/uboot.mk: add
pmufw.elf support"), document it in kconfig.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e1e30504164700e9dc7d0bce9d1b4f546923c9c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
