Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97BCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A079283168;
	Mon, 11 Jul 2022 17:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A079283168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_nmyAMnb6vH; Mon, 11 Jul 2022 17:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9589483089;
	Mon, 11 Jul 2022 17:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9589483089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89241BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64DA60F1E
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64DA60F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-xV5W6ffN0p for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 011D960F44
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011D960F44
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 25FE5837E8; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:09:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 42976b8edc2ae2d0ab87fd4623ef7bc72215291c
X-Git-Newrev: fddbde030b853b9dd5302065eb71f9b94ecc3b59
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.25FE5837E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=fddbde030b853b9dd5302065eb71f9b94ecc3b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 9a81f0ac0c..56c485313b 100755
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
