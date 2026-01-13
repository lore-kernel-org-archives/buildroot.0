Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1316AD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4DE940D00;
	Tue, 13 Jan 2026 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9lY-IbSLpzt; Tue, 13 Jan 2026 20:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D6840CE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337953;
	bh=KDN9vPNeGUq4hKdwXzNQLvtLlduBHEBqAaP96wmK/Pc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OjvUZqYXCQZgiC/lkPOET5h1HMLVHwt9tiiDXHCV+WaJPWmeshfDfdh5Iso8Jwsl+
	 7Gwpnxff/aPp7xJqGpMLGYh/21pLXWotrgmyr6tMgaej7vtnOt85HnKp/GR8aXVW52
	 7xdRh9vEHZYJQ4azqOoWIbpcn9IikdLK94vgCcKuqjxqMLHudX2pydsFDldlP2wLuK
	 Ix6UmEPU0qWxwkPAmEPAb2pIoSVypxEGvlnnUN6DbipGcUKeug4ugWEHkGH0lkrH3p
	 afe6Sfzx8IF813jy3wY8h9YhZ3m8Rbj9vUSxAezgo3YrLmlxsKGH2b2KEE78R4tr4s
	 gGYEMGe6GZyXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D6840CE0;
	Tue, 13 Jan 2026 20:59:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12102231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 021C240772
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWe7qncvD3bE for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 436A640781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436A640781
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41A1688570; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6c8ce050586312341dbefd6e7adec1ff6bf60dd
X-Git-Newrev: 66fe5be31aa4f57afbd6d7f215a21f4a7052eef1
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.41A1688570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdpyinfo: bump version
 to 1.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66fe5be31aa4f57afbd6d7f215a21f4a7052eef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003616.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash | 6 +++---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index b0afdc15ac..70f78d612d 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003388.html
-sha256  a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b  xdpyinfo-1.3.4.tar.xz
-sha512  9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12  xdpyinfo-1.3.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003616.html
+sha256  dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638cab3e530ff081a48b6  xdpyinfo-1.4.0.tar.xz
+sha512  478dd3de58950eeca213a51820445e62a5a63b2fa9ff3505f22802a7980f855fc11f1465e57ff4c34cdf8df0a0ff3c576804ef44f11f3b52c1c9da4ecc5a62d3  xdpyinfo-1.4.0.tar.xz
 # Locally computed
 sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index a198fc44c3..7d6ce7a9c6 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.4
+XAPP_XDPYINFO_VERSION = 1.4.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.xz
 XAPP_XDPYINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
