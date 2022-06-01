Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB80DC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951F641829;
	Wed,  1 Jun 2022 16:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rp0T_JnHMbQx; Wed,  1 Jun 2022 16:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6ED41777;
	Wed,  1 Jun 2022 16:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFAD91BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E037F40FD7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9J0pj6G5xX0H for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37AC340C09
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2B019868BC; Wed,  1 Jun 2022 16:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 18:12:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d22646e836bec85dabde33348af3eecda8b1a71e
X-Git-Newrev: 834ac2671fdfc3a596469f2670c2041f9e39b36c
X-Patchwork-Hint: ignore
Message-Id: <20220601160252.2B019868BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain-external:
 codescape-mti-mips: needs shared library support
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

commit: https://git.buildroot.net/buildroot/commit/?id=834ac2671fdfc3a596469f2670c2041f9e39b36c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is a glibc toolchain that does not support static linking.

Fixes:
http://autobuild.buildroot.net/results/8501bbeb1912e3923cba46b576b49f755c7c0072/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d77293599d8413eb9e5dfe566d59bb9367cb66be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-codescape-mti-mips/Config.in   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index c58c55119a..116d4a834d 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
