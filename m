Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD67C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E839606A5;
	Sat,  8 Aug 2026 16:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYZboepLgLFM; Sat,  8 Aug 2026 16:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A8EF6068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204809;
	bh=R8nXP43dPXYQy1W893JlyMUdVaL+qW/W2LgXIF8hny8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNeDL+UNGnvhWNIuhur0CS2N02mG92tNuNyGlQL2Wy8Ozwx5899+EdW3xFZhOWtIQ
	 1TBX6Xu0HOzfGnlUnDstENhTHjOUxY6tWrb7XcN4/H6cK3sS0I2tAl58kXDrikU7MZ
	 N6ZbhcshqR6EtWRuN9tILvSnzyxZwIrke2rBwlZGbC3E+v3fAVa2DN4zUhhCtXj+Au
	 vlOcrStznVKo/goTNURRVg3dBLiTnR7MWYoMWk5ghmFtulCeBBii2SpyrQwe5Ues3t
	 yWc5J0HNuvSkvfBYwxR0hyRsPFVRQhVeUy2zyUik2k9CRorcEGWbkqUDR5VH8y0I13
	 0jBoXFPRyR3nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A8EF6068D;
	Sat,  8 Aug 2026 16:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 615C610E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F34480DC5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAZIU1k86BKn for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C1280DC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78C1280DC2
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55B208857F; Sat,  8 Aug 2026 15:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 17:56:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 402c94c2d70d617783a2cd9bb2c90556008b79ba
X-Git-Newrev: 015c7fe9ac664c873d5a4eefffb3a75092daeb5e
X-Patchwork-Hint: ignore
Message-Id: <20260808155919.55B208857F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/015c7fe9ac664c873d5a4eefffb3a75092daeb5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1b7c7a2c84..0d65167829 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  893e3c5a24b408ac312a0318b70f38f427f297646e323f31e79d3a06a92c1543  intel-gmmlib-22.10.0.tar.gz
+sha256  33ebb6e65a2617c59f95a9e70ce0cbeca098316cd265345a0f4db5b381f1024c  intel-gmmlib-22.10.1.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 7cb784f361..6fe5c1c067 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.10.0
+INTEL_GMMLIB_VERSION = 22.10.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
