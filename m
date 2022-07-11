Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4751CCA47B
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBAC4059C;
	Mon, 11 Jul 2022 17:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBAC4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGDrOgFDje3Q; Mon, 11 Jul 2022 17:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62128409E2;
	Mon, 11 Jul 2022 17:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62128409E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17DF51BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DC682FE4
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DC682FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRlJME46MmNY for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B0A88294A
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0A88294A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9EA4283746; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:13:24 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6a4f95cc52766359c5360ec2199ddcdc3e1b0a54
X-Git-Newrev: c0091eb3cb0b4fc881e878a0c1f8aa780769b3cf
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.9EA4283746@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 support/scripts/gen-bootlin-toolchains: drop "mips64" architecture variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0091eb3cb0b4fc881e878a0c1f8aa780769b3cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

These toolchains have been marked obsolete by toolchains.bootlin.com
as they are replaced by the mips64-n32 toolchains. See commit:

  https://github.com/bootlin/toolchains-builder/commit/121e78806b4968858f22ebea317767883752a456

Will allow to fix:

  http://autobuild.buildroot.net/results/d13b35ba5a0f68f72e6592bdd9218b625a3c6554/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit db37e75aa3e9adf4cf2745682a5d29d246d88880)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 36727c8fea..5e1e315f6d 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -99,11 +99,6 @@ arches = {
         'conditions': ['BR2_mipsel', 'BR2_mips_32r6', '!BR2_MIPS_SOFT_FLOAT'],
         'prefix': 'mipsel',
     },
-    'mips64': {
-        # Not sure it could be used by other mips64 variants?
-        'conditions': ['BR2_mips64', 'BR2_mips_64', '!BR2_MIPS_SOFT_FLOAT'],
-        'prefix': 'mips64',
-    },
     'mips64-n32': {
         # Not sure it could be used by other mips64 variants?
         'conditions': ['BR2_mips64', 'BR2_mips_64', 'BR2_MIPS_NABI32', '!BR2_MIPS_SOFT_FLOAT'],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
