Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B88E9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A643C805B3;
	Thu, 19 Feb 2026 17:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgA4uDefOdZl; Thu, 19 Feb 2026 17:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B325A8073B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521866;
	bh=SiWs1KH+T/93hbWUNHuuNS3ItcQBeqYHxVY5kKNeRJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iOm2o+lz4gwS2VjKY+p8R4NpK01L9bnGZ7zcFYB1R+XnHOwjK7bvpP7VtIkz3TIfU
	 EkFbBmTh8viA2g/abPpiz01QnBp4nQqb4wWzNQQSGL7BlAvZf5DVQluAk/tZhkK+sY
	 1W08HcxIvRYBTpiVqK9uPMYgMEIHVLcw8hQMO3KXGD71J/YFRZHpKBrwIp/9bmcm4c
	 xUXHGnCWRYHyBvwm95ZrFAMsa51+I/pyAppT9ICGBSvtp3c+7vhNj1Pv5SkHeVj5bG
	 Qa5N6m4ygMvF8HfCV7uTQGZU88NEpVSwxpZ5aUg7Bnt0BP74RXFACOXTH4+p0RQ8ML
	 NyTAYosokkTUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B325A8073B;
	Thu, 19 Feb 2026 17:24:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBC01CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26AC040C6F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkafOs_to6tv for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D7240C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D7240C78
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88B8987043; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:09:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 684e66eb92ad85033c8f9548c12f97a2caf4ddda
X-Git-Newrev: deb793934e5d51196327910b7b18e577d3d9ea5c
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.88B8987043@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libpng: security
 bump to version 1.6.55
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/deb793934e5d51196327910b7b18e577d3d9ea5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following security vulnerability:

CVE-2026-25646 (High): Heap buffer overflow in png_set_quantize when called
with no histogram and a palette larger than twice the requested maximum
number of colors.

For more details, see the advisory:
https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3

Release notes:
https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6f4e61bff84fd601c45a00c72215deec8b513b39)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 4cf8718cc6..7901f82c3a 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
-sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
+sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
 # Locally computed:
-sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
+sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index d052fa7862..01c1cbbec7 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.54
+LIBPNG_VERSION = 1.6.55
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
