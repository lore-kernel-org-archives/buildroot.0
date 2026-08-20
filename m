Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E6DC5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E11180F8B;
	Thu, 20 Aug 2026 20:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9H38-BMchK2; Thu, 20 Aug 2026 20:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787258471;
	bh=KtSrYgSPG0c7C+pY+ZcdeGcWuE6dDm8C8w1OYbHHu7w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g5g86DqD5Mo6sLsrks3Ho/3XoIKKpGuknnJ9bk0lUIib7HFb1RQ9yWLIvTYFq5K/n
	 HJjOaKWxJYqqfyityK0l4brmnDhZ0ScQ/m80TsFaAtOlC4BDxp/l56f8QsjtnH4ZT1
	 2kKOAq/Xpw8PWjKV3T/R0AVEZ3ygkjSjJo2cKY8ySryg+hLvNWvIuqlZM7hJ+k75mI
	 QtwW/4qpaZ9u9+IMfLmtExZthxff6XFqeGP0A8Yj7A2hMk0bnx/9A2dd86X/a0hYTY
	 jTlKyBecn6KEdA8KrIJzZo8EOEUoSIrmm8D96t5Nn+rLq7DFJT0stHHTOO+pYCgugT
	 LzNL8LP4Mt31g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A5A80F97;
	Thu, 20 Aug 2026 20:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1719C336
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148C24086E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9dKttvhWxqC for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A74A40846
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27D068DFFA; Thu, 20 Aug 2026 20:40:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 22:40:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e913afbeb1ad67ba43829aee94d01d8ca32120fe
X-Git-Newrev: 88c353351ad4dd0fda97d1a7e2e683db012759d6
X-Patchwork-Hint: ignore
Message-Id: <20260820204016.27D068DFFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhttpd: bump version,
 fix cmake 4 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88c353351ad4dd0fda97d1a7e2e683db012759d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
