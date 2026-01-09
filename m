Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41FD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3DA83D20;
	Tue, 13 Jan 2026 19:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlrokix-VWwI; Tue, 13 Jan 2026 19:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9309D83D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333049;
	bh=hKhLT02FJRu11NiCeN5d2F3IMLm/cytyxB2+PEqgOyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i7FIHZulFAOy565cY7BvzqFvfr9B05zwkYl8iqiNIk95JeYkqaJYjgJi0A6f8LuDq
	 TnRPd7Z5dOo2rSmzEcFORGjg4J44djXlUp9Z5X72EuDo/pX/NLod0CKOeOMTqXnVwv
	 PJJmySPfyiX0GKDoVF1IuIsUl2h+ic1dd5Da+Fmshq9NAKXRwPdOP0QKdGUvI+yN5E
	 R3k/ZzXjbd4UltwXuSLBCngd7/gLonQAt2gdlmOU4LA8JQvvYr9pmOOr/YCO0cNTzJ
	 kFSf90+eyU6CfrLT1GRakfMEO7YPDgTWaUrwffXFRxmMX5ZgULOXGWGFTaiJH2+RlA
	 wc9zAm0It3gEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9309D83D25;
	Tue, 13 Jan 2026 19:37:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C23451C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC06140302
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQNrEPOQdQ3U for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA95E403FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA95E403FE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9F8186184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:17 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3edb679ccd2caded8173aa02aeede00a1282b0f7
X-Git-Newrev: 12a5bd91eb11b7fcf82c9eac73655806696f9323
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.D9F8186184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgtk4: add
 missing dependency for BR2_PACKAGE_LIBGTK4_GSTREAMER
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

commit: https://git.buildroot.net/buildroot/commit/?id=12a5bd91eb11b7fcf82c9eac73655806696f9323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Back when the libgtk4 package was introduced in commit
faf2a1d2abfbff79fc0603def835066587144420, its
BR2_PACKAGE_LIBGTK4_GSTREAMER option did not properly propagate the
dependencies of BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL, causing the
following Config.in warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && (BR2_PACKAGE_HAS_LIBGL [=n] || BR2_PACKAGE_HAS_LIBGLES [=n])
  Selected by [y]:
  - BR2_PACKAGE_LIBGTK4_GSTREAMER [=y] && BR2_PACKAGE_LIBGTK4 [=y]

Fix that by properly propagating the dependency.

Fixes: faf2a1d2abfbff79fc0603def835066587144420 ("package/libgtk4: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d0034ff96531b8993ed591323e37d0c1dec4de48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgtk4/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 99553fc44e..8c01ffd535 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -84,6 +84,7 @@ config BR2_PACKAGE_LIBGTK4_X11
 
 config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	bool "gstreamer support"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
@@ -91,6 +92,9 @@ config BR2_PACKAGE_LIBGTK4_GSTREAMER
 	help
 	  Enable gstreamer support.
 
+comment "gstreamer support needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_LIBGTK4_DEMO
 	bool "Install libgtk4 demo/example programs"
 	select BR2_PACKAGE_SHARED_MIME_INFO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
