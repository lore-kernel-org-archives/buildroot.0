Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5270DC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1486260E5C;
	Fri, 11 Jul 2025 10:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5Cms-rQJxzo; Fri, 11 Jul 2025 10:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C9960EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C9960EC4;
	Fri, 11 Jul 2025 10:10:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28457114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3EA83ADA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqCYwO3D6P54 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BF683ADF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BF683ADF
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84B1A818CF; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:22:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 10a2f91394a064e3bb3bbc866570b5efb2a6d4a8
X-Git-Newrev: b153d87300164c461c61124fa2add471304e46cb
X-Patchwork-Hint: ignore
Message-Id: <20250711100952.84B1A818CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tailscale: add
 CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b153d87300164c461c61124fa2add471304e46cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This gives a proper cpe-id string to the tailscale buildroot package

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fd04cba20daa5377179c1de841f4f9a1facfc448)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tailscale/tailscale.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 7019b9afc9..c63710c131 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -9,6 +9,7 @@ TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
 TAILSCALE_INSTALL_BINS = tailscale tailscaled
 TAILSCALE_LDFLAGS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
