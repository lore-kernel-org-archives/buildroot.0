Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B34ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9218E42475;
	Sun, 18 Sep 2022 21:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9218E42475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsgI0HPjsH65; Sun, 18 Sep 2022 21:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782084247C;
	Sun, 18 Sep 2022 21:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782084247C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6E91BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 570BC4049B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570BC4049B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rnqgko3Di-KO for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 797744023B
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797744023B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6938F856EA; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:14:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5dc3ee86c360038e49b50544717f6c5eac44cd45
X-Git-Newrev: 34084edd257a436edf97b7e9d9c048fa4260c294
X-Patchwork-Hint: ignore
Message-Id: <20220918212044.6938F856EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] toolchain/Config.in:
 update gcc bug 90620
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

commit: https://git.buildroot.net/buildroot/commit/?id=34084edd257a436edf97b7e9d9c048fa4260c294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Gcc bug 90620 reappeared with gcc 11.x so let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - don't switch arch and gcc-version between select and depends-on
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a9d35fd78cf44c1764b21e396bd383bd8e65a5ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ba1af1ece6..932130c3c3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -171,11 +171,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# This bug no longer exists in gcc 10.x
+# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
