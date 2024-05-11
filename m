Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1441C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C4DD400E5;
	Sat, 11 May 2024 20:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khovyb-U2q0x; Sat, 11 May 2024 20:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A704403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A704403F9;
	Sat, 11 May 2024 20:50:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1744A1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11858403F9
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRhb7uhd_s2w for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DD3400E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DD3400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:50:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DCA686FD8; Sat, 11 May 2024 20:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:50:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27
X-Git-Newrev: dc0f7215c604e845009e03784a221332867bf35a
X-Patchwork-Hint: ignore
Message-Id: <20240511205019.4DCA686FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: switch to 13.x as default
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc0f7215c604e845009e03784a221332867bf35a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bc1f1c3f89..a635b6d5ad 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_GCC_VERSION_12_X
+	default BR2_GCC_VERSION_13_X
 	help
 	  Select the version of gcc you wish to use.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
