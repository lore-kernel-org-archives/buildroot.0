Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19653CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E410D81E57;
	Fri,  5 Jun 2026 12:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HCMiqkioYNi; Fri,  5 Jun 2026 12:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0801A81EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663068;
	bh=wAVrtL3GtYXfYgXgenaOOveCmrJRQ5GUoToeL0BTkqg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KfzUklb/3ls60ZcxRgBnFqleSD2VsuHcGrTnbeDZ2opuYlpTonWWfCk0QMc356Wsc
	 qRMxcz8Ll8M7wHOoc5xg+5n9xGzwLdcw2ZJOZ+g5O833c1HD+NBnviMzbyGCKQqW7w
	 ZxF128tpHNhJ70kGIiYlIeL5AkUNbysKe7+HxrjBs9wpXX36SNz9Jrpm/uODPzrFbH
	 rS7UywU6WR+YA1Mw2zBMLrHYfgHqfQh+pUgUaCqMUGHokUUMqCbDdW86tnE5Pq6loa
	 L/hyeuaVydww0CkgRqqmPNEiCuQpdSVSjNkS0D2dHa4pzdC5tYRIKlp856ypWOYQUj
	 69HxL7uP7sfKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0801A81EF1;
	Fri,  5 Jun 2026 12:37:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A413388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B3881E6D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrebEpE1bfjk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A0481E4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A0481E4C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C46987B3F; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:30:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b3a27e6850762d831a0ccdf123a0acfecc4807c1
X-Git-Newrev: 6199b9b9cba6e9387896cc94b052c0ae38ad68ac
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.8C46987B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libde265:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6199b9b9cba6e9387896cc94b052c0ae38ad68ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
