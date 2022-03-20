Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F807C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C21560C22;
	Sun, 20 Mar 2022 18:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQohWMd5nQMY; Sun, 20 Mar 2022 18:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EFC60BEC;
	Sun, 20 Mar 2022 18:48:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08C5D1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF7140579
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJJLyaoRfmQP for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93AA6405AA
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA1E48461A; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:31:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5dab7fc53b6df5333ecf7ba170e0507833f24075
X-Git-Newrev: fcbce93cfce0a84d32de323b6962c9846b58c887
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.AA1E48461A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux: make Image{,
 .gz} format available for aarch64 BE
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
Content-Type: multipart/mixed; boundary="===============7212361850455398739=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7212361850455398739==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fcbce93cfce0a84d32de323b6962c9846b58c887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Just like aarch64, aarch64 BE supports the Image and Image.gz format.

Signed-off-by: Rémi Duraffort <remi.duraffort@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d1579589e0a7d1870aa0ad587acd78f799f31257)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 36744c5337..043e7c6574 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -261,11 +261,11 @@ config BR2_LINUX_KERNEL_SIMPLEIMAGE
 
 config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
-	depends on BR2_aarch64 || BR2_riscv
+	depends on BR2_aarch64 || BR2_aarch64_be || BR2_riscv
 
 config BR2_LINUX_KERNEL_IMAGEGZ
 	bool "Image.gz"
-	depends on BR2_aarch64 || BR2_riscv
+	depends on BR2_aarch64 || BR2_aarch64_be || BR2_riscv
 
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"

--===============7212361850455398739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7212361850455398739==--
