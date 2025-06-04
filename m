Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA7C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1343960805;
	Wed,  4 Jun 2025 19:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnlDLgmmQRxF; Wed,  4 Jun 2025 19:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA2060711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA2060711;
	Wed,  4 Jun 2025 19:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CED151A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE5540077
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbjxT542Ps1Q for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 19:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 247A040050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 247A040050
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:38:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 127FC81E3B; Wed,  4 Jun 2025 19:38:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 21:36:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac7f65d83e57843951df843be65bbf2e79531ec7
X-Git-Newrev: c874399d3c5cfa7e2f24e0ec2f2b7b3dd0336b80
X-Patchwork-Hint: ignore
Message-Id: <20250604193822.127FC81E3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: make privsep configurable
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

commit: https://git.buildroot.net/buildroot/commit/?id=c874399d3c5cfa7e2f24e0ec2f2b7b3dd0336b80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Privilege separation mode is undesirable in some use cases.
Let's allow the user to disable it, at least.

Signed-off-by: Konstantin Menyaev <konstantin.menyaev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index f55e613071..dda93ba1cb 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DHCPCD
 if BR2_PACKAGE_DHCPCD
 
 config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
-	bool
+	bool "enable privilege separation"
 	default y
 	depends on BR2_USE_MMU
 	# Audit headers were only added in recent kernels for some arches
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
