Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC84C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39113416BD;
	Wed, 22 Feb 2023 15:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39113416BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKfBLOQ4192G; Wed, 22 Feb 2023 15:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6C4416C9;
	Wed, 22 Feb 2023 15:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6C4416C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BECA01BF97C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A454241888
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A454241888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAP-IfqWWqwI for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D3B409DD
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D3B409DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 807AE86740; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:46:24 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: caca4a1ff13298736718d3eb6bda4e209550dc2a
X-Git-Newrev: b15b33fc57949b49f2b347b99e8b5d7d085f0e32
X-Patchwork-Hint: ignore
Message-Id: <20230222155544.807AE86740@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] toolchain/Config.in:
 extend gcc bug 43744 to every sh architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=b15b33fc57949b49f2b347b99e8b5d7d085f0e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Gcc bug 43744 affects seems to affect all SH family because it already
affects:
1) sh4, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/defconfig
2) sh4a, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a/defconfig
Note also that gcc bugzilla entry reports the bug for SH and not for
sub-architectures:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744

So let's extend the bug to BR2_sh to match the entire SH architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee7cf14b5188aca5f17dd38ab0b6673d5789942b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4947ab3aae..a00a486bed 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -115,7 +115,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_sh4
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
