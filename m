Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFCBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D91831D6;
	Mon, 11 Jul 2022 17:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D91831D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlUy3bhotEI9; Mon, 11 Jul 2022 17:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00088315C;
	Mon, 11 Jul 2022 17:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00088315C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4031BF9AD
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFFE682FEA
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFE682FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nf2Qp3sBLqK7 for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F12CF82FBE
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12CF82FBE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 20C7F83747; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:10:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 20788bc523419060bf4f79ba498a12a57e0697a4
X-Git-Newrev: 9038e5d1c8203b222e5d768fcbb6d1e417bb0e0f
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.20C7F83747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 support/scripts/gen-bootlin-toolchains: improve dependencies of ARM
 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=9038e5d1c8203b222e5d768fcbb6d1e417bb0e0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The current description of the Bootlin ARM toolchains allows them to
be selected for ARM big endian configurations, which obviously doesn't
work as these Bootlin ARM toolchains are little endian only.

We fix this by adding BR2_arm in the list of conditions for those
toolchains.

Will allow to fix:

  http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f2be0bb278f5ab2bb052d4a2420c00cbe7f27ff2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 16773cd9cb..df1c000f9b 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -41,22 +41,22 @@ arches = {
         'prefix': 'arc',
     },
     'armv5-eabi': {
-        'conditions': ['BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
         'test_options': ['BR2_arm', 'BR2_arm926t', 'BR2_ARM_EABI'],
         'prefix': 'arm',
     },
     'armv6-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_arm1176jzf_s', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7m': {
-        'conditions': ['BR2_ARM_CPU_ARMV7M'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M'],
         'test_options': ['BR2_arm', 'BR2_cortex_m4'],
         'prefix': 'arm',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
