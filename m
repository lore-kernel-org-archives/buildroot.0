Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC10C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4A54082B;
	Mon,  9 Jun 2025 14:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6PpspRzBtOM; Mon,  9 Jun 2025 14:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4FA2407E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FA2407E7;
	Mon,  9 Jun 2025 14:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 265A7C8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354AB40565
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo2XtGVDrNea for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB4B404DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB4B404DB
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C92F78793D; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 16:23:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6967ed93b6fcefd5f4cd5ad12ce80dfb63e1200f
X-Git-Newrev: 0720d398f1fc4f53ea20b90c7fd68a9d009d5837
X-Patchwork-Hint: ignore
Message-Id: <20250609142501.C92F78793D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: ipk support
 depends on MMU, wchar
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0720d398f1fc4f53ea20b90c7fd68a9d009d5837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its inclusion in commit [1], the
BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK config selects
BR2_PACKAGE_OPKG without propagating its dependencies on MMU and
wchar.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPKG
      Depends on [n]: BR2_USE_MMU [=y] && BR2_USE_WCHAR [=n]
      Selected by [y]:
      - BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a474642fdcd8c69e12126bbe8304479aa855d916

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender-update-modules/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index beec9d24e7..76158ab6c7 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -108,6 +108,8 @@ comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 	bool "ipk"
+	depends on BR2_USE_MMU # opkg
+	depends on BR2_USE_WCHAR # opkg -> libarchive
 	select BR2_PACKAGE_OPKG
 	help
 	  The IPK Update Module allows opkg-based packages to be
@@ -118,6 +120,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/ipk
 
+comment "ipk support needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
