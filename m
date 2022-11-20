Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2CAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E504160AC2;
	Sun, 20 Nov 2022 09:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E504160AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfDroXxzUqW9; Sun, 20 Nov 2022 09:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B4360ABB;
	Sun, 20 Nov 2022 09:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B4360ABB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66EB91BF488
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B8A54097B
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B8A54097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IEz1NTTBbhC for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4EF40977
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4EF40977
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 363D583E6D; Sun, 20 Nov 2022 09:02:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:01:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c0311220fb627db8af4a2cd8c3adb067e8a308d
X-Git-Newrev: 58ba17c7849056fbeb3b4d652749af32f81e7360
X-Patchwork-Hint: ignore
Message-Id: <20221120090233.363D583E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 16.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=58ba17c7849056fbeb3b4d652749af32f81e7360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

DNS rebinding in --inspect via invalid octal IP address (Medium) (CVE-2022-43548)

The Node.js rebinding protector for --inspect still allows invalid IP
address, specifically, the octal format.  An example of an octal IP address
is 1.09.0.0, the 09 octet is invalid because 9 is not a number in the base 8
number system.  Browsers such as Firefox (tested on latest version m105)
will still attempt to resolve this invalid octal address via DNS.  When
combined with an active --inspect session, such as when using VSCode, an
attacker can perform DNS rebinding and execute arbitrary code

Update license hash for an update of base64 (MIT license) and a change in
copyright year:

https://github.com/nodejs/node/commit/8ea9a71b15a953cd0936f7e6aae84c62873a77b5
https://github.com/nodejs/node/commit/9f14dc1a8f43a9f3755c673009378b798cbdd73b

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 83e4c271ce..4408782248 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.17.1/SHASUMS256.txt
-sha256  6721feb4152d56d2c6b358ce397abd5a7f1daf09ee2e25c5021b9b4d3f86a330  node-v16.17.1.tar.xz
+# From https://nodejs.org/dist/v16.18.1/SHASUMS256.txt
+sha256  1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238  node-v16.18.1.tar.xz
 
 # Hash for license file
-sha256  69090e865afa7c62715b97f0712632d2923bd7a5faba91f94e4e75a2f9219d5e  LICENSE
+sha256  0bec08634ba79b5404f6b7f92ea850f3c2a06e27e6f83f2267e4f5e55ae33334  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 29a10b900f..367d5d2058 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.17.1
+NODEJS_VERSION = 16.18.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
