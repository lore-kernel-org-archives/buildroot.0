Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0A2C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 14:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5979606AE;
	Mon, 13 Jul 2026 14:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6YRBYgzEiJg; Mon, 13 Jul 2026 14:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136996081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783953821;
	bh=MusmQs2qhDR2AP/CJzL50c3htgmac3IvYkQjLdDPvXk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Br1JL9nXJp12/fe+h9RajUweoSyf5Ujn8D139Co3aPE6h+Q1CPRTBafZ2OiCycKp3
	 OYYGavsVXVqLz7cdCGVKm4EQpK9nM0qhqtnX3DavW4y0psyvVaIxYQRdEDHsKMtn/W
	 jFaQyaGxFnPPm2Nk4ZqTWacgylqFPpu4/wW8Y/1+kLYb5JQ9qELAvQQQRKPUTmco8N
	 kWNwEUFY8bxh64uQMY/vF/k3ggazTnZOwq+mEtJEmMgzJtY4FBt4PJQLwmW/ZZaRFB
	 VJMm9lSQZ2+3h67R8MiXii9dc1e65YLxQwJATLCufKg2DKjCaxf/uXtxWYoaftjVWi
	 w3eG1fkH+WCyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136996081F;
	Mon, 13 Jul 2026 14:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD03128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5AD60847
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCp7ztdLwcw4 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 14:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4A2606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4A2606AE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 14:43:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66885887D6; Mon, 13 Jul 2026 14:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 16:14:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d8a1bb4c845159fd174661055cf9113fcd62a97
X-Git-Newrev: 024dfbd0fb0ee38fd03965223ee94fd8d8c4ad72
X-Patchwork-Hint: ignore
Message-Id: <20260713144302.66885887D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vboot-utils: bump version to git
 042312c6e7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/024dfbd0fb0ee38fd03965223ee94fd8d8c4ad72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vboot-utils/vboot-utils.hash | 2 +-
 package/vboot-utils/vboot-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 6f1de06d3f..a40dcdcac3 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8bfffa49f9f4f82c68ad56de977eb2601d96dbff319a16945efb169d3c17278  vboot-utils-7dfa482d6a843e1e25b615d6b0200028cedce29f-git4.tar.gz
+sha256  da9ad5ccbd6873904fa52dd0134e4c0ab8cdbacfb6c3407add3b4da0c8b62c15  vboot-utils-042312c6e7fce9dd106b329be0ecb51a8a347337-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 72742266d7..dc0b1365b7 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VBOOT_UTILS_VERSION = 7dfa482d6a843e1e25b615d6b0200028cedce29f
+VBOOT_UTILS_VERSION = 042312c6e7fce9dd106b329be0ecb51a8a347337
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
