Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6592CC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E59D40B4E;
	Tue, 14 Jun 2022 15:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naxk8JqVufTZ; Tue, 14 Jun 2022 15:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 465F940B41;
	Tue, 14 Jun 2022 15:46:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2C4B1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0203D82FF9
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76l07-Ys9h9N for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDEC983279
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0FDEF86FFA; Tue, 14 Jun 2022 15:32:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:28:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c11e6f3c8de5482ddb36809b129179022f520a1
X-Git-Newrev: db37e75aa3e9adf4cf2745682a5d29d246d88880
X-Patchwork-Hint: ignore
Message-Id: <20220614153201.0FDEF86FFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 drop "mips64" architecture variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=db37e75aa3e9adf4cf2745682a5d29d246d88880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These toolchains have been marked obsolete by toolchains.bootlin.com
as they are replaced by the mips64-n32 toolchains. See commit:

  https://github.com/bootlin/toolchains-builder/commit/121e78806b4968858f22ebea317767883752a456

Will allow to fix:

  http://autobuild.buildroot.net/results/d13b35ba5a0f68f72e6592bdd9218b625a3c6554/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
