Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AFFF8FA86
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 14:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A648660730;
	Tue, 21 Apr 2026 14:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgeP9Q9NTI-S; Tue, 21 Apr 2026 14:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B566072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776782513;
	bh=ewO1eg/508OfP2jBquKUXeUgCcCmZOVWe9PePgh8770=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jjHv9AoHYySzPe5jbLKWOwYZC7gzT6HaGzkDkkcTjWwDMmTk1Aect86Hu+GE3Xgr/
	 rR5cCsldj9pJxbDkqlGiwl/Tkj5e0QB+j/STLh+JIM7Rco+AaeQYkHtFb1Cno09WS+
	 bEUaKzuL/BsLQUG8Mc/7zXC4W1P246UPo4P+n29onu44EzUAWZcxmAGnYADN+ZY9Ph
	 +KeyIZb9kXwy+j4a9VaTqNe3zUeGoZzkM0Nhemosc+/x4WQBH1YsEpPLVKgjgg5WYF
	 2OmgXs66koVDFHA45eMSQz19seF2DJRCmmcemJHE46Sa086zGhurxei4HprKkDv2o5
	 m9ebu3+THIP7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B566072F;
	Tue, 21 Apr 2026 14:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE5A259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC106072F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBCZqeoUW5YC for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 14:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A5B6072E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A5B6072E
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:41:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57F37821E8; Tue, 21 Apr 2026 14:41:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 16:41:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e96e63dc0edfc08ccd2ec1bf67d5235b995e9379
X-Git-Newrev: bb53aa4fbd4d83f905b0d1851ec7f7bdcf15f259
X-Patchwork-Hint: ignore
Message-Id: <20260421144150.57F37821E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 11.1.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb53aa4fbd4d83f905b0d1851ec7f7bdcf15f259
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See release announce:
https://octave.org/news/release/2026/02/20/octave-1.1.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 4c4c457b65..354c362dcb 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-10.3.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-11.1.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  68bc82885a3ae67a806debb14eb229506d2fe398c969dd42e2e38cc1c35f2aff  octave-10.3.0.tar.lz
+sha256  fb48e9bb9e3e7c6a4755cc90789ecfe54a00f5c59089cf6d50bb32d964bc1abf  octave-11.1.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 155dfc8427..737f26a771 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 10.3.0
+OCTAVE_VERSION = 11.1.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
