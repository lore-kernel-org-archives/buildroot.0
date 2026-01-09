Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C3ED2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF5B4078A;
	Tue, 13 Jan 2026 19:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NgbbutgZyuL; Tue, 13 Jan 2026 19:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179DF40ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333307;
	bh=KvWSkXF+L/mw/jwnjqaYJj0uKrW60YoqqkmScGCLYiU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YEKRa3BUVRwGPvb4LEpUxt5jU342yOX8kjn9pK1eboZ5fwvJoG1CNff7qh71nTvVQ
	 jcmgYQ2S0bVITdK+lRG0pSoew4cmbIBXWwJ8x5+8Ku3pM7qHxLGPwIawae6i9at5So
	 /GXNKsHMMZSj1EtE6dAIi0RxPF3LzkcbtayjeAa0Dok423L7GZjdgJQsbQak/C6/Ge
	 iphVraYTqU9oZ+kohJ8glc/xRRGJ/J4E6WRMA0czfQnP+UhQhJxNBZlF89rYDpd9wd
	 YQGjjWeRSS9oJPubpLouS6w4gRkghGJZ9C3iEDIiP1VAuhDGFz/KPvuk7EvO5HSF/6
	 rqml7ex0cezjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179DF40ABB;
	Tue, 13 Jan 2026 19:41:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 168EC2CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DB8F406F8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1-IowRehBJi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85067406E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85067406E7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81CAF80840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:05:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: dc1dd39001925fe0a1d459aa946182c0a56c76bf
X-Git-Newrev: 68ed68d578bb69bea325fce611f6cfcdbecf98d5
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.81CAF80840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/spice: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=68ed68d578bb69bea325fce611f6cfcdbecf98d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
