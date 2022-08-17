Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DC8C32771
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 05:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3A060BB9;
	Wed, 17 Aug 2022 05:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3A060BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPgnyrL9DZva; Wed, 17 Aug 2022 05:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1390A60AC0;
	Wed, 17 Aug 2022 05:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1390A60AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0905F1C113E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB27041934
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB27041934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRw-NIfF530W for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 05:39:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC6DE418CD
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 05:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC6DE418CD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A37E287931; Wed, 17 Aug 2022 05:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 07:29:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 85566d89f8ddc6764d155717f80336806ac0708c
X-Git-Newrev: 3a097226184e341639b59352c718e7990060d3e6
X-Patchwork-Hint: ignore
Message-Id: <20220817052455.A37E287931@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nodejs: security
 bump to version 14.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a097226184e341639b59352c718e7990060d3e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-32213, CVE-2022-32214, CVE-2022-32215, CVE-2022-32212,
CVE-2022-32223 and CVE-2022-2097

https://nodejs.org/en/blog/vulnerability/july-2022-security-releases
https://github.com/nodejs/node/blob/v14.x/doc/changelogs/CHANGELOG_V14.md#14.20.0

Update the LICENSE hash for the addition of corepack and ICU bump:

https://github.com/nodejs/node/commit/737df75e1707b41c30b71d94c779abe665edef41
https://github.com/nodejs/node/commit/2755d391a5e68e08b699e9d7c20e05cfc28bcac3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6365ef852b..ab79787e45 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.18.3/SHASUMS256.txt
-sha256  783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608  node-v14.18.3.tar.xz
+# From https://nodejs.org/dist/v14.20.0/SHASUMS256.txt
+sha256  2b5098498889d1e6a9709d63f3d6f94e696a5ad8221618c5d51159cee363996a  node-v14.20.0.tar.xz
 
 # Hash for license file
-sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
+sha256  d05c4319d4955d6b3c7beab2711ff61448b31889560d4b125bfbd35f16d3d3af  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5d8eb4af63..262d60e86b 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.18.3
+NODEJS_VERSION = 14.20.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
