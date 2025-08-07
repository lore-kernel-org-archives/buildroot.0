Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E6DCA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE4640363;
	Thu,  7 Aug 2025 17:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc7zWnf2b-_Z; Thu,  7 Aug 2025 17:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787F04039B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787F04039B;
	Thu,  7 Aug 2025 17:00:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 114AC31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F89C80C1D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HVPinpRIczZ for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A289480BFF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A289480BFF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FD9D822E3; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 69428c911f64f6943b7480cefe4ccee8df2cb727
X-Git-Newrev: 32759b978260840cbf968897460913ccb6e0f9ae
X-Patchwork-Hint: ignore
Message-Id: <20250807170020.9FD9D822E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/network-manager:
 set "nft" path if BR2_PACKAGE_NFTABLES=y
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32759b978260840cbf968897460913ccb6e0f9ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Nftables should be preferred over iptables if available, which
NetworkManager will do if both paths are set.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7c8cca9baab5fd97f360a1b5d46397b629a54d6c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/network-manager/network-manager.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1a0adacfa0..62595a0a36 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -130,6 +130,10 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
+ifeq ($(BR2_PACKAGE_NFTABLES),y)
+NETWORK_MANAGER_CONF_OPTS += -Dnft=/usr/sbin/nft
+endif
+
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
 NETWORK_MANAGER_CONF_OPTS += -Dofono=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
