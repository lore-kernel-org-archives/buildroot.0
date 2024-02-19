Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06500C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C938640746;
	Mon, 19 Feb 2024 09:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni-Oj-cui84b; Mon, 19 Feb 2024 09:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA9AA40680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9AA40680;
	Mon, 19 Feb 2024 09:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5D0F1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60288188D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeV41ptefxvV for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D02EA81FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02EA81FA9
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D02EA81FA9
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:52:53 +0000 (UTC)
Received: from wslxew206.. (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id C9EF35241620;
 Mon, 19 Feb 2024 10:52:42 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 10:51:55 +0100
Message-Id: <20240219095155.2758428-3-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219095155.2758428-1-anaumann@ultratronik.de>
References: <20240219095155.2758428-1-anaumann@ultratronik.de>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 2/2] package/flutter-sdk-bin: bump to version
 3.19.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 48c9c7d7e3..9200972eb9 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239  flutter_linux_3.16.8-stable.tar.xz
+sha256  4cc1706fbd6e2a5c0ee34a6f8de875aae20904c9f47e18c88d2fcb25d9ea1a79  flutter_linux_3.19.0-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 0d9a44596d..7215b45460 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.8
+FLUTTER_SDK_BIN_VERSION = 3.19.0
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
