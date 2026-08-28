Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D56C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF98360889;
	Fri, 28 Aug 2026 14:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp3ZQzDcGogf; Fri, 28 Aug 2026 14:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927164;
	bh=XzDeOniVLG8X0hXc0gX2jFBAauKJIwxJdJJBNdpZq8s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rbSqwig0cc5z6SjY4KXYlgKuQbFt5RV8BTcFV4lqppmUD0E3PFqD3GuoOyHT6KUBX
	 Qw43vZBsFSiUNmH6h6jr1+B5DegiXZRj1pzrxh85A53VkFZuy+x1pOHPgn/FkF+dCS
	 +rHv1rd+k0I9vmxn5JVSpW0cuLqW4vPIP25OUzwaQWAca6yNXuLWlU5+fAd7sdqe4U
	 +7NsqZPmfFXjZOiV1iwyLhJPuANnxJC4eF6KLdY5LzExG3Uu7RQWcNdqQyI2OgQyac
	 Q7TispczmUchJL0d9FAD0kePbtLiEdpBMo/qyGV1g5oXwGouIvCDVHEvgh/Z+sI7Bq
	 rBVwKGgbu1y7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86586087E;
	Fri, 28 Aug 2026 14:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B5A2D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D79880F45
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk5uIhpApokU for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 163CB80F48
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14990921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 202c0c4eac16eed7323f85bf698b573dece71610
X-Git-Newrev: d485b0677cee471b0b0699e40e002b81c5503060
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.14990921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/uhttpd: bump
 version, fix cmake 4 compatibility
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d485b0677cee471b0b0699e40e002b81c5503060
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This bump includes upstream commit
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=ebb92e6b339b88bbc6b76501b6603c52d4887ba1
which fixes cmake 4 builds. No backports necessary because the cmake 4
bump commit e46695bbe4ab583f39f9448f3ef3e044efa28808 is not present in
any older branches.

Updated hash of header file which is used as license file due to
upstream commits:
https://github.com/openwrt/uhttpd/commits/master/uhttpd.h

Disabled new configure option UCODE_SUPPORT which was added by upstream
commit:
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=3ceccd02d86bf4d6609f46d8b30963cc52034cc2

Fixes:
https://autobuild.buildroot.net/results/cc2/cc265d34aed684b88032edd04ca0fc88186ec676/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88c353351ad4dd0fda97d1a7e2e683db012759d6)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/uhttpd/uhttpd.hash | 4 ++--
 package/uhttpd/uhttpd.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e84d2dc3ed..015a04af5a 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  397aa4bccc4acb06031270d4a549fb266fec3950a88fe3523f0d7de74caff010  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git4.tar.gz
-sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
+sha256  5835ced5fd67358b95c07d41a3e2a5991719048f99b5d43bf191287524d8fabe  uhttpd-506e24987b97fbc866005bfb71316bd63601a1ef-git4.tar.gz
+sha256  b98de120bce554de7d205fbc5734c2b72973e55ce36ef6403510c4583cbe2e14  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index f4fcccfa67..2adf409487 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = 15346de8d3ba422002496526ee24c62a3601ab8c
+UHTTPD_VERSION = 506e24987b97fbc866005bfb71316bd63601a1ef
 UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
 UHTTPD_DEPENDENCIES = libubox json-c
+UHTTPD_CONF_OPTS += -DUCODE_SUPPORT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 UHTTPD_DEPENDENCIES += libxcrypt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
