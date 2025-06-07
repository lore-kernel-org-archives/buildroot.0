Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11248C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 15:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1A4560E0E;
	Sat,  7 Jun 2025 15:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Xwgh-HcrGsz; Sat,  7 Jun 2025 15:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0196C60B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0196C60B70;
	Sat,  7 Jun 2025 15:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7801BC8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E48640AF7
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjOxEWe2an2o for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 15:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 797A640AD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 797A640AD9
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A02481517; Sat,  7 Jun 2025 15:34:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 17:30:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa9ee1770140946bb9344e7c70e3be3d03481d0a
X-Git-Newrev: be69e6fe2f7a5d511a0179ca34006980730c61dc
X-Patchwork-Hint: ignore
Message-Id: <20250607153436.6A02481517@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jq: security bump to version 1.8.0
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be69e6fe2f7a5d511a0179ca34006980730c61dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/jqlang/jq/releases/tag/jq-1.8.0

Fixes the following security issues:
- CVE-2024-23337: Fix signed integer overflow in jvp_array_write and jvp_object_rehash.
- CVE-2024-53427: Reject NaN with payload while parsing JSON.
- CVE-2025-48060: Fix heap buffer overflow in jv_string_vfmt.
- Fix use of uninitialized value in check_literal.
- Fix segmentation fault on strftime/1, strflocaltime/1.
- Fix unhandled overflow in @base64d.

COPYING hash changed due to the following commit.
https://github.com/jqlang/jq/commit/9afc450930b19ca179e6ef4e744853a94a7b72cf

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.hash | 4 ++--
 package/jq/jq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index d4d8656ea0..344f73d463 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2  jq-1.7.1.tar.gz
-sha256  10e974638a41fadfd72357f2f3a4325e20b856c563365128f72feaa406f8c92d  COPYING
+sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
+sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index ba27e22f7f..f3f4704f37 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.7.1
+JQ_VERSION = 1.8.0
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
