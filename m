Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1CD64085
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 07:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F34F640CE8;
	Wed, 17 Dec 2025 07:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWFMi17Wk8a4; Wed, 17 Dec 2025 07:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF0C40D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765955394;
	bh=LjDdyfrVGihDDwYH0dfcWxO8G0UqORK37EAo2RKdIjc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F2STvxXKaMQ8/wRR3KM45sixByTWe6jfv5khWhKhmaVhj0P+ceqSUYs4serWcFzB+
	 Yss8RmbwDYgC2WwK/g2IFUbs1QR2472F4TnMhaCauudziOAtmBkVqFZoQbvHeN5s8a
	 6xVMjpeK63fTP8MJ1A0igK4zW37MmeqFAz5nId5TbJ4yczHqF9M4scs2drm/xtIlUH
	 lAByc937U30CzYvOJP1u6/cvQNhAMwYHElFf6PxQMRfEAoC733LjyuT7qk9Y+fsx76
	 hOiswuw5sC9OAVVn+83L7FyDi3D/+HbqfjVuQVs6xEmQRKdZ1uXk7g0SZdfIKvA9aW
	 pxgUu+ZsqMMsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF0C40D43;
	Wed, 17 Dec 2025 07:09:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E47378
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B60A9409F2
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5q1Hms1B_MII for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 07:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A921409E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A921409E0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BBEE870A3; Wed, 17 Dec 2025 07:09:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 08:08:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cda56f05e4b258d3ef16f77c454293e28f5fc62
X-Git-Newrev: 2dc61b52e8aa81104ad58e2fdb129da4c11c3327
X-Patchwork-Hint: ignore
Message-Id: <20251217070950.6BBEE870A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zic: bump to 2025c
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dc61b52e8aa81104ad58e2fdb129da4c11c3327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index b9daccb381..7fe7582f10 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
-sha512  19826b12968c10fc4db7e4b07ba782bfb8590eeebaec6f719d74b92a2e642ab817bd72bceff0015ce52a838edfdb00753b3cd87dd84b35abf2606e5bee445f76  tzcode2025b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
+sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 1abeb2d70e..06d8ebaf15 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025b
+ZIC_VERSION = 2025c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
