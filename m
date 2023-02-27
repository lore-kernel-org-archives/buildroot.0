Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66341C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C35C61042;
	Mon, 27 Feb 2023 16:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C35C61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FjjfCmut-AR; Mon, 27 Feb 2023 16:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 518CA60FDA;
	Mon, 27 Feb 2023 16:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518CA60FDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCF8B1BF2AA
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B533E40A49
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B533E40A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SS8HhEH9MQZi for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF84D40A2A
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF84D40A2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEB7586C3A; Mon, 27 Feb 2023 16:05:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:00:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad4982d18e66ec909b0c906768d233fd8d4a1be0
X-Git-Newrev: df83b6fb1404826cc6dbc154c5b4b5cb5a94c1ad
X-Patchwork-Hint: ignore
Message-Id: <20230227160515.DEB7586C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: fix module installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=df83b6fb1404826cc6dbc154c5b4b5cb5a94c1ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment module is build but not installed to target/. To fix this
let's bump package to 2023-02-18 version on master branch to fix module
installation.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 6a28c34773..bc3b8fc727 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  21372b654886c6d100f46636d7807428698bd618e00db1b8b49cfc3037e46d10  rtl8723bu-f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255.tar.gz
+sha256  d0db523f256795d8f3284fa2ec03855f231747ede8337e878bc096325b965654  rtl8723bu-92c19318cb54ef96c2cfb4a22b2c98eb512812d8.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index af1ac9454e..ad9bb9a462 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255
+RTL8723BU_VERSION = 92c19318cb54ef96c2cfb4a22b2c98eb512812d8
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
