Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFF7C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9BE981426;
	Sat, 22 Jul 2023 21:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9BE981426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yylmeL1G2rR; Sat, 22 Jul 2023 21:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB87681432;
	Sat, 22 Jul 2023 21:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB87681432
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDAA91BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A73A5409F3
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73A5409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHi3v7h-2S21 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 813494015A
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 813494015A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A070822C7; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:48:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d12dd3a3fc83516ede99b89f5a33e8b6ef6b77c4
X-Git-Newrev: dc7d74bc26f70f3334c9b07ea2c063c0bcc028b5
X-Patchwork-Hint: ignore
Message-Id: <20230722215427.6A070822C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Config.in: put llvm packages at
 the right place
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc7d74bc26f70f3334c9b07ea2c063c0bcc028b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package is verifying the alphabetic ordering of package names,
not directory, so package/llvm-project/clang/Config.in should be
sorted as "clang" and not "llvm-project".

Fixes:

package/Config.in:2130: Packages in: menu "Other",
                        are not alphabetically ordered;
                        correct order: '-', '_', digits, capitals, lowercase;
                        first incorrect package: clang

In:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4718833134

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 601922aad5..1e551d17c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2025,7 +2025,9 @@ menu "Other"
 	source "package/catch2/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
@@ -2067,6 +2069,7 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
+	source "package/llvm-project/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcrossguid/Config.in"
@@ -2127,9 +2130,6 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm-project/clang/Config.in"
-	source "package/llvm-project/compiler-rt/Config.in"
-	source "package/llvm-project/libclc/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
