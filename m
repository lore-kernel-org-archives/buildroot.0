Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12453C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1AD6075B;
	Sat, 14 Sep 2024 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsWX0vICkbdk; Sat, 14 Sep 2024 07:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB3A60739
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB3A60739;
	Sat, 14 Sep 2024 07:19:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABCA01BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D0840724
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpJxnf8IsCci for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D311240717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D311240717
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D311240717
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:19:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91A31C0003;
 Sat, 14 Sep 2024 07:19:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spN49-004zVY-1Q;
 Sat, 14 Sep 2024 09:19:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:19:08 +0200
Message-Id: <20240914071930.1189715-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 01/23] package/icu: fix typos in help text and
 patch description
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/0002-workaround-toolchain-bugs.patch | 2 +-
 package/icu/Config.in                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/0002-workaround-toolchain-bugs.patch b/package/icu/0002-workaround-toolchain-bugs.patch
index b5f25d0a13..f6b124cc2a 100644
--- a/package/icu/0002-workaround-toolchain-bugs.patch
+++ b/package/icu/0002-workaround-toolchain-bugs.patch
@@ -1,7 +1,7 @@
 Workaround toolchain bugs
 
 Many of ARM Sourcery CodeBench toolchain have a bug when compiling
-icu's translit.cpp source file. The bug is trigerred when there is a
+icu's translit.cpp source file. The bug is triggered when there is a
 combination of "-W -Wall" and "-Os", and causes an internal compiler
 error. The bug has been reported to Mentor Graphics.
 
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 8b410bfdb6..4ed662e887 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 	help
 	  This option allows to define the path to a custom data
 	  library generated with http://apps.icu-project.org/datacustom/
-	  Make sure you select the appropiate version to match the one
+	  Make sure you select the appropriate version to match the one
 	  provided by buildroot.
 	  Leave empty to not use this functionality.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
