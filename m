Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD3FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969EF41EEA;
	Fri,  6 Mar 2026 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiFkDd9fVxMk; Fri,  6 Mar 2026 19:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F3041F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826687;
	bh=isbCw9hmGXtEI/8RQbOcapapcSNju/21cn0w5SROwkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LO3kp1JbZGndrF5I7SEHN7x+J7KJL8fM5AJbB8/I/BxN+aYY0dPSGZh45q4ecdFi8
	 IB/ml/8RdA4pBPKSDl6aeed8EiAeR7oZifLrumKUjT8JnmFZmf9LxnTEZ0J0bNIve2
	 PEYDxpE7tPAa5867SvbTQk56YqFkZFPzPeHDL0SuFBEn6Ru+XeDRJwONsSrlnBJyXY
	 xFWFEWrhvpHgej8iPTavXwvF8iiXR/IwPChP9JzpKB8dzKKSfoPqblH9cBtmNjBbI0
	 o4Ya8rYk1CxkXRvwhBWqYf73gUbMI6HC7M6eFEgfTFYrDaLGSgmc2wcHGwID8YC2ms
	 vaIWLCfv2K1Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F3041F05;
	Fri,  6 Mar 2026 19:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3F425B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B32613ED
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJ0JeycThpGN for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD8C613E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD8C613E8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D983855F0; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:13:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b1ff64b8e8fbb8ad172e690eeba2b3df1d8b49fb
X-Git-Newrev: 4b06ddf1c41bad6ef7da35cdd352d3cfea47fb4f
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.0D983855F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/webkitgtk: bump
 to version 2.50.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b06ddf1c41bad6ef7da35cdd352d3cfea47fb4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes a number of crashes. Release notes:

  https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 156e5fa7eb0de95076a54a93f66ba32ec1591853)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3c2f7aedbd..77bdc5485b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
-sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
-sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
+sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
+sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 161807bc5a..26c70ae6c8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.4
+WEBKITGTK_VERSION = 2.50.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
