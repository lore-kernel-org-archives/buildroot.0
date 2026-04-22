Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACCCFA1FD8
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93B640295;
	Wed, 22 Apr 2026 16:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7W7g_NvCd09A; Wed, 22 Apr 2026 16:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1905D40E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776877072;
	bh=PSTvXu7DTi4NIXp9L7L4xgca3OQ0Cfu2u3Eofy7LoeQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g8AhrEmTCDuSQP6cF7VN95uqjxn9B535YUO7KFSYPrTQlsEMhto6YkHFPVfnVvf4B
	 69CCpmSzZBMf0EblK/btvq7468aJnAWH7MiTqwiVZsMKjpKsmf3hutnRAKy9qAMPs+
	 SwojnAAQR9+//qPklHBO3nmPD3D+TvOfWGvrrRbJbl7yi3UZPJICFecx++FU7xBsHQ
	 TB6JLcfWMI4I2SFig/n3uKGhlD9CrbI5D7IJQifo6YxSW3EJBLIhdPOyTmytqpPVmx
	 vzloE6eVGtxE9VR1xRgkWPiuYT07fg0L7/Wu7RSYNPauSijaYiiy9Vidu4u6qqbaVH
	 25TojT5Eg1wuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1905D40E76;
	Wed, 22 Apr 2026 16:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC65183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7633C40E76
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxcufXzsAJvg for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC2E640295
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2E640295
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 635C282602; Wed, 22 Apr 2026 16:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 18:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d5c6d18da663d42643e33bee1c56e968f9bcbfe
X-Git-Newrev: 6b26717a1453cd7b85238a04cec3c3c9d2ca717a
X-Patchwork-Hint: ignore
Message-Id: <20260422165749.635C282602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: bump version to 2.54.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b26717a1453cd7b85238a04cec3c3c9d2ca717a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.54.0.adoc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index c22ee800cb..0b927e5989 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  5818bd7d80b061bbbdfec8a433d609dc8818a05991f731ffc4a561e2ca18c653  git-2.53.0.tar.xz
+sha256  f689162364c10de79ef89aa8dbf48731eb057e34edbbd20aca510ce0154681a3  git-2.54.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d3625ddf08..10ef081223 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.53.0
+GIT_VERSION = 2.54.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
