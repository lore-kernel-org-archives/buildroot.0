Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0045C6FD1A
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 21:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3572E61026;
	Mon,  6 Mar 2023 21:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3572E61026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0fFYR6TsbgM; Mon,  6 Mar 2023 21:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6776F61029;
	Mon,  6 Mar 2023 21:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6776F61029
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 016A21BF2E4
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1A861023
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1A861023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVaf59YpjJ5b for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 21:07:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EF46101C
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 21:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EF46101C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D54B08696D; Mon,  6 Mar 2023 21:07:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Mar 2023 22:06:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4789d37cc4c23b15a9fb95de73365b55e9fbd1aa
X-Git-Newrev: cde69c668d6692114845a927c8c5534ed78019db
X-Patchwork-Hint: ignore
Message-Id: <20230306210730.D54B08696D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: switch to version
 20210916
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

commit: https://git.buildroot.net/buildroot/commit/?id=cde69c668d6692114845a927c8c5534ed78019db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The author of the 8821cu repository has requested that we switch to a newer
major version of the driver located at 8821cu-20210916:

https://github.com/morrownr/8821cu-20210118/pull/93#issuecomment-1452675897

Switch to that new repository.

Fixes a build issue against PowerPC64.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index efb9871472..e2d83adc0f 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
+sha256  1d090da292c3f9322603846467a80278670211fcde3354dcabfe32c449992493  rtl8821cu-69c903b75bde36293c66b25c051916a74dbadf58.tar.gz
 sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 97f50d9633..b3e4ad3fc8 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
-RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_VERSION = 69c903b75bde36293c66b25c051916a74dbadf58
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
