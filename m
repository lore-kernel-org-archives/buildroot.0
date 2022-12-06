Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB7C3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC3541731;
	Tue,  6 Dec 2022 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC3541731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEnDEOR_daEk; Tue,  6 Dec 2022 22:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2074171F;
	Tue,  6 Dec 2022 22:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2074171F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035BD1BF956
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC91E81E79
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC91E81E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Uhhva2Qnrl2 for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71FC681EA4
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FC681EA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B31985C8D; Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Dec 2022 23:01:46 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 696f05ad892ff14e5fd61b1b1236034cd47f1ffd
X-Git-Newrev: c0655d8f63994ab36168a227d0ab58041a27100a
X-Patchwork-Hint: ignore
Message-Id: <20221206221242.4B31985C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] toolchain/Config.in: fix
 check-package warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0655d8f63994ab36168a227d0ab58041a27100a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

toolchain/Config.in:236: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3381962216

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d5d447c5d531479ea5fa60ca3231ec91bde5354)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5fdebc6385..48d1d0513c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -231,13 +231,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
 config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	bool
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_OPTIMIZE_0
 	default y if BR2_microblazebe || BR2_microblazeel \
 		|| BR2_mips || BR2_mipsel \
 		|| BR2_nios2 \
 		|| BR2_or1k \
 		|| BR2_sh
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_OPTIMIZE_0
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
