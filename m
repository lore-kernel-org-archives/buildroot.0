Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D3C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 17:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5752260FB7;
	Sun, 21 May 2023 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5752260FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywVqY4nXcO9A; Sun, 21 May 2023 17:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FAA960A9F;
	Sun, 21 May 2023 17:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FAA960A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 835551BF3EA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD374190E
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BD374190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcfknYu96zwD for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 17:00:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233FC4190C
 for <buildroot@buildroot.org>; Sun, 21 May 2023 17:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233FC4190C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E6A286705; Sun, 21 May 2023 17:00:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 May 2023 17:52:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e0e8540eb221aa4946274ee8e63dac32c8d4637
X-Git-Newrev: 4944ff2878733f4f6f837ee0d417423420c663ce
X-Patchwork-Hint: ignore
Message-Id: <20230521170057.0E6A286705@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=4944ff2878733f4f6f837ee0d417423420c663ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
