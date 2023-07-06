Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB80CEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6D0416C9;
	Thu,  6 Jul 2023 11:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E6D0416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtlX7krZ9Wcg; Thu,  6 Jul 2023 11:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCF2408A6;
	Thu,  6 Jul 2023 11:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCF2408A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2731BF97E
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159464027F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159464027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkfQm5IICZJM for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B13240136
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B13240136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2928986899; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:32:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4a5deaea87b92b5fb54164a7964da120e85a99d0
X-Git-Newrev: 74fa4b795fed372c16bd31ffd281432b2e89a473
X-Patchwork-Hint: ignore
Message-Id: <20230706113428.2928986899@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nodejs: security
 bump to version 16.20.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74fa4b795fed372c16bd31ffd281432b2e89a473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a240f9da855fc4a01ae1a1a755722f8fc3773705)
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
index 367d5d2058..225b371786 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
