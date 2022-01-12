Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 06:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4DF83E9B;
	Wed, 12 Jan 2022 06:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40VVqto9FTXQ; Wed, 12 Jan 2022 06:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413DC832BF;
	Wed, 12 Jan 2022 06:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87E7A1BF8A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 06:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 744884054B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 06:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymAn68cjtQZx for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 06:47:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778C540186
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 06:47:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B90CD82582; Wed, 12 Jan 2022 06:41:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 07:47:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 280ad2e3d3b85bca5a45e8ff365445fe3f111d4d
X-Git-Newrev: e1bbe25437f3120a26067e6f08e4258510f644a9
X-Patchwork-Hint: ignore
Message-Id: <20220112064136.B90CD82582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: fix host dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1bbe25437f3120a26067e6f08e4258510f644a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
78d7c5f803c2f59385b57525e2d1d09da15e22a6:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU
  Depends on [n]: (BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS [=n] || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]) && BR2_HOST_GCC_AT_LEAST_8 [=y]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
  Depends on [n]: BR2_PACKAGE_HOST_QEMU [=y] && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU
  Depends on [n]: (BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS [=n] || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]) && BR2_HOST_GCC_AT_LEAST_8 [=y]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
  Depends on [n]: BR2_PACKAGE_HOST_QEMU [=y] && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

Fixes:
 - http://autobuild.buildroot.org/results/d78f660ca4a609a0a072b3f2e04d456bf8cf663f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/Config.in.host | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 86eaf21dac..4ceaf0c73e 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
@@ -11,3 +12,7 @@ config BR2_PACKAGE_HOST_NODEJS
 	  V8.
 
 	  http://nodejs.org/
+
+comment "host nodejs needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
