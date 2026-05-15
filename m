Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637ACD4F3D
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D61583FF7;
	Fri, 15 May 2026 09:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4aBbBOmYHsz; Fri, 15 May 2026 09:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22B4283E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839002;
	bh=h/07+C2XTCA4kNKqjocyd2pBcoFiLnz49OaFh9ndwNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BYa50BzYxUDpZM0c/q9Mum0ya5gwY6fgXFNjVvVL3XIuh19XUK34/vTu6o8q8/Yz2
	 fp48kXSWQxt7fyfFPD6qAFjS6jaVKO/ptgVTIdLjIk3S3wm7/8+XkJNttbSKcBq59J
	 hIbbu28Mnp7BvvUmHwmjYpjEbnmMO8FWfI8CrXJcDH+z84eOvsvVcmA6HtHRKn9S4X
	 YOzgOPS71xWtSw5ktFGf5XgHkXp9ymwJxb4lmHM9DeKa2RSDlXyR4noT1PQeFWA8jD
	 3Bk41oNkTDlvG3olnQmwno3pwAgUgP5TQSYUEfAWyx4eT7sTojEgPl2rAmnRpHYVc2
	 lOUuPGvRL9RYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B4283E0A;
	Fri, 15 May 2026 09:56:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA7636E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5B2D40C7A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z8-wehHIulE for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D49940144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D49940144
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8183D8632E; Fri, 15 May 2026 09:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c5730ebb5e8b9a67433aa9997e5cfd6cae18cfe
X-Git-Newrev: b335d2237cc154f15f45ba5641557c0a59e9a9aa
X-Patchwork-Hint: ignore
Message-Id: <20260515095633.8183D8632E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxmlb: bump version
 to 0.3.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b335d2237cc154f15f45ba5641557c0a59e9a9aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/hughsie/libxmlb/blob/0.3.26/NEWS

Switched to xz tarball and tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlb/libxmlb.hash | 3 ++-
 package/libxmlb/libxmlb.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index 0f91486a03..5a202ebfbf 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,3 +1,4 @@
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.26
+sha256  a18bc447fff0dd0d76a2e6cd4a603b4712047c027f9bbbdc31ebc25f0e2c1ed9  libxmlb-0.3.26.tar.xz
 # Locally computed:
-sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index 1d5d339e4f..34e7233f4b 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.19
-LIBXMLB_SITE = $(call github,hughsie,libxmlb,$(LIBXMLB_VERSION))
+LIBXMLB_VERSION = 0.3.26
+LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
+LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
 LIBXMLB_LICENSE_FILES = LICENSE
 LIBXMLB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
