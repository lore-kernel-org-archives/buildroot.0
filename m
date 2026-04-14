Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C83F9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F143142D08;
	Tue, 14 Apr 2026 19:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4Bz2lf7qMsc; Tue, 14 Apr 2026 19:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B3F42CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776193791;
	bh=9XGiTVcBDQ8nnO/Vs4cSWqKWeNRDdsC+BFXgXuQ01p4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=US8TYeGSvj1VNJPZXvFg5dCy0xrdgSZNK/Ab1IXYqM2RlNLx1fTHO3567SdIXZHfA
	 QpGp+h4oJKepB5ppNvm/DbtBHIYap/8sT5Qc++agEF+8sKmxSZ8bgEGjUrOyjFb9f8
	 /wRdxoG4BfRiNJvAYKxROfKX8HAUvLJ6KNAfdIxGaQmF5HAo/07puLPsAXHfg5eIBy
	 Xy+dPTWxuNwm4B6oaOozr/ldQyARDteqZQPjM2oL25j0QUjRliinNrXz8oFLCWdyiZ
	 SVJw5cyQQ21UUlR0B5SeUxGPocyS5KyXQvR2Lb8R80MaV7jOp2kIxz7FunaXIk3i8R
	 z0t9WBhCQD8BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B3F42CF3;
	Tue, 14 Apr 2026 19:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 914A9237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8354942CF3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPf4Q7ni0aet for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E0442CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E0442CE7
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2359F807EC; Tue, 14 Apr 2026 19:09:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:08:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6c087068760f3db8eccf47607d05d9db7a11c89
X-Git-Newrev: 4998fdcba7cf4c937c196a5975b1e05d076fde54
X-Patchwork-Hint: ignore
Message-Id: <20260414190948.2359F807EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump to version 1.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4998fdcba7cf4c937c196a5975b1e05d076fde54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-1.0.6

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 65083fff70..b478d412f4 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15e634c6181b32c39c1274917efcefc78a8123cc52e72475f71b512625a30ef1  ng-v1.0.5.0.3.tar.gz
+sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 15603b9679..3de8f24123 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.5.0.3
+ESP_HOSTED_VERSION = 1.0.6
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
