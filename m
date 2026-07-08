Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E001EC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC9840B52;
	Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3Bz1xC66RoO; Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A11540B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691100;
	bh=bfiS7GaX7MFSE4gCMsrYdN4xP4xAiOmsimIHU1WL9yw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WHjvdASAk8adWdmlx9LFpaUL1dnB9tyNYhvIvJCb9u0t6HOJwrQJ/OKyHbybFFJs+
	 jgkw+gmow2Pbl6VRRqw4wrcigovPHs/lwonoPa8nVPgwrjBpmVOk3LPvnC6U/iGgni
	 A1WFDU5yHWr2zLnxG11utQukYuPwGaoPbf7sG7BwJrArUJ5AW3OVl6EtPTInd/ZacO
	 CydH2ZgdubrnQS0mzsikXtc6DLaLA3SmMZWOZVdpFEzhSk5r5vOUezub42O1R7Gx9Y
	 1uc4IAAD4Su74Hefijkt4nRaS6hMwelK3IvhWy/iwSjNPpUt/sMXC5roYZpKQk5RGA
	 FEHqS5XXA3cIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A11540B17;
	Fri, 10 Jul 2026 13:45:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 913AF2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7811A4022E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4ER7-7KsZqF for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE370400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE370400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F300888674; Fri, 10 Jul 2026 13:44:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:51:27 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8e9ce80c948975104da66736895255a8013da098
X-Git-Newrev: 8eb22ee91ff516fc9f6a312752b8f8fb65806929
X-Patchwork-Hint: ignore
Message-Id: <20260710134412.F300888674@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/imagemagick:
 security bump to v7.1.2-26
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8eb22ee91ff516fc9f6a312752b8f8fb65806929
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See the changelog:

- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-24---2026-05-26
- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-25---2026-06-04
- https://github.com/ImageMagick/ImageMagick/compare/7.1.2-25...7.1.2-26

The bump to the v7.1.2-25 fixes the following vulnerabilities:

- CVE-2026-53465
- CVE-2026-53464
- CVE-2026-53463
- CVE-2026-53462
- CVE-2026-53461
- CVE-2026-53460

The bump to the v7.1.2-24 fixes the following vulnerabilities:

- CVE-2026-49219
- CVE-2026-49218
- CVE-2026-48994
- CVE-2026-48734
- CVE-2026-48733
- CVE-2026-48724

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6bb532a100139d3189ed180945e165e3a941efb8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fa46fc7cde..2330507566 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
+sha256  d63594e334e1c410f600fb9370d78d49e4dc6f315722ca4ba083e864e5c354cb  imagemagick-7.1.2-26.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e08f0a803c..1cae5c83fa 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-23
+IMAGEMAGICK_VERSION = 7.1.2-26
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
