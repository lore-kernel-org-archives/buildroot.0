Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5C6841A5;
	Wed, 18 May 2022 19:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuwUvf5bKsoG; Wed, 18 May 2022 19:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1401B84309;
	Wed, 18 May 2022 19:21:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41CDF1BF9CB
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FDBF842F9
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPljIGzcE8Jj for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9145684307
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3E92286069; Wed, 18 May 2022 19:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d77293599d8413eb9e5dfe566d59bb9367cb66be
X-Git-Newrev: 7535ccfaeaa3270640f52d4e0de892d412f15081
X-Patchwork-Hint: ignore
Message-Id: <20220518190953.3E92286069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain-external: codescape-img-mips:
 needs shared library support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7535ccfaeaa3270640f52d4e0de892d412f15081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a glibc toolchain that does not support static linking.

Fixes:
http://autobuild.buildroot.net/results/4dcccda4e1600100c942a3f5793bd7a20165fff3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../toolchain-external/toolchain-external-codescape-img-mips/Config.in   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2341d08832..8ea9508f9f 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -4,6 +4,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
