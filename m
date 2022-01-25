Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454E460B35;
	Tue, 25 Jan 2022 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfXEqN8JlE8q; Tue, 25 Jan 2022 07:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883DA60B3B;
	Tue, 25 Jan 2022 07:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837A11BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A1A640A93
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QczbZKpPrEa for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6575040377
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7D73D8233A; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fa073c65fce21e5f8ad0baf74e431f4cb598458
X-Git-Newrev: 7ed58f94ee2944959a1c35850fb62241eefc99fd
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.7D73D8233A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add missing BR2_X86_CPU_HAS_AVX512 condition for x86-64-v4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ed58f94ee2944959a1c35850fb62241eefc99fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The x86-64-v4 toolchain assumes availability of AVX512, as per the
definition of the x86-64-v4 "standard".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-bootlin-toolchains | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index a42ddb4097..dc173fa949 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -222,7 +222,8 @@ arches = {
                        'BR2_X86_CPU_HAS_SSE4',
                        'BR2_X86_CPU_HAS_SSE42',
                        'BR2_X86_CPU_HAS_AVX',
-                       'BR2_X86_CPU_HAS_AVX2'],
+                       'BR2_X86_CPU_HAS_AVX2',
+                       'BR2_X86_CPU_HAS_AVX512'],
         'test_options': ['BR2_x86_64', 'BR2_x86_x86_64_v4'],
         'prefix': 'x86_64',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
