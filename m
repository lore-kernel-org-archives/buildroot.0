Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAAFCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B6984649;
	Wed, 27 May 2026 22:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmodcvVtgSA0; Wed, 27 May 2026 22:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9434380F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922789;
	bh=v9BNgGqQXROsbRXgE6nEOMZXg+CIW4alcbOpceyZG0Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMVDJwtegZRijrTTF208M5h0tEFkP7XeK62VSbZZkDU+xKz4xTb3NEW5PW6fP3Fna
	 4nMplqSVb8Xuotc8esemjomDU7wcC+dbYzUCFCe3HG/0aSXqSBirRGk8TBi8UZ6aZu
	 gesd41QzQ3Xrc4umFPBJLoVwqspPj0xBL/A1gWhU7Wt/KmhBa6IGW9OCgX8twSCNuu
	 ZWaEPXhpCg/5YPZge1ttukXVuC4gVeywivOWfI5mWDz7totYVUC7/Z5Ofvv6xV8KYu
	 e23RmyjZUokSDl4A3+/ouM2k/ui8P40XCHgSIbnXMu7JCC0WmmqnIqe+9qwT7wpP1F
	 Qh6FqDGmJSZUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9434380F34;
	Wed, 27 May 2026 22:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B05828A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3348C6155E
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3AMB2tgFFQR for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62EA261663
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62EA261663
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A4078708D; Wed, 27 May 2026 22:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 00:58:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f51769b7e9796906bc11d463c1436efe5de7073f
X-Git-Newrev: b2800531808e0648ffa5bb5340a761a3c32c811f
X-Patchwork-Hint: ignore
Message-Id: <20260527225934.9A4078708D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump version to
 1.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2800531808e0648ffa5bb5340a761a3c32c811f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
