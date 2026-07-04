Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB06BC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C63A407B7;
	Sat,  4 Jul 2026 17:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6DmKFTb9tVN; Sat,  4 Jul 2026 17:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C83407CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783186149;
	bh=UMwsLVFziAiMgsCbLLryJTvfjxHpY2tG9Vrn+d/7GcE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gnFg3Rx+EcDF2EnGyphcl8czu7f/SyWrUOdcLS33FH+u1kiYUUMsmrD3OLP0Deuur
	 2EZjqBXLU5MJFs6weBFFy80il42lGo9mpsHGa5veC/+H7gcJtfeiBJ5qlFrXOYUQnv
	 KXKhlu2yuPCOg/9xsIZsQ8TGdgLJmiY85EaVezpd83QHL/JZYamYUFF38gC4MKWA4H
	 EgVZVy2p7nQrZ8d9c2i5ewQR1B02JfUx/aGffiMc2V2BAZd4/YnpU0C3FINTbqHlQb
	 2xNJTu9nwOyja8HLU6UWWCidoh+FUovD8hKcdtva2C7u8FuwyNgWlPuxe1ON4+Jr9g
	 THjBELiBGLhUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C83407CF;
	Sat,  4 Jul 2026 17:29:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22448363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148626068B
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgJcHNNd4RGB for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7B66067B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7B66067B
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D41088406; Sat,  4 Jul 2026 17:28:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 19:26:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 760160039b997740126e83eb03c2a16399c3f073
X-Git-Newrev: 40aa02467447ebf193efe620604ecd97a59da1b2
X-Patchwork-Hint: ignore
Message-Id: <20260704172838.3D41088406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump to 1.33.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40aa02467447ebf193efe620604ecd97a59da1b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for changes:
https://www.mpg123.de/#2026-06-06

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 8ab8040396..5617aca5b3 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.5/
-sha1  f3538d36c360bc34a83f2fcd69ddb67ee04d332f  mpg123-1.33.5.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.6/
+sha1  94aea4e3698a020ef081b2fea778c55e79903a19  mpg123-1.33.6.tar.bz2
 # Locally calculated
-sha256  0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd  mpg123-1.33.5.tar.bz2
+sha256  929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a  mpg123-1.33.6.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 0b8f0e1a83..99fe6b82fb 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.5
+MPG123_VERSION = 1.33.6
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
