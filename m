Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4F1CAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D96B82C61;
	Tue, 16 Sep 2025 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVsUuD2vUdUr; Tue, 16 Sep 2025 19:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FDA82C3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FDA82C3B;
	Tue, 16 Sep 2025 19:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C983412D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6BE382C61
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub0QCWBdLJT8 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 19:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B8E82C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B8E82C38
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:57:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 124B7848AE; Tue, 16 Sep 2025 19:57:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 21:55:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8fd48a9241286e7a6e329b9e371c151baa510a6
X-Git-Newrev: dd68f4edd28007a58f7061056a3d65dd1bdfcb0d
X-Patchwork-Hint: ignore
Message-Id: <20250916195753.124B7848AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.48.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd68f4edd28007a58f7061056a3d65dd1bdfcb0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of crashes. Release notes:

 - https://webkitgtk.org/2025/07/30/webkitgtk2.48.4-released.html
 - https://webkitgtk.org/2025/08/01/webkitgtk2.48.5-released.html
 - https://webkitgtk.org/2025/09/03/webkitgtk2.48.6-released.html

And brings some security fixes. Security advisory:

 - https://webkitgtk.org/security/WSA-2025-0005.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Acked-By: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 6c2beb7d1d..fde2439dd5 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz.sums
-sha1  36faf2c30967db57175caf88cefd3d25781ae6d7  webkitgtk-2.48.3.tar.xz
-sha256  d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3  webkitgtk-2.48.3.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.6.tar.xz.sums
+sha1  8f8e27722b29be5aba84322cf7252fe14afcec60  webkitgtk-2.48.6.tar.xz
+sha256  d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24  webkitgtk-2.48.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 419bef9d8e..cb66641e3d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.48.3
+WEBKITGTK_VERSION = 2.48.6
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
