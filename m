Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A9AEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9C241511;
	Fri, 28 Jul 2023 20:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9C241511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DstFYiUSPpdp; Fri, 28 Jul 2023 20:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98EA4416DE;
	Fri, 28 Jul 2023 20:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98EA4416DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58B761BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EC7C41897
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC7C41897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NyVgsbO4Q4Ba for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 352A741511
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352A741511
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21DB083944; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:04:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d9557fd1a41967d355da4e14378fb7c81a58515
X-Git-Newrev: dfbd1aae23ce09130f385d8f1f354d2560cd30e8
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.21DB083944@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 13 version
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfbd1aae23ce09130f385d8f1f354d2560cd30e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows to use an external toolchain based on gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5bfc4d0723..d82c9b8a41 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_13
+	bool "13.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
 	bool "12.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
