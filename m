Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFCEC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2402880D41;
	Wed,  1 May 2024 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iw9rm7mtdzS2; Wed,  1 May 2024 21:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3190A81337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3190A81337;
	Wed,  1 May 2024 21:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5C91BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A764080A
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYkwTw2FX3-P for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 453DB40807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 453DB40807
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:35:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 329AD8652D; Wed,  1 May 2024 21:35:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 23:35:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00522a5022a11a05b21a9e3690c093e3aecb4753
X-Git-Newrev: c6784ea0e17db4aa1505792b29587bef91f1d59d
X-Patchwork-Hint: ignore
Message-Id: <20240501213539.329AD8652D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: remove Sourcery
 CodeBench Nios-II exclusion
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6784ea0e17db4aa1505792b29587bef91f1d59d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII has been removed by [1].

[1] 7fa0159a5055363d002089f0c451a84594732cf2

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5ebec415b5..df6bede158 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -294,18 +294,6 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_BOOST=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_FLANN=y\n' in configlines:
-        return False
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
