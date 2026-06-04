Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8159CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B400660C27;
	Fri,  5 Jun 2026 12:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNcjuXZD1YOu; Fri,  5 Jun 2026 12:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C780960E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663227;
	bh=1ArCDi0JjjuE1xO4JrFkKySRwHGXH732HnAyif0tMoc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aXU4Jq9e6xm+/KNaN8CYQrDIhg/p+7WLHdxdjx4IzVizz6sMiRzV0muZOBgvp5Yn/
	 U8nvGuDVN5v9L1P0Z67i5CNpzi16UpJGgrIppoaG9TiKOvYw3T3fEuNoGByVbTAH4f
	 LJKT/OQxVbxBiKy9tvmx/Ak/RZPq+XZ0u2mhFBVsZXuGHAAigcHgYDWjkY8caOUkhF
	 CV9pSyEE6enJ9LugmN3xgGEYVIZMEc1wIadTtVYp3h/I8nfCVS/JDRatA/R/V0ksh4
	 IfIOsJSFT1XJptPwwNqKgPYeC5t0ADLa1xeOCRelRzgRtMJxMahvm3xRfWZJXJhcPF
	 fpKr7WDoL9pRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C780960E59;
	Fri,  5 Jun 2026 12:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9FB3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2DAA81FF6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MsTkJuLq6sE for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A070E81FE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A070E81FE3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C998587B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:04 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4d3c8925b0f2199820fc25c6a30d77b31fc6cba0
X-Git-Newrev: cd2659ba042f89d287becec8f837b95b78be684a
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.C998587B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/babeld: disable
 for musl toolchains
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd2659ba042f89d287becec8f837b95b78be684a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Building babeld with a musl toolchain fails with:
  ld: read-only segment has dynamic relocations

This happens because babeld uses text relocations (textrels), which
are not supported by the musl dynamic loader and would cause a
runtime crash (segmentation fault).

Since Buildroot passes '-ztext' to detect these unsafe relocations
at build time, disable babeld entirely for musl configurations.

Fixes:
https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a01c1258fe3e8d1403a5a8281257edf85123430b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/babeld/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index 80d2708230..0624621d0a 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_BABELD
 	bool "babeld"
 	depends on BR2_USE_MMU # fork()
+	# uses textrel
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Babel is a loop-avoiding distance-vector routing protocol for
 	  IPv6 and IPv4 with fast convergence properties.
 
 	  https://www.irif.fr/~jch/software/babel/
+
+comment "babeld needs a uClibc or glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
