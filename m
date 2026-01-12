Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FB4CF45C1
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 436B740DF0;
	Mon, 12 Jan 2026 18:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sI5xbLum5NR; Mon, 12 Jan 2026 18:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF1740DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240953;
	bh=ryvfi/+8hDjdP+IvPsqqTl6WOKI/Y8c6V3kqEDIV8Xw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=szzDP9e9s2nkfWZQh66TpgTTWYc4U/U0f/gRwDDzlCDeorLTDVbn7fj1fYk6MwzlV
	 jUl2mA1COFMuEqnEWvVGLovSrqI/9I+DjgImQsKRApwlL5bcNHL+jMavYjIQCJCc+d
	 buzxWucbNAASkUVqo6tFJ+zV0B+zydx3Fa8JiM5RMosLwVdqsWI4aZS7XwGLIBtPX1
	 hDvGrK6OLp9q3G/Db5WMkqOlkixQHsakbm4H79p3BEy/XVd6LPgwkA5of76mTuJbWt
	 yz2hswvvwnhjEWb5LyjxwYfz+imIkJ6biUC6p9Ytpaa0rMjopYXsJMh13qXxs6uzZw
	 64eJtx5q5Xsnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF1740DF1;
	Mon, 12 Jan 2026 18:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B99E71CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB06B83F4A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h6e7bgFV28l for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A3383F02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A3383F02
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72BB688546; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 19:01:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae4b42ba6429fa768d5f4b6633aaa3066f5bcf3e
X-Git-Newrev: aa87aafa4b89b70330883d0e79f087bf3dbd319f
X-Patchwork-Hint: ignore
Message-Id: <20260112180227.72BB688546@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webp: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa87aafa4b89b70330883d0e79f087bf3dbd319f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change logs, see:
https://github.com/webmproject/libwebp/blob/v1.6.0/NEWS
https://github.com/webmproject/libwebp/blob/v1.6.0/ChangeLog

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change logs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 8d80c72711..17b05c8482 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c  libwebp-1.5.0.tar.gz
+sha256  e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564  libwebp-1.6.0.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 83d5506c0f..4af3353f66 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.5.0
+WEBP_VERSION = 1.6.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
