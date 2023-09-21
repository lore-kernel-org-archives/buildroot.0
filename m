Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CAFE7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E3383C78;
	Thu, 21 Sep 2023 18:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E3383C78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGFDUSSVPNDV; Thu, 21 Sep 2023 18:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12CC81B70;
	Thu, 21 Sep 2023 18:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12CC81B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1F01BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05C0760D4C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05C0760D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0rKjvFQJHWZ for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:23:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F327C60B97
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F327C60B97
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB9968749E; Thu, 21 Sep 2023 18:23:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 20:20:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23166132ebc6cf406f4eac801c8263dabd602127
X-Git-Newrev: 405ba7f2a64a05e19f6d4c178cbe48a10f4c3ddf
X-Patchwork-Hint: ignore
Message-Id: <20230921182345.DB9968749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: install libnftables to
 staging
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=405ba7f2a64a05e19f6d4c178cbe48a10f4c3ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for network-config-manager:
https://github.com/vmware/network-config-manager/blob/v0.6.4/meson.build#L119

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/nftables/nftables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 20a7cd07ef..9cba243372 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,6 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
+NFTABLES_INSTALL_STAGING = YES
 NFTABLES_SELINUX_MODULES = iptables
 
 # Python bindings are handled by package nftables-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
