Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB6CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 894E284565;
	Fri, 15 May 2026 17:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSUoA4fVtPdE; Fri, 15 May 2026 17:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A411584566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867107;
	bh=hcMmL1IzPPqAIM4TwiAojbDkA919HxZGxIoJmfM6o0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s/vPLsISkBRQw8fWQqHLVvR1Wp67fkhZj+831UN9AIlKQKL+5mtxN7Jr7GO4ZNnej
	 uqV8YtvzWatpsE8H01VmDfmh/zScxUId/2kvcNz2qDqN76QzULxw/UEEVHNMc9DRa0
	 eRhcsYFQwqaeNGDSHZ+y7M/Tjt7Ev8vy4EqjhuKvaEeM8ffwIcQefinwSxjy2zT143
	 h7JiqLxZI4jm0lRUFWC/VegxDDSrBMiW2hJLKaU3G21b1euPF737Zodli/JE9l4LJS
	 ytmLAtzv1iMnKdjyT5r+TOPHfqbrn56jB8ZkM0Cfo1Kf8wJZ4Xwb9pOzaQhit5C46m
	 +ZBLzx7XjF+rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A411584566;
	Fri, 15 May 2026 17:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A8E23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4671A8417F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZt-TA0P7yM1 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F1984189
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F1984189
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74C0486395; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3d586c429be838e9f55aabd21f9a269b53f15e61
X-Git-Newrev: 924da55e477020ca678ab1a2dd3b67fec925998a
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.74C0486395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/p7zip: security
 bump to version v17.06
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/924da55e477020ca678ab1a2dd3b67fec925998a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

What's Changed:
  - Fix CVE-2021-3520 affected components Lz4 1.9.3 in p7zip17 (#239)

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>a
[Marcus: mark as security bump]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 760e16dcc033bb743cacf56449011bc6cdaf7bed)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/p7zip/p7zip.hash | 2 +-
 package/p7zip/p7zip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index f0b9c27113..d352965950 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6  p7zip-17.05.tar.gz
+sha256  c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1  p7zip-17.06.tar.gz
 sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 803fd38b7f..ee5a7d2e10 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 17.05
+P7ZIP_VERSION = 17.06
 P7ZIP_SITE = $(call github,p7zip-project,p7zip,v$(P7ZIP_VERSION))
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
