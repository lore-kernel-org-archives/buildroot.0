Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CBBECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 08:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE649409F6;
	Tue, 30 Aug 2022 08:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE649409F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9f8lfJnR9W0U; Tue, 30 Aug 2022 08:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE80D409A9;
	Tue, 30 Aug 2022 08:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE80D409A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 440061BF29F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 08:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C62D60E83
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 08:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C62D60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIIo0tMHtKOG for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 08:05:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A108560E8D
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A108560E8D
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 08:05:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8EF561814B9; Tue, 30 Aug 2022 10:05:38 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 10:04:40 +0200
Message-Id: <20220830080447.7426-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1661846739; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ToR0nZlE/F7E1WNrkKYx5tG2jqSKig6tLkLy+3LhMJE=;
 b=Uzv+KmeXBTs8TtixRLXe/7lvAwv6EXbySWIbC5rihst9CcCaz8BSbGBoYMVIZwD/dut1Jr
 j8v4Nc/RgQqYyNCcYnVxM/weLpHBiQoNHdGPm7ElJJCJak/CbselKO2FyEb0owIAL/8/P2
 QomZSgdRhT1KNvOIip5PeLFsII3TWxs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Uzv+KmeX
Subject: [Buildroot] [PATCH] package/fmt: bump to version 9.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index c203e35867..65eeaa4ebe 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fc96dd2d2fdf2bded630787adba892c23cb9e35c6fd3273c136b0c57d4651ad6  fmt-9.0.0.zip
+sha256  cceb4cb9366e18a5742128cb3524ce5f50e88b476f1e54737a47ffdf4df4c996  fmt-9.1.0.zip
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index b7d67a0f28..ed0703cbc9 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 9.0.0
+FMT_VERSION = 9.1.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
