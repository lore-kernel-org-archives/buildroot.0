Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F6DCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5E18421C;
	Fri, 15 May 2026 13:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF5dgZ5Odi3O; Fri, 15 May 2026 13:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565838420E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851707;
	bh=JP3IQ9Bo6ovjLuAseJCJ2r/YAusmRVb8JQ1V7S9UAVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O2XlstyX8QvALVfiIyYrwRuJFwgxZ3d1rGbxqxkbBxLlTr561zkPS2WUWFNIfBMvj
	 Lu6tZtzKwShiuB5YecPfmSyQOY4xId2pVHM2ZRTbSmtWzsEh/viMb2ZlaVurH7YAu9
	 Pt2NUH+TIdIoiHk6lNlA4qBw4r6WuewZfBUDVcGjUwUbsHGnoUEXX+aLgRulcEooYd
	 5CVscZrmdVxnhiAjzUP1M76IH90bgpb6wCXGzB0P0nyya0Sjv18c2yABvj/iyPFAZf
	 DSjzITjy4WCEgP6treuylykT+gvlpaY4TyETalVZBl7V0JXBi7tQk0qXfp8s/xqp22
	 6F6m54b2LRvDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565838420E;
	Fri, 15 May 2026 13:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B2CE42B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED9F61568
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItD6wmyf0T4z for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E5161547
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71E5161547
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B52AC86362; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:13:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 49dbc683e752d7b7defe08011eafdfd8ef77b71c
X-Git-Newrev: f55a6134b7b7664322a594f89ba380d33499cbc7
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.B52AC86362@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/network-manager:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f55a6134b7b7664322a594f89ba380d33499cbc7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 62595a0a36..a0f6af9ffd 100644
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
