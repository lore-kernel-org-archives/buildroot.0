Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32423EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE34E60FFE;
	Sun, 19 Apr 2026 21:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4_pVrh_0h3Q; Sun, 19 Apr 2026 21:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC7A61001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776633813;
	bh=fiX9i0ej18RwSz0FBGh4aBqZOpkHIEGjTmZj9qBVIm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oCuGZaFbVPbKkZ1Zr4UiKhRzXiV98AgCCnCNiYuvIAnKT4K9sRZTWQO5e9RLisYNa
	 EN7RaiUZ6+BsPW6kt4JvbHX0NlivIZRJznMnEykgNc2GDFtMnTnOyiOhGJwKQ3HhxH
	 k5iaM5gq0o3WImQ9YmpGeyx/Om1yfxaMCN5vGP+DoaJjQ1gA/quhAZkw8GYucDQd2R
	 x0XHUEm3HMaDspj1fnzmSplnK+76ParUmux8Nmu1/A8RwFGUbLZ7R2Hss+FwztrzQ/
	 gUkEDVPhiezNWlZrUl+0FL8S//0fXY+AYzytaTal93qbG48hTtWA4sT5wLRmc4Y/pc
	 2oGCbegGnOEBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC7A61001;
	Sun, 19 Apr 2026 21:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D8D2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C381F407B5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS3mV2hGA0Uy for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB78C407B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB78C407B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:23:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8152781F81; Sun, 19 Apr 2026 21:23:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 23:10:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ead0c6b1827b045bf830bac8db0b2dfe89602cb4
X-Git-Newrev: 0104d731834ae1a50185f7bf456d62b06fda0f70
X-Patchwork-Hint: ignore
Message-Id: <20260419212330.8152781F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: bump version to 1.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0104d731834ae1a50185f7bf456d62b06fda0f70
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.0
  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index c53e0c9f50..4f9d899d27 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1  libavif-1.3.0.tar.gz
+sha256  d4aea31a4becb3273ba7968221be2e48148ba05eb8a68d14e671963e17785648  libavif-1.4.1.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 4357566ed1..8bd130fd65 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.3.0
+LIBAVIF_VERSION = 1.4.1
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
