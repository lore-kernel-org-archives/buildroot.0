Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2FCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D731D84229;
	Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zwPLvosMAH5; Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3AE8421F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851797;
	bh=MM5UncdQvbMqCI0rK50dFHEv3U+qApA7v0JjY8v8/5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GVdRwkF7SkD8r8AiuKvaaGCJ1rHHpC7XtZFEkZFPD81Jcdo5zex4hJGtNspKEdB0Y
	 8MvnX9XTF7ekWxJ5JzhbQOQI5Xsyauzt5R8rjemJOOGtg04V9xxX2Oo4GNOetYk6Jd
	 8zyru03gPVGwTWoVqyeEXgLhK1fdPdx01etCQSdarYc7kF+D6ooKbrBnp579O/NQ7L
	 DjPInC5Pb20Rm9USRalWGWkgs2op/BoiZnH0Xuvql+JJot9YO8RKnpH2Qkv8/Twaz1
	 rHuwT/vSRxrOIVhW4cqSWyiZffr7MGa52qr43AvvogozLzzqrrzD4s1WN9TK0qVcEV
	 t2jfSkorPUEMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3AE8421F;
	Fri, 15 May 2026 13:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F20C642B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D847B40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfm4QflUY5TT for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC2B40E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AC2B40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5283486354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:13:31 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 712e2e8f7cbd5eeadbf817945656ebaa7ce381e2
X-Git-Newrev: b0efb8c15e48abe0ea6b33c98361f7acce8463e0
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.5283486354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/network-manager:
 drop obsolete dependency on host-intltool
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0efb8c15e48abe0ea6b33c98361f7acce8463e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

NetworkManager stopped requiring intltool with 1.40:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/56b51b98fbb8627c4c09a483702e18fd8aee7ce1/NEWS#L434

Fixes: e7c20ad548818fad6924f19e31ef2defdc418875

host-gettext is already an indirect dependency via package/libglib2.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Marcus: add reference to commit that updated NM to 1.40]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit c393060c7e44fab3339d88286d0e407b0bc9b187)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/network-manager/network-manager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 76f4b09fbe..763caa6754 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -16,7 +16,6 @@ NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
 NETWORK_MANAGER_DEPENDENCIES = \
-	host-intltool \
 	host-libxslt \
 	host-pkgconf \
 	dbus \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
