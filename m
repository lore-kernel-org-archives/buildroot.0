Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC7C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE9F846C7;
	Sat,  8 Jun 2024 19:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3XOW6nfeW2G; Sat,  8 Jun 2024 19:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E07846FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E07846FB;
	Sat,  8 Jun 2024 19:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20B8C1BF869
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0ED409A0
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LJuIwyCsh8n for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0444B4091E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0444B4091E
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E181687E93; Sat,  8 Jun 2024 19:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 18:46:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b746f626cbc56b7351c6c5990ffbd7be3ccf71b8
X-Git-Newrev: de27070009d79e03243f1f9cff905b26f4df0dc5
X-Patchwork-Hint: ignore
Message-Id: <20240608191458.E181687E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libwpe: bump to
 version 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=de27070009d79e03243f1f9cff905b26f4df0dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This new stable series brings in support for pointer lock, customization
of subprocess launching, and a build fix that allows using EGL
implementations that do not ship a pkg-config module. Version 1.16.x is
recommended for WPE WebKit 2.44.x, which will be updated in a follow-up
patch.

Release notes:

  https://wpewebkit.org/release/libwpe-1.16.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8845a796bb4bc04d0504496e09a4634a93165b1d)
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
