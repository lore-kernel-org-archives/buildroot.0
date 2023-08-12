Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A25BEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D768040C6F;
	Mon, 21 Aug 2023 20:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D768040C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vF3wBR4wnHEw; Mon, 21 Aug 2023 20:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C69640B72;
	Mon, 21 Aug 2023 20:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C69640B72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAF971BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C9826112E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C9826112E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwi4Va3AYDSp for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C531361112
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C531361112
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0B5E86026; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 22:21:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f7ebab67abc24b48035868dbaf2c362f47118a9a
X-Git-Newrev: 76af307f01dad46913caa87edb09fe3b65cbb607
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.C0B5E86026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external/toolchain-external-codescape-img-mips: disable
 gdbserver
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

commit: https://git.buildroot.net/buildroot/commit/?id=76af307f01dad46913caa87edb09fe3b65cbb607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure:

>>> toolchain-external-codescape-img-mips 2018.09-02 Copying gdbserver
Could not find gdbserver in external toolchain

Fixes:
 - http://autobuild.buildroot.org/results/b0786965e0b249c8168df855682e54cfe95fa0cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-codescape-img-mips/Config.in   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2341d08832..d49c610237 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
