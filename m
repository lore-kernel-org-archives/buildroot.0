Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC82CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBAB42B63;
	Sat, 30 May 2026 09:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5M7BdhWS77u4; Sat, 30 May 2026 09:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5E342B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780133908;
	bh=iSWQoBoKqEXJ/MjAKYzURT/T9yU3iUsA+2/m2mR9ahE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cb96eMqkedYaoM5qIr53H93YEIV4JjhNDmQV5War37927WxxoaLDtvUua0fZ4rg4w
	 pLkTa72mPsFhhsSbwJS+JFBPIvW0VueQTuF7Vht+GEuENnWoqBsfdFxwnv8yo6WDS+
	 soldXG92NlWpCst7qJa/WsahqVFaZSycZgKpiW3GmBhfb33xl3ZLpANiuVLkmASPTy
	 NamAGgG2vEEwTedciGYFur12UwjFLg7HXByfXk4ePEqSt64zhD+lY2G9kOU/gbH4c8
	 ustimaTEb8mVX6dLGBQqhSbc/VTThk6oZ1wRD+FZ+ZoPn5N6H/+yG22/w3orL8a4TH
	 CZZAnc+3Bu1Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5E342B50;
	Sat, 30 May 2026 09:38:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27DDDD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087CA84FF5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYDHyZhnnpox for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FED84FF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69FED84FF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CE73835B0; Sat, 30 May 2026 09:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:34:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ceddf2ac04829ce75d03c18c47073c04ab4d92b
X-Git-Newrev: 82f1e6f50e95796e474edbd9ba8698ab7f0d47cf
X-Patchwork-Hint: ignore
Message-Id: <20260530093813.6CE73835B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndctl: propagate json-c
 dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82f1e6f50e95796e474edbd9ba8698ab7f0d47cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_JSON_C
  Depends on [n]: BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
  Selected by [y]:
  - BR2_PACKAGE_NDCTL [=y] && BR2_PACKAGE_HAS_UDEV [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/ndctl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 9f7f5f1c9b..9d3972bd2f 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NDCTL
 	bool "ndctl"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # __struct_group()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_INIPARSER
@@ -20,6 +21,7 @@ config BR2_PACKAGE_NDCTL
 
 comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
