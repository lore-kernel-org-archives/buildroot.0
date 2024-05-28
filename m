Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D7C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 06:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A399D80C70;
	Wed, 29 May 2024 06:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8T7iXeTs_NW; Wed, 29 May 2024 06:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A633F81127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A633F81127;
	Wed, 29 May 2024 06:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7675F1D3170
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F9C481135
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnBsAZqjjNmD for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 06:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F2080C70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F2080C70
 for <buildroot@buildroot.org>; Wed, 29 May 2024 06:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 911F88770A; Wed, 29 May 2024 06:16:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 07:14:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fcdc50175b02adce950e90e8d2ae2b7d1396761
X-Git-Newrev: 8845a796bb4bc04d0504496e09a4634a93165b1d
X-Patchwork-Hint: ignore
Message-Id: <20240529061656.911F88770A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=8845a796bb4bc04d0504496e09a4634a93165b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new stable series brings in support for pointer lock, customization
of subprocess launching, and a build fix that allows using EGL
implementations that do not ship a pkg-config module. Version 1.16.x is
recommended for WPE WebKit 2.44.x, which will be updated in a follow-up
patch.

Release notes:

  https://wpewebkit.org/release/libwpe-1.16.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwpe/libwpe.hash | 7 ++++---
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 554b1f2b0e..2a2ee3c2e9 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,6 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz.sums
-sha1  70a2b894af2b50d7082260158a89524974a480f3  libwpe-1.14.2.tar.xz
-sha256  8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef  libwpe-1.14.2.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.16.0.tar.xz.sums
+md5  9779115aaa7e67abe642777394e7bfa2  libwpe-1.16.0.tar.xz
+sha1  ea574e09b5d47461a5579a24006488419474d136  libwpe-1.16.0.tar.xz
+sha256  c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a  libwpe-1.16.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 1fbdd5fcc3..de49cedfb4 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBWPE_VERSION = 1.14.2
+LIBWPE_VERSION = 1.16.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
