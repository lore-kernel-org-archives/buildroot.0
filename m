Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B5ACA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 06:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9CA840EF;
	Thu, 21 Aug 2025 06:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5bJN0zAfOWW; Thu, 21 Aug 2025 06:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 621F9840DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 621F9840DE;
	Thu, 21 Aug 2025 06:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8063CE0A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7247B840ED
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp8tMh66jq38 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 06:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC833840D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC833840D9
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 06:48:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9D7087A1C; Thu, 21 Aug 2025 06:48:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 08:44:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e002ec3773452a14180b9be686d909ccb2e61a5d
X-Git-Newrev: c9f4328ef4e12852e1cde814d919186846131765
X-Patchwork-Hint: ignore
Message-Id: <20250821064827.A9D7087A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jq: security bump to version 1.8.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9f4328ef4e12852e1cde814d919186846131765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/jqlang/jq/releases/tag/jq-1.8.1

COPYING:
Add LICENSE notice of NetBSD's strptime() to COPYING
https://github.com/jqlang/jq/commit/78045d8aa9d155ec0f82ab102aa752300c2349f1

Fixes the following security issues:

- CVE-2025-49014: Fix heap use after free in f_strftime, f_strflocaltime.

  https://www.cve.org/CVERecord?id=CVE-2025-49014

- GHSA-f946-j5j2-4w5m: Fix stack overflow in node_min_byte_len of oniguruma.

  https://github.com/jqlang/jq/security/advisories/GHSA-f946-j5j2-4w5m

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Peter: fix license info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.hash | 4 ++--
 package/jq/jq.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 344f73d463..4596134620 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
-sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
+sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
+sha256  ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index f3f4704f37..b0776021fc 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.8.0
+JQ_VERSION = 1.8.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
-JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
+JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
+	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VALID = YES
 JQ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
