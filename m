Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE8C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD97410C8;
	Sun,  5 Mar 2023 17:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD97410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tL9--vF9Q--i; Sun,  5 Mar 2023 17:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A1A410C0;
	Sun,  5 Mar 2023 17:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A1A410C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6150D1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C271460BE0
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C271460BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFVv4sZE7w0k for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FEF60E29
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FEF60E29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD703861FB; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:26:03 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 164e8ebdc162df54dd38c8c004f5e10d89260539
X-Git-Newrev: e1e3411270e71c5452ee8f54d2f04737f84ab872
X-Patchwork-Hint: ignore
Message-Id: <20230305173947.CD703861FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gcc/gcc-initial:
 fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1e3411270e71c5452ee8f54d2f04737f84ab872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix typo: am internal step -> an internal step

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51793e0d56eef07d9f68c676f9c84be3f425082b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index ebd8e8f017..a8ac20c5d8 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -9,7 +9,7 @@ GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 # We do not have a 'gcc' package per-se; we only have two incarnations,
-# gcc-initial and gcc-final. gcc-initial is just am internal step that
+# gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.
 HOST_GCC_INITIAL_DL_SUBDIR = gcc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
