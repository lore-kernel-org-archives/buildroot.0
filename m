Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A427C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E2C418BC;
	Sun, 18 Sep 2022 09:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E2C418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxOSIyCt09uK; Sun, 18 Sep 2022 09:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A351418B9;
	Sun, 18 Sep 2022 09:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A351418B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34DEC1BF990
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E51C60E2E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E51C60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4aPRBgbPm5e for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 389626FB0C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 389626FB0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28CFB84BC8; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:59:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1c27a9c836edc36747bc1731ae891a2123ef63c3
X-Git-Newrev: 4824553c09c9a4459ff2610eb8351ddea4853953
X-Patchwork-Hint: ignore
Message-Id: <20220918093506.28CFB84BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/networkd-dispatcher: bump to version 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4824553c09c9a4459ff2610eb8351ddea4853953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

lots of fixes but most importantly:
 - don't allow unknown operational/admin states (CVE-2022-29799, CVE-2022-29800)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 40a1c141b33c10e996623920c01eff62a9f8fbb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
 package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
index ca7c300783..ffb4fa846a 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.hash
+++ b/package/networkd-dispatcher/networkd-dispatcher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  1682c0106d9d2879087612e76aebb87672ebf339c43f229a3ee27dadb428575b  networkd-dispatcher-2.1.tar.bz2
+sha256  61270b4c2f39c36da4b0a62724a3cc01f6732493fed0f166ee675bafedff11df  networkd-dispatcher-2.2.3.tar.bz2
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
index 4f609db73a..2b1aa257ce 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.mk
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORKD_DISPATCHER_VERSION = 2.1
+NETWORKD_DISPATCHER_VERSION = 2.2.3
 NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
 NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
 NETWORKD_DISPATCHER_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
