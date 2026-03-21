Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B60F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE7D78217B;
	Mon, 23 Mar 2026 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyXR8R3ZTOgG; Mon, 23 Mar 2026 19:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7C6A822A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295282;
	bh=mqz0ykVoZEOZw9prpci4Yay19q4PVzoz+dmzFDNiESc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRgQgrpM8ox/iqWwcm5oOgVAZZDK+aZudHM/VxpS7xoTkyeWoJAcofnhlyO/qF16i
	 Ymdh9ci4i/UUg/v2IJANyBoKTics0jqcW6DFUIOpa9gK1gZx3ZR0n1yjV0zDPtlA+M
	 g0d890+p/D0+9vqw41EbxAvxXkdwlnUv1upQpQpyWm1XWAfmC5NdIN3Wo2l8ewdFB3
	 jOapVA4MDotpqNeURt/S33vR9CqA3YG1h6Knotjjvz+Ji/fyGha7jxyhVtp9OX5wTC
	 7qloKCIGo5GC7C52YI5KADCI48U8PsN+Mvuna01C/uWGVtu+X+2HzrrF6NhHLnCOhz
	 lFhhNPosJlsUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C6A822A6;
	Mon, 23 Mar 2026 19:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A6DF356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E21982245
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJP_UQkavwDi for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109F68224E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 109F68224E
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E69084349; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 12:05:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ff9792ab60ff00ba824fcca00f9985c465068a
X-Git-Newrev: ef12f5bb2c79a533e978cbaaf911b5ba96e97439
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.4E69084349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireguard-tools: bump version to
 1.0.20260223
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef12f5bb2c79a533e978cbaaf911b5ba96e97439
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index d959d964d4..52e50fb752 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2025-May/008789.html
-sha256  b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e  wireguard-tools-1.0.20250521.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html
+sha256  af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf  wireguard-tools-1.0.20260223.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index 958d7a3ef0..444581b397 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20250521
+WIREGUARD_TOOLS_VERSION = 1.0.20260223
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
