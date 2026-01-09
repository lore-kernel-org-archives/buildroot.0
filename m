Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B3D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6300840B39;
	Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9HrAchonJtG; Tue, 13 Jan 2026 19:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AB440B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333258;
	bh=quAi9CFxr8AznAiTw6CEmruL2DhnN58YhVSnfWbXnLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R1+dPygWa7B+WbqMd6QlgoqBKuF6bAaCglHCDbiP2Bc5mTLtGRcnc3Zd2vMCiLGJB
	 B2MyFPRbePifyWSQVHOCP0Ifijm9XxjAkWDuQlDsbUnIJDfSmuFprc9Uuvwy+8cdl0
	 0NTwVrsxK+uTn2qHqIAJRhz7v4ZC7foi/rGK7cee4+DkyNDEqPKIHv/eLZcz4w7FPQ
	 JdSchiRKHGnplp+PCP6nPU7p0K0YzBY+pGmo2H1AMnaFDv7ufONoqJ2EImSR8wYOPT
	 22FuvftqeLuJpVzoqSp6knL57xe8UYHKcJvXbKNSyXEYT67Wv/Ya6+wc8ZReDddsyu
	 eP8SKq1HysZjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AB440B43;
	Tue, 13 Jan 2026 19:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44310231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA48C406E8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnqG6_P_8UTM for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB57406E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFB57406E1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE26986A2D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:10:45 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b91b6ff646b99b8d1d521efbfc2d59bbb26ae3f0
X-Git-Newrev: fb3e4e1d2de95d0b3c1151029885c5850126bfad
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.CE26986A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/utfcpp: fix
 comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb3e4e1d2de95d0b3c1151029885c5850126bfad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454 added this
package as copy from the taglib package but forgot to change all taglib-
related comments.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7b96c97f9714baed16e23059d703facbdf155f4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/utfcpp/Config.in | 2 +-
 package/utfcpp/utfcpp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
index 19e1f21688..3a3fc339bd 100644
--- a/package/utfcpp/Config.in
+++ b/package/utfcpp/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_UTFCPP
 
 	  https://github.com/nemtrif/utfcpp
 
-comment "taglib needs a toolchain w/ C++"
+comment "utfcpp needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index d3d7896813..4e17364e0b 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# taglib
+# utfcpp
 #
 ################################################################################
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
