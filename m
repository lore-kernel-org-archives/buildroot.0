Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CDECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06F7406EA;
	Tue, 10 Sep 2024 07:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdS6Bj8vPvb5; Tue, 10 Sep 2024 07:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4B2406C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4B2406C7;
	Tue, 10 Sep 2024 07:10:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45B0A1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B1D60811
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSTmFjQA3nCV for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B2626080F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2626080F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2626080F
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DEA360006;
 Tue, 10 Sep 2024 07:08:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuza-00HS46-0U;
 Tue, 10 Sep 2024 09:08:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:10 +0200
Message-Id: <20240910070823.4158894-31-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 30/42] package/flutter-engine: fix typos in
 comments
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-engine/Config.in   | 2 +-
 package/flutter-engine/gen-tarball | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
index 00bcd05cd4..610c26d933 100644
--- a/package/flutter-engine/Config.in
+++ b/package/flutter-engine/Config.in
@@ -1,4 +1,4 @@
-# Flutter includes a vender copy of clang which is mandatory to use for
+# Flutter includes a vendor copy of clang which is mandatory to use for
 # compiling. These are the supported architectures.
 config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	bool
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 23b121d1f9..5bfb8f60e8 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -66,10 +66,10 @@ gen_tarball() {
     # There are two issues with the flutter-engine buildsystem:
     # - it expects empty directories created by gclient.py to be present; that
     #   means we can't use the mk_tar_gz helper method from support/download/helpers,
-    #   becasue it does not include emnpty directories;
+    #   because it does not include empty directories;
     # - it insists on having a full git repositoy, with .git et al., which means
     #   we can't generate a reproducible archive anyway.
-    # So we jsut create a plain tarball.
+    # So we just create a plain tarball.
     ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
 }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
