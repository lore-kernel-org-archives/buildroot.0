Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201BAD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB89F8328E;
	Tue, 13 Jan 2026 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8GoRroX9yLL; Tue, 13 Jan 2026 19:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B67E4831B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333000;
	bh=r2cq/JmiAOpGin55YY04Q2pi9yoO3EYMABgslDivauI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MWM9fnJhzKWYBmYUIpGxLWv2DpGQOjv0Pazu7clHbpeSglwkMCwk/HWNMDHrRfP8r
	 7KPMhlSY9gdtnF0klyVghqzFPQdW/BrnZNC8lWAsdnI+s+pKGAlGTGaB1uHilcOquB
	 wKRz97ocKK7+TP7rHl7x4E2H9T4lcfP3gkSuElfpbfgOIWCG8B0o97mr59MKhFSUJy
	 KGQj+bdfhBLjVcG9KnYpCych6ndIiX8KSXjVvt2/qb8nUYdHndDQnJkp4RZEEfU6fY
	 a53rTT5H3LALW7HEPPWLRYlvAvMObFVnMCzpoCK+AMrY4xm82ro4clHxtpyX1aCo4u
	 k1lCzeBCJFNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B67E4831B0;
	Tue, 13 Jan 2026 19:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 180662CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B1582C7D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ak3tsggTyV_q for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1361C82C35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1361C82C35
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B378123D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:09:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f5143824b3fd8d9d17cfda11c905706533fb5b4
X-Git-Newrev: 3076134c1ca4a3e1da29b00731652cfddea9e8ad
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.11B378123D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libupnp: disable
 blocking-tcp
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

commit: https://git.buildroot.net/buildroot/commit/?id=3076134c1ca4a3e1da29b00731652cfddea9e8ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Suggested by Gerbera:
https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d

CMake Warning at CMakeLists.txt:583 (message):
  !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
  Without this option non-responsive control points can cause libupnp to hang.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 48c1e7cc6da96b12c8c8eb59c49cb917b0ae1a43)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index cd148d14d0..b81f68306a 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -17,6 +17,7 @@ LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
 LIBUPNP_CONF_OPTS += \
+	--disable-blocking-tcp-connections \
 	--disable-samples \
 	--enable-reuseaddr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
