Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA7F55104
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714BF83DC4;
	Sat,  7 Mar 2026 20:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKkeYOwNUxAk; Sat,  7 Mar 2026 20:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 938ED83DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772915654;
	bh=eeDP9HnThmwM3H3hOMpGJ5HyFlAuUmQyx6U0hqYN8n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aO69s0ygx5CpGqYPO/X+ki8wUU2zgWCfPU6Efy4lSLBnDfitJDpRLu0793tZXeWwD
	 Qq8zf/I9NND5tl4uFi+CmGxYR+WC3Z8hPeUvlCsJPuDoNDTp1D0rdv7OpVuQE3RUVq
	 URm3H9Swt7BrRozBCpSv6SadAHgnTwRiIhAsD28T/CK2Ovys5LiXkfkA6nlDbxy5zC
	 7TSwDNIRWNMslKOcRW76F4bDxExZIQRiC5TLbI9hUl6M62hYWPSH0Fbj4592hGff19
	 sMqcBTA8q1khh/QGApG4NRFri/uYnZfDqI+xLjvGce1LppY74mRqxzthLD6/OLuNNo
	 +GXoGcdbFA00w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938ED83DC6;
	Sat,  7 Mar 2026 20:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB31E169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A133383DC6
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrFo0JcmFLN2 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BAFE83DC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BAFE83DC4
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:34:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4277385E14; Sat,  7 Mar 2026 20:34:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 21:26:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db2d195ac842fda716a3dbc154c94d2feb59d059
X-Git-Newrev: 0c49eb8e3581de0641639804b21d87214019ee8e
X-Patchwork-Hint: ignore
Message-Id: <20260307203412.4277385E14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 3.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c49eb8e3581de0641639804b21d87214019ee8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.3/ChangeLog.md

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 3 ++-
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index d6373f4998..cb5dd5b71d 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,4 +1,5 @@
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.3
+sha256  075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0  libjpeg-turbo-3.1.3.tar.gz
 # Locally computed
-sha256  8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf  libjpeg-turbo-3.1.2.tar.gz
 sha256  2189dc45a8fe96204069f8124caa53a148dfdc193f50f584c6ca7849a6072872  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index a25f9e3f38..eb981793f5 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.2
+JPEG_TURBO_VERSION = 3.1.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
