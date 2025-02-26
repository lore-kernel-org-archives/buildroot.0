Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBBC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7829684C1D;
	Fri, 28 Feb 2025 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DguUIE96DQEJ; Fri, 28 Feb 2025 17:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C3484D76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C3484D76;
	Fri, 28 Feb 2025 17:25:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0985668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165964263F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_UGvbTgZDqk for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 832E442DF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 832E442DF7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EBA5817EE; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 23:00:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d684bc5e09c301f83151da3ef3d36c2c1b5134d
X-Git-Newrev: 4516f779ff42652a8e70050b0fe13eed03f46cbe
X-Patchwork-Hint: ignore
Message-Id: <20250228163050.7EBA5817EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nxp-mwifiex: enable
 Linux option RTC_CLASS
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
Content-Type: multipart/mixed; boundary="===============4972649321319026871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4972649321319026871==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4516f779ff42652a8e70050b0fe13eed03f46cbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Without Linux option RTC_CLASS enabled, the build fails with:

ERROR: modpost: "rtc_ktime_to_tm" [/home/sszy/development/eb972b781ead357c3e44a880cc1b8e4ab4b15b58/output/build/nxp-mwifiex-lf-6.6.52_2.2.0/./moal.ko] undefined!

Fix that by enbaling RTC_CLASS.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nxp-mwifiex/nxp-mwifiex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 333f8ec4fb..46678a2c91 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -19,6 +19,7 @@ define NXP_MWIFIEX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PCI)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RTC_CLASS)
 endef
 
 $(eval $(kernel-module))

--===============4972649321319026871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4972649321319026871==--
