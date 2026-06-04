Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99490CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639BE8206B;
	Fri,  5 Jun 2026 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnWUL7cHN97u; Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB6A82075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663152;
	bh=dqQR9jdSUHI+4YeH89CrIZnwfpjzHFBWlHiapbNHQ+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bFdsIJYVbaWl5/nNt1K797IVImct+9X4y/Ki2l7kb1SpTFtozXIPCoZCzAqgum9Lu
	 q/xWyDQMHLk221zWFbQUMO9V27rksCCRl7YABHzwfZbN3ikZhIN0xZtKgWsAnROAxy
	 LjLbI+oG9dfC4jnaXhWOUdP3FJNEscXzy88vbJdOq1KYSvyn4Pnbk21TfIFNEE3k23
	 xvQcwnyq7sPsc3rKCacie9dsZ4cU3GGVTrdsxfIW2svvc/YokfyE6wx+rztMTkLxm7
	 vbQrKqJmkPI1Tqnw/WgRrSAgahdKYVrTnclvBxzE5hhQcUy4PIFoylAQSjnwYsrDEk
	 ut+rg3taT4+SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB6A82075;
	Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9529F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAB6941014
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahJdKw3Zqb5g for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E7640FF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E7640FF9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24E0C87B39; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:30:58 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b362fa37e3c8c7c929d899eee9857c3d465ffa00
X-Git-Newrev: 1c16c1ed7e3ae39b71725392034fff602b526675
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.24E0C87B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libde265:
 security bump version to 1.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c16c1ed7e3ae39b71725392034fff602b526675
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/strukturag/libde265/releases/tag/v1.1.0

"Security fixes

- CVE TBD (GHSA-g2rg-wj66-w594) - Out-of-bounds write in
 process_reference_picture_set via predicted short-term RPS
- CVE TBD (GHSA-vv8h-932h-7r86) - Heap buffer overflow in
 de265_image_get_buffer via SPS dimension integer overflow
- CVE TBD (GHSA-g5hj-rf9f-7vxm) - Unbounded memory accumulation via
 orphaned slice headers in read_slice_NAL
- (GHSA-x27c-jp65-g395) - Quadratic CPU consumption in NAL parser
 (remove_stuffing_bytes, resize)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b2800531808e0648ffa5bb5340a761a3c32c811f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 0412936d42..71a0221089 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
-sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.0
+sha256  afc19dd28e2fc523de5952bba5224ee1d28e286c72436d2843df126cca1181fd  libde265-1.1.0.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index b559a9f607..2a10dce6d0 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.19
+LIBDE265_VERSION = 1.1.0
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
