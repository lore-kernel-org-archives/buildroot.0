Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E640D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD48D83BB1;
	Tue, 13 Jan 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zukffo1--i8c; Tue, 13 Jan 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A426C83143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333031;
	bh=01gkAWicCp6TMRkAAHR8ByOi87mQ0LbE4sAsGh6lxsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ji8wThh693hD0mVwAXyPpQRsBWC7Mjm7c4WDINhaE0T1coy/XcHX6KT97EGf2DDSu
	 BbPTWb0qaKBa18zHVJoNeMqrzyM/94w+D8NgA+RfVUudifmiEKPotPCUE+vRlx1TcG
	 I4+/oKHplITF+Kelizcr4hGg9wREUeroFmJmjNLF5f4z3OOzzWwrcgTG3J0MyTdv+n
	 SLevbtw0N22fal+yJelT23L0gy9h+gdbqjgQhRqoNn3s4ZsAD65A6c6qbC0m8JXqTE
	 u2Y4drKNUk3jfTVF6LXcNgC1Wu3Cpov2eBXFG3V+Zqu5sQVXsIhTSHlbQOmYodpmBl
	 YfFAE9CgjfEdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A426C83143;
	Tue, 13 Jan 2026 19:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BEC61C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BC74053F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ggf7bfD2Tl6R for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 210AB403AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 210AB403AE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E30E8854B; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:10:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3076134c1ca4a3e1da29b00731652cfddea9e8ad
X-Git-Newrev: 55ce2b60c3603c0174a5a3fe6eb4eed002aa6065
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.1E30E8854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/utfcpp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=55ce2b60c3603c0174a5a3fe6eb4eed002aa6065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 3a4613841e..3f60953020 100644
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
