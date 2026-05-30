Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F2CCD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1146B85CCA;
	Tue,  9 Jun 2026 13:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex0H_QfjSq0V; Tue,  9 Jun 2026 13:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BA4585746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010289;
	bh=m43QZH+RGnCIU75NX75w6e3YjENfY4dsdTuUD5biC1U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VpTx9WWVeetwLBepvkfN+46BlRoGVGTlLzD4+Bfd+QNtpHVcrlCBbDLTbOAnVAIqW
	 3uLAtFlXIBIBQhLw3Ani1VRU1yqg1L8dvBWlvstIk/bATJQBimMeZJHxsUBgDUKnuy
	 h2BhSXjkI5xeK3jDcg7VXrbyuTJiZmgbPUtjlKC1IFUFCjXPWncCFUkmWi14pJ8S1L
	 /jETTKsDRsReR250a18CSDXRAThEi6/In+goAQqm2SOhnbc4dxxQZo1WCPmC7MrNGx
	 7LhV9zzBpz4WB9Wgw9sQjWN+SIypyQO25ntbypkMVB+IDriZ8NJPrThk32K3IN2LvJ
	 M5Kmqma0RNd9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA4585746;
	Tue,  9 Jun 2026 13:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A81A8190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6002A42790
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_fJAuzQRDAg for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 113C7412CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 113C7412CE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CD7187E7E; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:40:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87aa6af2411b4623d8c01f2259091f1917ee9ae4
X-Git-Newrev: a2602d10a16e1d32d619fa8dfb696df81265a2c9
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.4CD7187E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.134
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2602d10a16e1d32d619fa8dfb696df81265a2c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

2.4.134: https://lists.x.org/archives/xorg-announce/2026-May/003701.html

2.4.132 & 2.4.133:
https://gitlab.freedesktop.org/mesa/libdrm/-/compare/libdrm-2.4.131...libdrm-2.4.133

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 52bf0c6228..80e10e0985 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
-sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
-sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-May/003701.html
+sha256  ac5e74d157830eb8bee44c6a6bf3ad49774ef0dd2a72bdad74a8f20308b52a95  libdrm-2.4.134.tar.xz
+sha512  ef2abddea59d1e93c83a48de920431b839ab50d6071ef4da3cf126e7d64ba7b235f2e34e1169d49ad9de2937a0a18acd66bb8d324b067239b1136e0ddbe792a1  libdrm-2.4.134.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 240c09b8b1..973e651d77 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.131
+LIBDRM_VERSION = 2.4.134
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
