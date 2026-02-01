Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47147E6529E
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31E260E48;
	Sun,  1 Feb 2026 20:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53huRZRmfrfh; Sun,  1 Feb 2026 20:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D211360FCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978467;
	bh=HzavgQmBx/LPT2AooOSv0Ib97+AD6a69gg89tyloPZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qPH7Y+lZjiSJ4pS5da2cXVQc1+R25/32AGd5VRlF4r5jteJca7qOWVd53C7eJQzaM
	 ZFfSeDZU7CdFcl2cuiIODO+Eqh0WCocIL7GpcrtH2xumYGO4cnHIdcBU4gfMLasCWu
	 OEDogJUTGtg1wzEWRe99IhI7QCLS8DoJCjKohMY/nTUPS9VJHkh7MFfBtdQ8mLbciM
	 iRIEOVP4uUcU7lPZxPy3LhvsvkrbU6nNndy/l3exS5oj5heMnhKgxWR/qp34Gj0P95
	 smtuFLRnLGAeWFvHt5GdEEoNJ0ObvsStStSVnfC9txpcqBlELFNkufpEh6NAnw1ATq
	 o1QOpU1jNJ3Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D211360FCB;
	Sun,  1 Feb 2026 20:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B811E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4E82408ED
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-c0jjVI4yKk for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AEB408EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4AEB408EB
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F5B086171; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:36:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd45f51c5ff4bfb366c9169d96b75a9b597c1147
X-Git-Newrev: 224abedb068987ec73c99f3f85a17cfa97320443
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.9F5B086171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump version to
 22.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=224abedb068987ec73c99f3f85a17cfa97320443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nodejs/node/blob/v22.22.0/doc/changelogs/CHANGELOG_V22.md

List of security fixes:

22.22.0:
(CVE-2025-59465) add TLSSocket default error handler
(CVE-2025-55132) disable futimes when permission model is enabled lib,
permission:
(CVE-2025-55130) require full read and write to symlink APIs src:
(CVE-2025-59466) rethrow stack overflow exceptions in async_hooks src,
lib:
(CVE-2025-55131) refactor unsafe buffer creation to remove zero-fill
toggle tls:
(CVE-2026-21637) route callback exceptions through error handlers

22.17.1:
(CVE-2025-27210) Windows Device Names (CON, PRN, AUX) Bypass Path
Traversal Protection in path.normalize()

Version 22.18.0 includes
https://github.com/nodejs/node/commit/a2d2d36bb1c8a5599cda5c5ed7b65ded2abee72d
which fixes build errors with python 3.14
"ImportError: cannot import name 'FancyURLopener' from 'urllib.request'"
introduced by buildroot commit a0a6abc8b193e5bdab5326324d7299c19d5d8c67.

Updated license hash due to upstream commits:
https://github.com/nodejs/node/commit/ec60473ab1e4980bf6388b0d5ab34fb86b3ec466
https://github.com/nodejs/node/commit/0b5613f9fe38fd0f500d0bd147fa7d442189c7e2
https://github.com/nodejs/node/commit/0edf17198fe118c6cc39746feb8707a91d739f94

Switched _SITE to https.

Fixes:
https://autobuild.buildroot.net/results/da8/da82dc03cf0d42463fff1b5d9bf7a3c18cbf44dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e087d8a7f9..c3372f443c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
-sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
-sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
-sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
-sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
-sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
+# From https://nodejs.org/dist/v22.22.0/SHASUMS256.txt.asc
+sha256  1bf1eb9ee63ffc4e5d324c0b9b62cf4a289f44332dfef9607cea1a0d9596ba6f  node-v22.22.0-linux-arm64.tar.xz
+sha256  a8b4f15f6e1f371422f1f7abcca4c46bd7abc1c732c274bc5cb108b841c1f0ff  node-v22.22.0-linux-armv7l.tar.xz
+sha256  d83b9957431cc18e1fc143a4b99f89cde7b8a18f53ef392231b4336afd058865  node-v22.22.0-linux-ppc64le.tar.xz
+sha256  9aa8e9d2298ab68c600bd6fb86a6c13bce11a4eca1ba9b39d79fa021755d7c37  node-v22.22.0-linux-x64.tar.xz
+sha256  4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683  node-v22.22.0.tar.xz
 # Locally calculated
-sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
+sha256  e991d81497a85bb24fc6bffae0a3637a6accd6c6bc5ce1f2c5698bd555cf9d49  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 310face2d2..9f01d60baa 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.15.1
+NODEJS_COMMON_VERSION = 22.22.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
-NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
+NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
