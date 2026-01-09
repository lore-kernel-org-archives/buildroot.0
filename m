Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888FED2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5428B83D27;
	Tue, 13 Jan 2026 19:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD0wwM4auNSX; Tue, 13 Jan 2026 19:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C3283DA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333058;
	bh=yllc/17EJRKV/hSSjB0e4Qx4JlCsh88eH9CRcqrk82A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ndj6Hh/dDQUic2cMrTfAoG3F0JXfidkmyZXuq3PNVr2s2Sz8LOE+pNFhD9J3ArTkn
	 Wdf5uqpICu+jGm67YvBP2mxB2qD09ugY7t9qAmYCY2Vl+dcf5kiG75DJWTNYPpJcEI
	 EUXakpztukuqYRMf6ZLMhk6cvPyBVtsXFBWNpJxWG3A2XHflOAeKK2Q58tS6+482iA
	 HAp+PAj+Kco6DHXpDNrzQstJtRgeD8rx8C2j2rzKj2bdqQn5AO6qyQ35B3QXR7l6yC
	 C+SUylUonCQu4T4ra+k8koLcfcvLnYV0jIAKYPfrmQ7pgPf4SUFcZvgO4AuiTYp1rm
	 oeMoUKRvDUCVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C3283DA0;
	Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB775231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A06B74052B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ujOU1EFiMuV for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882FE40441
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882FE40441
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8666E86184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:04:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 07cd241056ae36caf5f83a4937b8c720dbc4ae0f
X-Git-Newrev: 81b7bd41a0a51247422f9de9b96ff7c0d9c03642
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.8666E86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/spice: add
 missing gcc >= 6 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=81b7bd41a0a51247422f9de9b96ff7c0d9c03642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

spice uses std::list allocator, which requires gcc >= 6. There are no
known autobuilder failures as we don't test toolchains as old as gcc
5.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20241122213809.176709-1-ju.o@free.fr/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e09811f97184a1e1320cfb49970c12858fc8a0f1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/spice/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 468097cea1..1dc5ae3040 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,8 +1,8 @@
-comment "spice server needs a toolchain w/ wchar, threads, C++"
+comment "spice server needs a toolchain w/ wchar, threads, C++, gcc >= 6"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
@@ -11,6 +11,9 @@ config BR2_PACKAGE_SPICE
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	# Needs gcc >= 6 with c++11 std::list allocator
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
