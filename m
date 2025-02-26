Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87737C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 22:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C7294031B;
	Wed, 26 Feb 2025 22:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1FzAzCSF0yf; Wed, 26 Feb 2025 22:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07996403B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07996403B4;
	Wed, 26 Feb 2025 22:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3CF8711
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E8C9835B1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAwcs80dmT4X for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 22:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E2183546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E2183546
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4C1A87C0F; Wed, 26 Feb 2025 22:03:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 23:00:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a40ea829ab45d56434d0b53016a8c51f4c98d04a
X-Git-Newrev: 5d684bc5e09c301f83151da3ef3d36c2c1b5134d
X-Patchwork-Hint: ignore
Message-Id: <20250226220308.C4C1A87C0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nxp-mwifiex: use right kernel
 config symbol to enable PCI
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7464686421070721567=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7464686421070721567==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d684bc5e09c301f83151da3ef3d36c2c1b5134d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 620d0e86ee16 ("package/nxp-mwifiex: fix build failure due to
missing Linux options") added kconfig fixup to enable PCI support but
mistyped the config symbol.

Fix it.

Fixes:
  https://autobuild.buildroot.org/results/eb972b781ead357c3e44a880cc1b8e4ab4b15b58

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nxp-mwifiex/nxp-mwifiex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 8f085668f1..333f8ec4fb 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -18,7 +18,7 @@ define NXP_MWIFIEX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PCIE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PCI)
 endef
 
 $(eval $(kernel-module))

--===============7464686421070721567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7464686421070721567==--
