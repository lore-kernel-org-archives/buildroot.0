Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12731C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A7461B46;
	Sun, 24 Jul 2022 12:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A7461B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK0KpqrBDcBi; Sun, 24 Jul 2022 12:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE7A61B38;
	Sun, 24 Jul 2022 12:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE7A61B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9051BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A53340AD8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A53340AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yano5rM6sL5e for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FB4D40186
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB4D40186
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11A9685C4B; Sun, 24 Jul 2022 12:17:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:22:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2ea8539b5c9d079a149445779d9a6432e69ed99
X-Git-Newrev: d7d6fda52f1443c50b1ded39fbeec7a6ecf93199
X-Patchwork-Hint: ignore
Message-Id: <20220724121731.11A9685C4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 16.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7d6fda52f1443c50b1ded39fbeec7a6ecf93199
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-32213, CVE-2022-32214, CVE-2022-32215, CVE-2022-32212,
CVE-2022-32223, CVE-2022-32222 and CVE-2022-2097

https://nodejs.org/en/blog/vulnerability/july-2022-security-releases
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V16.md#16.16.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 716becccc9..12ae449ab4 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.15.0/SHASUMS256.txt
-sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
+# From https://nodejs.org/dist/v16.16.0/SHASUMS256.txt
+sha256  145151eff3b2aa5ebe73384009c52271a83740ae687a93c98c628cd7d52736eb  node-v16.16.0.tar.xz
 
 # Hash for license file
 sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index cfd9295d4e..3154dcd7ec 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.15.0
+NODEJS_VERSION = 16.16.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
