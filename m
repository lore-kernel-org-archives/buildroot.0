Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07DF436B6
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C54760E78;
	Fri, 17 Apr 2026 15:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-1kUpCyCzAq; Fri, 17 Apr 2026 15:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005D060E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439234;
	bh=6kvuz4WB7axjvWhjaigRwj3ITcelEATqHeUZiJ4qJ7o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q4h/yBEldu/TDraXEC5t+YSQQX4HycuuDN/xCiT2maJyqyXoXTcSF25yDLUSbIKMQ
	 SkPDNZe4cvNuDkUTwMVYPx4waoOwUjA+yFF2vSzPlvZnYdYm83eoupSroYaF/atO52
	 JTOMWDWoE2f/2J572k5K7UjY3K5TZcyQzAEhKmNiT/BxVMzFPpUrQa3DCNZJDiPHez
	 tTcgmPrZe/yayfKzkaP2242N6AR1pZZ0pACaIfjGrSwJ6kEuOWbix8I7E+bfPxARHm
	 iognc4FYXscCBF6m0imEydiTWJYKDti+peojonLcS/oht3/S7Q00nvNQv5qQ2Hvd81
	 fTb+HKqQylPaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005D060E57;
	Fri, 17 Apr 2026 15:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0E9259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC6BE40591
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghOJiiIpfdxZ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5B140585
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5B140585
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5103E819B4; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 16:09:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cf01628aa3cdedf73aa811252d238be4a09c9c96
X-Git-Newrev: 43ec601f3799ac8adc6adda300f85a8da1c5d9bf
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.5103E819B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libde265:
 security bump version to 1.0.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43ec601f3799ac8adc6adda300f85a8da1c5d9bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libde265/releases/tag/v1.0.18

https://github.com/strukturag/libde265/releases/tag/v1.0.17
Fixes CVE-2026-33164 & CVE-2026-33165.

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4b8a42fb253116befe539e5529ac4efd97ab421)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.hash | 3 ++-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index efd48d13aa..d977af5521 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
+sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
 # Locally computed
-sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 3d9b96134f..aab86ab3d7 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.16
+LIBDE265_VERSION = 1.0.18
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
