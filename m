Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F827C5475B
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6119940856;
	Sun,  3 Mar 2024 10:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Meycaxz29GI; Sun,  3 Mar 2024 10:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A638D40882
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A638D40882;
	Sun,  3 Mar 2024 10:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1201E1BF8B4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32E560AE7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wi5HzIbuA900 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B11560770
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B11560770
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:47:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 172E287F70; Sun,  3 Mar 2024 10:47:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 11:46:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e88225ed8820881970ec33de7a15a1e0d50443da
X-Git-Newrev: 3b33b26633833f506c009082b604dad36a42fae3
X-Patchwork-Hint: ignore
Message-Id: <20240303104739.172E287F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b33b26633833f506c009082b604dad36a42fae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As Thomas stated in 3bb260cf3860:

The br-arm-internal-glibc.config is generally used as a configuration
to test the bleeding edge versions of components. However, it has been
lagging behind somewhat, so let's bring it up-to-date:

  - Binutils 2.42.x
  - GCC 13.x

Let the fun begin in the autobuilders!

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index cd148f32e6..4986d40912 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_39_X=y
-BR2_GCC_VERSION_12_X=y
+BR2_BINUTILS_VERSION_2_42_X=y
+BR2_GCC_VERSION_13_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
