Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C00BCCA481
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B2E60F51;
	Mon, 11 Jul 2022 17:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B2E60F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0hcqvafbJeK; Mon, 11 Jul 2022 17:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2136360F6D;
	Mon, 11 Jul 2022 17:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2136360F6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 100861BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B826983077
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B826983077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnMXy4e_0EnJ for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B92830AB
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B92830AB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3AB0D837E6; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:09:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b04f13a1fe031972cfcec3a7b178c7d732e8627d
X-Git-Newrev: a16600fa59efa6cc4c9ea62d9439bf08b714b8c5
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.3AB0D837E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/gen-bootlin-toolchains: adjust dependencies of i686
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

commit: https://git.buildroot.net/buildroot/commit/?id=a16600fa59efa6cc4c9ea62d9439bf08b714b8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The Bootlin i686 toolchain was already made available only on BR2_i386
with !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_1000. However, this
was not sufficient as a few other architecture variants of BR2_i386
are "lower" than i686, and they need to be excluded as well.

Allows to fix:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 26dee54e428679920336f0fcbece826f8cbf23ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/gen-bootlin-toolchains | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 56c485313b..5ddac8360f 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -253,7 +253,12 @@ arches = {
         'conditions': ['BR2_i386',
                        '!BR2_x86_i486',
                        '!BR2_x86_i586',
-                       '!BR2_x86_x1000'],
+                       '!BR2_x86_x1000',
+                       '!BR2_x86_pentium_mmx',
+                       '!BR2_x86_geode',
+                       '!BR2_x86_c3',
+                       '!BR2_x86_winchip_c6',
+                       '!BR2_x86_winchip2'],
         'test_options': ['BR2_i386',
                          'BR2_x86_i686'],
         'prefix': 'i686',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
