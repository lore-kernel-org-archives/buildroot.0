Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1364710F2871
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0788283B74;
	Fri, 27 Mar 2026 20:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPFHvFlCZJnz; Fri, 27 Mar 2026 20:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51D5822FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774644922;
	bh=joTtTM2N+FOGPXJ6echSlggL+cqskxUFUk4qtf7VjYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BGi22KaxszTHLs4jC2SEvt1pfjv++Cuo9UzBs9rau3o0tl4XYjLy/QJQwzj/6jH6e
	 flSlrwYfgDZLfOqwCnyGlYsdbgjngAQ8w0TbW2z5+eKowpXUtwzXI8e1Y9kuCifRZl
	 YJpW9glGebjpOOnhJpmQrBIOgcaZ0XXkHVP6RxPI7HTYAr9oaM65fr0KWFcmg5h5kX
	 faVpGKOTsE4CI+fp0hXV+Tp2ExGvYmSwFJAB/2WC3Hicav700Fv763xhlE4t7WRwk9
	 dS0DKL5PeDOU4xjjYxIxMJ3fLTjCcXDxQlqDUWySUomB/oTquOC2YnvI7afWufGXrZ
	 huQTarRynEqcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51D5822FF;
	Fri, 27 Mar 2026 20:55:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7217F1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6432140576
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woLKPWyUmgVk for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913D14056D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 913D14056D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB6907FC1E; Fri, 27 Mar 2026 20:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 21:54:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf77be26be856adb340596081992168565580cf3
X-Git-Newrev: ee1e0573435b4165f5ace58fa417d4a1a0ff5a12
X-Patchwork-Hint: ignore
Message-Id: <20260327205519.DB6907FC1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee1e0573435b4165f5ace58fa417d4a1a0ff5a12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 76263f950f..1b7c7a2c84 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ae262b95540681ad5478c63affb880135f772c95410b092009a6f7dfc04a5ba  intel-gmmlib-22.9.0.tar.gz
+sha256  893e3c5a24b408ac312a0318b70f38f427f297646e323f31e79d3a06a92c1543  intel-gmmlib-22.10.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 1e263c3add..7cb784f361 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.9.0
+INTEL_GMMLIB_VERSION = 22.10.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
