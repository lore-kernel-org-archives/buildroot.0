Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14BF34060D;
	Mon,  4 Jul 2022 15:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BF34060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RewCs8rI6QKW; Mon,  4 Jul 2022 15:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 112D4405FB;
	Mon,  4 Jul 2022 15:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 112D4405FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34FA61BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F5FD828DD
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F5FD828DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyfcX8bLRr3O for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:46:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4164C828DA
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4164C828DA
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7363F8043E; Mon,  4 Jul 2022 15:33:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 17:41:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91562c9045eabe50b1bf78d6cde9820a34a21391
X-Git-Newrev: 44eda2602a498087592e70118976cff48da19d14
X-Patchwork-Hint: ignore
Message-Id: <20220704153321.7363F8043E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: fix typo in help message of
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
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

commit: https://git.buildroot.net/buildroot/commit/?id=44eda2602a498087592e70118976cff48da19d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The custom tarball option should be given a URL pointing to an OP-TEE OS
tarball and not a "kernel" one.

Fixes: 9c79b369d69c "boot/optee-os: add support for custom tarball URL"
Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/optee-os/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 62e4adcf55..f199de31eb 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -28,7 +28,7 @@ config BR2_TARGET_OPTEE_OS_LATEST
 config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	bool "Custom tarball"
 	help
-	  This option allows to specify a URL pointing to a kernel
+	  This option allows to specify a URL pointing to an OP-TEE OS
 	  source tarball. This URL can use any protocol recognized by
 	  Buildroot, like http://, ftp://, file:// or scp://.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
