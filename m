Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A28CD5BA6
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63C0240372;
	Wed, 20 May 2026 19:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPZBo29SPUfB; Wed, 20 May 2026 19:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238B2418A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305637;
	bh=v+QXbfhlFV6U6nDo1FPS0ckd9SwMbcG0nOdUgdby/NM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KSztKrL+53ANdO5t4uRqlaUS8/on3N+TFEW9rumPISftKIpSSEfiNdLuOLVYlX2Ld
	 4r/UlcvdhuWvx4cEpzpSXdH+jyRWo0OZZMtPMZhlCKItGnsbhR+AJsrZ8Fwx8C4Ztw
	 nQ82TT4c/netj/9ur6+aM3WNsL2Bn0FeROidt/J6lxF8Et/oUTrjiePlYQKgyte2Zt
	 oYzHm8kzXZEWNi4oOfi703f/AzJuXyN0bMvhzeNWzuY1R73lUHvYP+i15UNKQ0maBm
	 Z6MRqRst3CMMOA5wkQXkMZMrJddV+4uWyX8GC1T1uXZD45RIw8pCOhjxgX8JnrbRZv
	 q27wXmejtlQlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238B2418A6;
	Wed, 20 May 2026 19:33:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 245231B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B47E83E88
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9U_8aE-edEwU for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CEC83EBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40CEC83EBC
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED8B86923; Wed, 20 May 2026 19:33:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:32:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d3d25bcc95c4d18f6c123eb4e90b9ac93264504
X-Git-Newrev: 4e14863c9433f01bc02bb33933d86d8938b40cd7
X-Patchwork-Hint: ignore
Message-Id: <20260520193344.DED8B86923@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump version
 to 7.1.2-23
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e14863c9433f01bc02bb33933d86d8938b40cd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-23---2026-05-17

Fixes the following CVEs:
CVE-2026-42326, CVE-2026-45031, CVE-2026-45358, CVE-2026-45359,
CVE-2026-45624, CVE-2026-45664, CVE-2026-46520, CVE-2026-46521,
CVE-2026-46522, CVE-2026-46523, CVE-2026-46557 & CVE-2026-46559.
[copied list of CVEs from
 https://www.news.de/technik/859626214/imagemagick-gefaehrdet-it-sicherheitshinweis-vom-bsi-und-bug-report-bekannte-schwachstellen-und-sicherheitsluecken/1/]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index a308cd1f06..fa46fc7cde 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
+sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d88323ca2d..e08f0a803c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-19
+IMAGEMAGICK_VERSION = 7.1.2-23
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
