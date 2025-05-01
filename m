Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52770C3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D2F82EA1;
	Thu,  1 May 2025 21:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1Hh1uR5ub9s; Thu,  1 May 2025 21:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DDF822F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DDF822F6;
	Thu,  1 May 2025 21:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C498113
 for <buildroot@buildroot.org>; Thu,  1 May 2025 21:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72621403C2
 for <buildroot@buildroot.org>; Thu,  1 May 2025 21:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al_B7OqyTjMs for <buildroot@buildroot.org>;
 Thu,  1 May 2025 21:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EE8940197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EE8940197
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EE8940197
 for <buildroot@buildroot.org>; Thu,  1 May 2025 21:24:25 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id AbOIuhRlA2QPuAbOIuYbU8; Thu, 01 May 2025 23:24:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  1 May 2025 23:21:20 +0200
Message-Id: <20250501212120.2902424-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD2z7XG33IksFNvg9UKIQORkgjKkVCMCFTWgQnNjwaiunrGTgkfaE4DmEYAfaSbQpfSetRC4lK+cG4ue9aMxO6iMHdQtbC/7nX72uB8VcoxuBd11GZVN
 Jvs3qbwFpyuX2NRYEN2zBlIJjsw4XP9npjdj7nMqZ7iMEb8PxLA4lvP2XMbU9J84G0uUUXXwdE3aR1k8yXmUh+RuVptH3uz62fs+rJLcv4gO30BAZZmFZ7hN
 NW3HtP7F2i5p3GKkNeW+XoWqGwtrRz3EXrOkKbPi6HQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746134662; bh=6xFUW/hFy6wwmyNQENJqzRIr4lWNf9D7XGwGkhCJVAQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=c2MRuWRrdJJn6SKC5VzFfjwOkXzp2r+Q93jJaju55NiX4kkteZbkohbh+VACqoiPm
 HC/4DkwSyM0wd4fsV8TV0n3m4HEQFHlCgeVl+XCWdpeszRkFOftndifFAPBLE4/3R7
 Xldk8tW2Y9UWEGj786Y8YN+LOmp+fwaYsTbs9x4VaJk754VVeZ8gQ4qWXjHzdrz1rW
 hWzx6L7ykYVBv1F/N+AoExwFDMVuhJoVZkQ1F8PpEwSSONJMLndvdE4bMIcFEgTKt8
 jAqhCochdL8ChZstIZjrcBKLSKmL94Dovg+VD0ubJJbizzFY4i/54j6CPr6Z+Dx1Qw
 SaXSbf6Rfu2Uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=c2MRuWRr
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.2.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ea899b91c4..0e641cba07 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969  harfbuzz-11.1.0.tar.xz
+sha256  50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45  harfbuzz-11.2.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 6bd01d6e44..8af0fa6f18 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.1.0
+HARFBUZZ_VERSION = 11.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
