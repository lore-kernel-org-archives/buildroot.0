Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C7AF5A8AA
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 19:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588C461112;
	Mon, 20 Apr 2026 19:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Rt2UlzHe6Cp; Mon, 20 Apr 2026 19:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF9FB610F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776714240;
	bh=icyXE+OzF0HKwxo6choQQX4irgEh2dicIpz+Fronpxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l8za/zkxQ1+YsKZIjr337q+4bXj5k5E57HPBEW9NqPQwoDuqItna2+1TccysNSTfk
	 FIXSN/626nSDQJ+9jWSwkzPiSE9nvGC0Yj74fNvTsStEYaRXCDPe0NrflFwo4daXJH
	 6k8R9BqHT+HB3ZrE8Ihz5tkRd8/pEDsoGSZGs+IqUpLz7NR3Oo+qzM3ihEbbqjyR1t
	 tBzVE0etk0qIx+O8Fe+h4jZAZjKqaR79AD5sljAZWHcph0MC59QsSfx+okTto/GhA8
	 gzILX1jeQxIvaNbWO8uttmy8kEA3VDmBpGXEV7fdjwByC72pufxZFRr7l0V6Mz2277
	 e5tUKt7k8+zZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF9FB610F9;
	Mon, 20 Apr 2026 19:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08555259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE7C240889
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIu_wMt095hV for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 19:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483AB4008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 483AB4008E
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E28D682158; Mon, 20 Apr 2026 19:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 21:21:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe7ad9e3a2b9f5cf58c044cfa1338d6bc7bcf686
X-Git-Newrev: a266be923f5a8077d40b5c65c4e23138ddce3a63
X-Patchwork-Hint: ignore
Message-Id: <20260420194357.E28D682158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: security bump version to
 2.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a266be923f5a8077d40b5c65c4e23138ddce3a63
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pjsip/pjproject/releases/tag/2.16

Fixes CVE-2025-65102:
https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index e85d1f47b4..65f52bf3b1 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
+sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 69b3c1cffc..8cea8e3abc 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.15.1
+LIBPJSIP_VERSION = 2.16
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
