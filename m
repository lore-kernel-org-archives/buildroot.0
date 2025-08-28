Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058BCA0FF6
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 22:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89C141317;
	Thu, 28 Aug 2025 22:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNOmUuz7ExzH; Thu, 28 Aug 2025 22:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2646E41319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2646E41319;
	Thu, 28 Aug 2025 22:09:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B32EB6C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 22:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4CDA41246
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 22:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtHo8u2Vziaw for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 22:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.128;
 helo=smtpcmd11128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F076D40050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F076D40050
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F076D40050
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 22:09:05 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id rknkubY4htr9drknkuzG1T; Fri, 29 Aug 2025 00:09:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 29 Aug 2025 00:08:59 +0200
Message-ID: <20250828220859.468633-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBLgKFOqZw0K7m5jpLR3ORaK6nBWkuEy84BmoDK31WXm5Uha4fQY2mvpLtHvvCUC4uAmL9rX3YmqYQgnq+Ve92I+O9sus0Zc4Vi4FD2dS3d06gLyUAiG
 +nAwTYCsORYBKfJOJPMyl6noQ/Cb9iSV8UkKfekK98U60GLACo+HEGdC9m9g6gsG95FjQ677iK0o0i1bbb3AGwA7tA+v9xxP4JKdZ5IXKwvihxhs1IrCLpae
 1++plOE00Gf0mwU9fPVhoiaIZ/HpZ/2yJbB/w/VKaJ83UjhGqLooeTOrybe9yS8fvUfjexyifks2yG33VQm0sg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756418941; bh=KdSjB+6GQK8VazXPU3rg6NXV9jVftn0x1ENmWhc/7Uw=;
 h=From:To:Subject:Date:MIME-Version;
 b=OdQSqhkbfeXPqqTlPn0oG5GjxevAqjMWh3qehoaqtkfV6OioZCHOz/lBOfYay21RF
 5hCIdkGw5Qu2pDxtVhj8kNojNuy3RLCWSSQxF3vCyKyWJZJ8Al+3qVqh4LXjjrsIGt
 8bMeupR3sIsB4weFgEIPWT24O0QNFSdxK5dRnLgzDG261GgweAfq6quN0wqsO7grpH
 6bCxEu/FkKmzE2DsyD2/ap91yqT8W7kbDK6m1dacQOXP8L8WSxL8861sOfdwFe1nH8
 7BOep99FOZRsyr87aVJpTpYu1/Q0O9Qe5mnYg0Xki1h89eeSh2dqvdYCoO+uDnliYM
 UQsaZN0Nyi4NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OdQSqhkb
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to version 2025-08-29
 branch v5.2.6
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

This version allows to build up to Linux version 6.16

Fixes:
https://autobuild.buildroot.org/results/588b834b133abfc983945beef37f7f2b0df71c5f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index e79e32ff3d..2796c50791 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
+sha256  d8d11753f88d670be7489fd1d5d30718543f4994ccc5031609f4408a5586ef3c  rtl8821au-4d39880a41201ddb14b19f2e7273054bb812b32e.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index aa900839f5..afd520b467 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
+RTL8821AU_VERSION = 4d39880a41201ddb14b19f2e7273054bb812b32e
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
