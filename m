Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A9DC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E679B60E60;
	Tue, 13 Sep 2022 14:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E679B60E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElRGLcA8vhXm; Tue, 13 Sep 2022 14:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E5A60E2D;
	Tue, 13 Sep 2022 14:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E5A60E2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6950B1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4589A408BF
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4589A408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIlk9ZosWw71 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701FB40A81
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 701FB40A81
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60671837CC; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:12:09 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d928bd39dd94e6a739191b76c2819129899d11e8
X-Git-Newrev: b27d504747597c1cbaeb188d088d54982d4e3de8
X-Patchwork-Hint: ignore
Message-Id: <20220913142155.60671837CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] toolchain/Config.in:
 update gcc bug 99410
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

commit: https://git.buildroot.net/buildroot/commit/?id=b27d504747597c1cbaeb188d088d54982d4e3de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Gcc bug 99410 reappeared while building with gcc 11.x and while
testing it also shows up with gcc 12.x, so let's enable this bug for
all gcc versions except gcc 8.x.

Fixes:

  http://autobuild.buildroot.net/results/64e54ef5ba3a3dee391b788315615d57a1dd9fa2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e1d45a9bcb38e37d1b27388b267a790b56eb642)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0c5c290a76..ba1af1ece6 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -186,12 +186,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
-# fixed on gcc 11.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
+# on gcc 12.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
