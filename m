Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB3BCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A463C42246;
	Fri, 29 May 2026 08:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWIK-_8qBHoP; Fri, 29 May 2026 08:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF4F7421EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044473;
	bh=C49bu9uKslb8FmV5Gd8u1D77d2TLjwgYAnSzjTeOze0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qZLey1TzCi9uu5P70AvplREa4SPxA2AdLPbdNTo9bQCuGNSrEIdqnguJiCdxqPXgf
	 /eMuR5qC9PhguPh9CoVQiqbREzXF77oAnJFXWfcMKNqBIRoynJxXljj9JTHDtmDZ4j
	 rcDunz+wl/r32JEicxWxTXd+dVyGEutDCQzJPDGUeLRkAdNABejIardmzLtEJE7HwR
	 g0qrKR1DDFigdwxWLNoLVlua7z2N5jweY+IV8Wtgoi0nzH9xJ5iGNoiN3IBZmLplZI
	 tnWW/8e4rvwG8ZeSXyjU1QnwlDucSaqlnsF1f3fcNmODyRV5friMFRcPxL4t2qx9dr
	 EsA53UMtMQjtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4F7421EE;
	Fri, 29 May 2026 08:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5BA6288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D8A40369
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv-CyAG5Yx_e for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B3214036F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B3214036F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 875EE873B1; Fri, 29 May 2026 08:47:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:41:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd0fcfbe8f7f20fefa72af2460005c60050acf2a
X-Git-Newrev: 4d80e85d6c4b4dd03646a41f44500640cb1ab18c
X-Patchwork-Hint: ignore
Message-Id: <20260529084734.875EE873B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/systemd: remove lvm2
 !BR2_STATIC_LIBS entry
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d80e85d6c4b4dd03646a41f44500640cb1ab18c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by main BR2_PACKAGE_SYSTEMD)

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/systemd/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 62dc3f5ad0..f507a55ceb 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -242,7 +242,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
-	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
@@ -254,11 +253,10 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library"
+comment "homed support needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
