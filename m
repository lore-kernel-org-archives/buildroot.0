Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E433FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E762414F8;
	Fri, 28 Feb 2025 17:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjZ7RSG7Cxnv; Fri, 28 Feb 2025 17:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED1A4F578
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED1A4F578;
	Fri, 28 Feb 2025 17:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 124FD68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 272524198B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aop04setk9NL for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C7D342CFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C7D342CFB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 281C080042; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:20:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ea79058c077961c8f3b7c8c25f4545400622313
X-Git-Newrev: 674b190cc3cda26e487312e3507ff60adceb17b3
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.281C080042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: security
 bump to 2.44.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=674b190cc3cda26e487312e3507ff60adceb17b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
CVE-2024-40789, and CVE-2024-4558.

Release notes:

  https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
  https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2024-0004.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7da0e97e5d..49f758d6a8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
-sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
-sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
+sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
+sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ecdb3c788c..49a532d9aa 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.2
+WEBKITGTK_VERSION = 2.44.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
