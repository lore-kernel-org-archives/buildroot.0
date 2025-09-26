Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF5CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AD7847AE;
	Fri, 26 Sep 2025 17:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oup85qoB1IIp; Fri, 26 Sep 2025 17:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054A984870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054A984870;
	Fri, 26 Sep 2025 17:07:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF2D3198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D141C406E0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHZ8tOQC6B_u for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C6094012D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C6094012D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:07:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B1F5864AE; Fri, 26 Sep 2025 17:07:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 18:57:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c584135c0e9a2144ca2ecb09b2b21a1aa7178438
X-Git-Newrev: cc3de6f10f69c44ea3cb94b20a62f8605ed97006
X-Patchwork-Hint: ignore
Message-Id: <20250926170723.8B1F5864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2500evb: select CPU
 arm1176jzf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479696482540211647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1479696482540211647==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cc3de6f10f69c44ea3cb94b20a62f8605ed97006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Aspeed AST2500 SoC family embeds a ARM1176JZF 32-bit CPU. See [1].
select this architecture variant for the target.

The CPU selection was missing since the defconfig introduction
in commit [2]. It was selecting the default value BR2_arm926t.

Also, fixes CI this failure:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238341

WARN: defconfig ./configs/aspeed_ast2500evb_defconfig can't be used:
      Missing: BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE=y

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi?h=v6.16.7#n40
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f089aa9877b0f31bd206714449cf41ade196f8e5

Fixes: 6e5e6f98fd73 ("configs/aspeed_ast2500evb: bump kernel to 6.16.7, check hashes, use bootlin toolchain")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[Julien: add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/aspeed_ast2500evb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
index a955334a91..2ea5ed774e 100644
--- a/configs/aspeed_ast2500evb_defconfig
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -1,4 +1,5 @@
 BR2_arm=y
+BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE=y

--===============1479696482540211647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1479696482540211647==--
