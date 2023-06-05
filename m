Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FCDC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9A1781F05;
	Mon,  5 Jun 2023 20:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A1781F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flT2luFdeEC9; Mon,  5 Jun 2023 20:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BADB81EFC;
	Mon,  5 Jun 2023 20:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BADB81EFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 347761BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E6AF40514
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6AF40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnflj9WctIOd for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E55134014B
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55134014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCFD386C93; Mon,  5 Jun 2023 20:19:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:16:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7ad09fbb876ed3b800a7020ac4887c4a5f117f13
X-Git-Newrev: 13e4f1942cb2aca57edf5b2b7514d491690e8eeb
X-Patchwork-Hint: ignore
Message-Id: <20230605201932.CCFD386C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cmake: (ctest)
 add support for riscv architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=13e4f1942cb2aca57edf5b2b7514d491690e8eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Package binaries can be successfully built for and then executed on
RISC-V platforms including RV32 and RV64 variants. Tested in QEMU.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7d0ed4a78f4aa3741f94c4bbb69efbe74c920a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 3c47fdcb49..4ef5612b57 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
 		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
-		BR2_s390x
+		BR2_s390x     || BR2_riscv
 
 config BR2_PACKAGE_CMAKE
 	bool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
