Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5250C77B7E
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 07:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5004141C4E;
	Mon, 29 May 2023 07:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5004141C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUuCEXaGxDkG; Mon, 29 May 2023 07:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67C0441C47;
	Mon, 29 May 2023 07:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C0441C47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 666DD1BF964
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A79741B85
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A79741B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89VDKUJbyirx for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 07:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D67C41B4E
 for <buildroot@buildroot.org>; Mon, 29 May 2023 07:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D67C41B4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 281D286A29; Mon, 29 May 2023 07:15:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 08:53:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 88aee033d14f729ea0f00f2327e399e249fc5be9
X-Git-Newrev: 0f229a4231ba4009fca0092fa0a77d84ea20c4b5
X-Patchwork-Hint: ignore
Message-Id: <20230529071523.281D286A29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f229a4231ba4009fca0092fa0a77d84ea20c4b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The br-arm-internal-glibc.config used to be generally used as a configuration
to test the bleeding edge versions of components. However, it has been
lagging behind somewhat and produce invalid configuration since binutils 2.36
removal in d08639e6b9e5... so let's bring it up-to-date:

- Binutils 2.39.x
- GCC 12.x

Since Buildroot 2022.02, the autobuilders doesn't use the csv file anymore
but the test-pkg script still use it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4944ff2878733f4f6f837ee0d417423420c663ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index fb930cbef7..cd148f32e6 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_36_X=y
-BR2_GCC_VERSION_11_X=y
+BR2_BINUTILS_VERSION_2_39_X=y
+BR2_GCC_VERSION_12_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
