Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC06E107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF6C80F73;
	Fri, 13 Mar 2026 21:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3645hLP83dR4; Fri, 13 Mar 2026 21:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEC080F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438114;
	bh=8gODvOG2OwfXK/s/GrLyxa7SIxPaTzLZgD0AudNnTEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g2MgggGXgt6vo/WYUdWyqZ16xx/AzD3KGdZArndMgFRCEfUykfGChfV94SBYmMxID
	 dlRmgiZ9KKaewUzsx2qPygpzaqNrK7Ze2l0Lkhcg21etZ2D1rUuUgTOttbrWrlcoZ0
	 u52kot40uJtNT2MkIGqJ17W9mpYZtCfpXIGKBUbww0SdHoSiye+yPFK4Mvia53KMUW
	 xWtS2m4yqG2u6fKQpTI18J4iVORAgKz7Dj1kZodRiuXjmDrNxdTKvDhONfGNgusciA
	 UUNo72vbjtHcTjH/aWAcFhIxA0luG28vV6G6Y40dPfSvxGHaTTyiXU0T/3F52n+uCH
	 PCOZiicDFrY/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEC080F58;
	Fri, 13 Mar 2026 21:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7294786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CF80405FD
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHzHLp4DTCPV for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D6A74005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D6A74005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:41:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73CEF8704C; Fri, 13 Mar 2026 21:41:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 22:39:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2ca7b402db5767d88008e961c1beeb6d8fc7d8b
X-Git-Newrev: 1e282fbd4748660b496eae9deb02a60f2c21a1fe
X-Patchwork-Hint: ignore
Message-Id: <20260313214150.73CEF8704C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 13.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e282fbd4748660b496eae9deb02a60f2c21a1fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/13.1.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a6247282a8..e9683f19b0 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.0.1
-sha256  3553d943401c34ab9b8c75f35cdb8452ca660233b0e9d4a22395ce5245484bd7  harfbuzz-13.0.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.1.1
+sha256  e7f3b8bac3fdcc529985be8e84fbd65c675ac47ee58512b15a5dd620c79ffe2a  harfbuzz-13.1.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 51bef1a68a..6cedcc0fd8 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.0.1
+HARFBUZZ_VERSION = 13.1.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
