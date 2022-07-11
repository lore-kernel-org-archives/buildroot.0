Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735E6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F1A460F4E;
	Mon, 11 Jul 2022 17:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1A460F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNSsLuB-rHQH; Mon, 11 Jul 2022 17:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37AF060758;
	Mon, 11 Jul 2022 17:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37AF060758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E06AA1BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 839D760F49
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 839D760F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ODz82PhL3eh for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D30A60F4A
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D30A60F4A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6CAE7837ED; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:13:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a9a3971550361f7cb8871800fcff52dfa8bfa0b9
X-Git-Newrev: ae98c1c7c558596a4fbd09445eeb7a7544ac7c34
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.6CAE7837ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae98c1c7c558596a4fbd09445eeb7a7544ac7c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 5ed6c1111a..60154abe90 100755
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
