Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50112EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 14:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2034611DF;
	Mon, 19 Jun 2023 14:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2034611DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkCTPC5pGBmK; Mon, 19 Jun 2023 14:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7B8611C9;
	Mon, 19 Jun 2023 14:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F7B8611C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54D881BF4D5
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 14:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD854179E
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 14:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD854179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjnhgwDs5276 for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 14:32:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF5041765
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DF5041765
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:32:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2797540007;
 Mon, 19 Jun 2023 14:32:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qBFvb-000skz-JO; Mon, 19 Jun 2023 16:32:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 16:32:20 +0200
Message-Id: <20230619143220.210438-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 16.20.0
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2023-23918: Node.js Permissions policies can be bypassed via
  process.mainModule (High)

- CVE-2023-23919: Node.js OpenSSL error handling issues in nodejs crypto
  library (Medium)

- CVE-2023-23920: Node.js insecure loading of ICU data through ICU\_DATA
  environment variable (Low)

- CVE-2023-23936: Fetch API in Node.js did not protect against CRLF
  injection in host headers (Medium)
  https://github.com/nodejs/undici/security/advisories/GHSA-5r9g-qh6m-jxff

- CVE-2023-24807: Regular Expression Denial of Service in Headers in Node.js
  fetch API (Low)
  https://github.com/nodejs/undici/security/advisories/GHSA-r6ch-mqf9-qc9w

For more details, see the advisory:
https://nodejs.org/en/blog/vulnerability/february-2023-security-releases

Update LICENSE hash after an update of the openssl license snippet:
https://github.com/nodejs/node/commit/e7ed56f501389978e4619ab697a812631c4061ff

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 4408782248..6ab4c53e79 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.18.1/SHASUMS256.txt
-sha256  1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238  node-v16.18.1.tar.xz
+# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt
+sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
 
 # Hash for license file
-sha256  0bec08634ba79b5404f6b7f92ea850f3c2a06e27e6f83f2267e4f5e55ae33334  LICENSE
+sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 539ded06cd..fe629ada21 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.18.1
+NODEJS_VERSION = 16.20.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
