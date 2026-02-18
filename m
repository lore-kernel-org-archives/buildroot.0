Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4916E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CBD80C50;
	Thu, 19 Feb 2026 17:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFUTsr-bq-HL; Thu, 19 Feb 2026 17:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9FA80F66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521942;
	bh=OAj646Fqg+jMV3c28s5rs1p/AnXdF9QwyKOfq3xPFws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IaCJ6ci+L4rh8Q9pcKvWAt3tr6DB9LOlCB66oI4Ik80axTHFrk6WD+1i4+VB4dk56
	 btliSdX+dkp5xW8lc2/VY8i3ldOm6144HghBk5JsftQcxq2G4ybdADn6Kkjelhiie1
	 nAZ2F3GFfdOEyO3oFplpw/xOmx01PHTpmtsV/Q927I7SdBfoMYjtbV+TGOJrh9/ax5
	 zoReCUlkl4TX6yRSY88lWoWxmDfH6EXnZdQ/FBMe0P5Yi8uYeJt4/kB+cj4pdIyExU
	 JrL9IF+S0trm2jqEt1Bn/CxaqSwUTYfu33ElD/wPGi78a0ZZ3vfESFymNq9EBWQzKN
	 jNheOZt6xoHrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9FA80F66;
	Thu, 19 Feb 2026 17:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7D0355
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BE4610DC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4UJMkqQdnYP for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DFE60EF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DFE60EF5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72BF3870DC; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:08:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 47d6d5368fcab7b9e12ac18cf3908b00a539e708
X-Git-Newrev: 8c21d2f4a7186bc5a325284a30a21a426b8f7f77
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.72BF3870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c21d2f4a7186bc5a325284a30a21a426b8f7f77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index bde2c8e9fc..e79e259536 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.54
+LIBPNG_VERSION = 1.6.55
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
