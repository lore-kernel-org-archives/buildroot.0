Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C1FF46C4E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F59980EF5;
	Mon,  6 Apr 2026 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQOCb_X2BcXF; Mon,  6 Apr 2026 15:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6AD80EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775491035;
	bh=KnOzhN5/OVp+gNS7uqDCFDAMMr30/scnUHkiU4XikLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gcf0Z7DIHzViaTre8PQN0yG+BVWriHJFIudnCFhAzCvnDMPXvoDaOYrSVv6TYO2mu
	 DjXBFClp2G5H870QkDgSLBN1mgGVd9wo5kHsUD5LJYsQq7pe5F9n1XVhUuKTi4mmpl
	 SSiln89GWvm1XU1qSI7zPlX0RBCFtYKsR/arnfT6Z8eoGsulJABlfbZTPW/3VWrycF
	 hYGan0/F48BqS9lTsDzdSGWq3Mqaiux8h/T2X4hynl4P3DqYxEJqLup+s94JNMINYK
	 s6QDXtGFOB9KESJW2sYlzwIXXVRqYHxMJ3vMs/t8dEK6FS1AG14MahC7VN/sHSGaom
	 S5TvUtvJiaeKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6AD80EE0;
	Mon,  6 Apr 2026 15:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 305481EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EBD260A3F
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4iktYvzQXnd for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 406A660906
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 406A660906
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA33380462; Mon,  6 Apr 2026 15:57:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 17:42:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0c5e2bcc9c61752dd6446415e06d5bb7cf54d4d
X-Git-Newrev: d28579e957a900acfdb09933d011df5083917e7d
X-Patchwork-Hint: ignore
Message-Id: <20260406155712.AA33380462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/serd: bump version to 0.32.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d28579e957a900acfdb09933d011df5083917e7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/drobilla/serd/-/blob/v0.32.8/NEWS

Updated license hash due to upstream commit:
https://gitlab.com/drobilla/serd/-/commit/e864af0d8d6002ad07adc4695894c01e0fe24c2c
https://gitlab.com/drobilla/serd/-/commit/43cefdcd3e7aac63d9009d927ed21a7536dc85a0
https://gitlab.com/drobilla/serd/-/commit/943edeac0cb8e85f42e5d475477546924edbb4a7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/serd/serd.hash | 6 +++---
 package/serd/serd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/serd/serd.hash b/package/serd/serd.hash
index c8a45a0831..6608c02dcc 100644
--- a/package/serd/serd.hash
+++ b/package/serd/serd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# http://download.drobilla.net/serd-0.30.14.tar.xz.sig
-sha256  a14137d47b11d6ad431e78da341ca9737998d9eaccf6a49263d4c8d79fd856e3  serd-0.30.14.tar.xz
-sha256  13b62d3705cabee6a21730eb24f773249271c2d95e9ecbab16069e729d4ae147  COPYING
+# https://download.drobilla.net/serd-0.32.8.tar.xz.sig
+sha256  f47259bc38ba553b0deb8b6dab6b5b73d3630469a7c9439ccdca80e06d7c1ece  serd-0.32.8.tar.xz
+sha256  f04f124b8814edb03cd64fa82d38cc1c1aa32195fabd33c196b02968e466ba32  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
index 7922e777c8..97060e5f18 100644
--- a/package/serd/serd.mk
+++ b/package/serd/serd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SERD_VERSION = 0.30.14
+SERD_VERSION = 0.32.8
 SERD_SITE = https://download.drobilla.net
 SERD_SOURCE = serd-$(SERD_VERSION).tar.xz
 SERD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
