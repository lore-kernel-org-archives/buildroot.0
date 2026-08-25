Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDE2C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E24404FF;
	Tue, 25 Aug 2026 21:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-ReCGSfeodO; Tue, 25 Aug 2026 21:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787692723;
	bh=CVfZZUJbSaKngkIbnNO58HNnHTZriudB/XZ33Ws3eR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HtpwEM0q1P+9jY9Phj+TNdn7oewrxwkKlTKyAv04vaP7c7wMbWtDKph6X1yEczpSH
	 4Dn+jG+LXhS1IbKCQ0L6r/j0ap8c33cIUNqK4rvKulhtZn5pmBUxZonEqulTeOipuA
	 4bcafsHYW30tq+9XfdYdQJ9c7mfcEqcYk4WK0Cyvux+zhOP1pdwxr70FWlmlnKHtHU
	 Hkd1THsfiomFEIv2WXmrNtJcWITxsCm1O4VOoclAptV7slDkGApzOScNEKUMTbI2vc
	 widdgrSdwi9RCkydVLQI2UNeKyfYDj0wR4ZDb15AqWXZoU7x4CIFpZEWCe2rc8UNl6
	 9KL0/EjUdZXhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E683D40564;
	Tue, 25 Aug 2026 21:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C62E4334
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7DAD80BB0
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsqSYZMtgQaC for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0785680B75
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BF1891F1C; Tue, 25 Aug 2026 21:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 23:08:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 009d34015b44075e15c632a514511bdd27074aea
X-Git-Newrev: 4221e786e0be6efefc4fffbf1ec4ee2c4374e608
X-Patchwork-Hint: ignore
Message-Id: <20260825211744.4BF1891F1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnspr: bump to
 version 4.39
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4221e786e0be6efefc4fffbf1ec4ee2c4374e608
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog:
https://hg-edge.mozilla.org/projects/nspr/log/54e7c1b0803d151e142e30dc0d05f12e1ec67a13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 9148cf393e..9a0da47e23 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
-sha256  e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  nspr-4.38.2.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.39/src/SHA256SUMS
+sha256  bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e  nspr-4.39.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 3c7351c2d7..49fcf30640 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.38.2
+LIBNSPR_VERSION = 4.39
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
