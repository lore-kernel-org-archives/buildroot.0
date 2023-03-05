Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4BC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB7C4148B;
	Sun,  5 Mar 2023 17:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB7C4148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOsHkomB68ev; Sun,  5 Mar 2023 17:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0061040743;
	Sun,  5 Mar 2023 17:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0061040743
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1075B1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6772440A00
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6772440A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVpZyO9SEyVe for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3151840258
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3151840258
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 200C9864E5; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:26:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9b1f9449484b3a452479f68c8bbb194d15526141
X-Git-Newrev: b9686e8ba2e632053d3338ce7a42426e005dea43
X-Patchwork-Hint: ignore
Message-Id: <20230305174058.200C9864E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc/gcc-initial:
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9686e8ba2e632053d3338ce7a42426e005dea43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
