Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95837C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA59880E02;
	Sat, 15 Aug 2026 15:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6teh--JATlBQ; Sat, 15 Aug 2026 15:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6CB780D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786809395;
	bh=N+IO7VRqJypLncSjBQH2RZRmsv4S5X2jcHWv0m/mDUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UbqHoAsCJHiVAWV9k3HQNNv+dmhrnhGpFm8QCasOFWkMZa2WoUB64N+AJdUlpTLsT
	 FeNG1msbtkvi2woh6+t8DGQnwIVnSLnyULBUHJudsDIbuo3YO3xvfw+Mk06wo2Ik4i
	 k7fRADVOLe54xIJXDDcTdUCYxOQUqOIENTf88g2oAiWCIW4keqCeQ2xcd6urdk1ah4
	 fYbQ4uxB8BgIdfs/lMezgm9LtW/GRQOSy/UgZzujgKG0HkMyvaN0TycNXdD8geqax/
	 tJaGy1FLkcOyUZR7YkTuY6gvB2t17EA5kiN9gwqSggH04QoodiVV90WV6ai7wSsiUe
	 7Dr/6+OfKmDmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6CB780D43;
	Sat, 15 Aug 2026 15:56:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59C712BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F67440597
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4wuCQg4xPJW for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA4E40593
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BA4E40593
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7C158D5F9; Sat, 15 Aug 2026 15:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:53:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6490c97a5e4b42e363e2c238458ec1c7c5fd97ee
X-Git-Newrev: b9779e49743be7044c3a7ef5e4cceab6b92fb412
X-Patchwork-Hint: ignore
Message-Id: <20260815155542.D7C158D5F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.33.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9779e49743be7044c3a7ef5e4cceab6b92fb412
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 5617aca5b3..511be0b93f 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.6/
-sha1  94aea4e3698a020ef081b2fea778c55e79903a19  mpg123-1.33.6.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.7/
+sha1  2922a9bb86f36c5d9082fad9baa3903aaeef7918  mpg123-1.33.7.tar.bz2
 # Locally calculated
-sha256  929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a  mpg123-1.33.6.tar.bz2
+sha256  31d0e35a4ca567ec9b5ebda6c3062bb4435d6d3eacd6ef0d95cadd7854dc03ee  mpg123-1.33.7.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 99fe6b82fb..17445395ae 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.6
+MPG123_VERSION = 1.33.7
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
