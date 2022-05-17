Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCADC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B90CF40CEB;
	Tue, 17 May 2022 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMZhseAJYWwF; Tue, 17 May 2022 19:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9516840D24;
	Tue, 17 May 2022 19:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F21C1BF20B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BE0C40CEB
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEY6ZhN-Gg9G for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:59:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD11D400F2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:59:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BC17C85F4A; Tue, 17 May 2022 19:48:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 21:59:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 675cbaf9aa8ac082087def432bff1b8449c0653d
X-Git-Newrev: 770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
X-Patchwork-Hint: ignore
Message-Id: <20220517194839.BC17C85F4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: restrict hs4x_rel31 to arc
 gcc fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the ARC variants are supported by upstream gcc, except for the
HS48 rel31 (hs4x_rel31) which is only supported by the ARC fork.

Fixes:
http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5
http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcc/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f6b9b4fa9d..2b12035c4b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_10_X
@@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_11_X
@@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
 	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
 	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
