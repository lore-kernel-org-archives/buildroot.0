Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB88C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDF64040D;
	Thu, 13 Oct 2022 13:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDF64040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnsNvWOduaHv; Thu, 13 Oct 2022 13:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E64A5403B7;
	Thu, 13 Oct 2022 13:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64A5403B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 739B71BF473
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF5E83E7E
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF5E83E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsHneMOvNSGG for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 13:01:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35FC483E31
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 13:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35FC483E31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D18F86BFE; Thu, 13 Oct 2022 13:01:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 14:56:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aa47ae19ed5c763fb74c1d5787e868756ece6dd8
X-Git-Newrev: d805244ed2bc014ed2d170a4c3e31e3836fc722b
X-Patchwork-Hint: ignore
Message-Id: <20221013130136.1D18F86BFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nodejs: security
 bump to version 14.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d805244ed2bc014ed2d170a4c3e31e3836fc722b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-32212: DNS rebinding in --inspect on macOS (High)
- CVE-2022-32213: bypass via obs-fold mechanic (Medium)
- CVE-2022-35256: HTTP Request Smuggling Due to Incorrect Parsing of Header
  Fields (Medium)

https://nodejs.org/en/blog/vulnerability/september-2022-security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ab79787e45..769fddae3b 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.20.0/SHASUMS256.txt
-sha256  2b5098498889d1e6a9709d63f3d6f94e696a5ad8221618c5d51159cee363996a  node-v14.20.0.tar.xz
+# From https://nodejs.org/dist/v14.20.1/SHASUMS256.txt
+sha256  365057ea661923cbfa71bdd7a8d0ace9ddff8d22d431ad92355f8433cecff14d  node-v14.20.1.tar.xz
 
 # Hash for license file
 sha256  d05c4319d4955d6b3c7beab2711ff61448b31889560d4b125bfbd35f16d3d3af  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 262d60e86b..5bee082f14 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.20.0
+NODEJS_VERSION = 14.20.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
