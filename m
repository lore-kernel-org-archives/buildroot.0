Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8CEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D5581DFD;
	Sun, 16 Jul 2023 06:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D5581DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5E2-zZFa246; Sun, 16 Jul 2023 06:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F4D81B9A;
	Sun, 16 Jul 2023 06:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F4D81B9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9B01BF8B4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93DD881B69
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93DD881B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhWi7vaFyBkb for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A59881B72
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A59881B72
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DD887033; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:09:25 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f2fd4a377542e6deaa73ca293efa9c48c8cbb2dd
X-Git-Newrev: 0067ab06a30ab5ba2cf417cb41382bace61ff93a
X-Patchwork-Hint: ignore
Message-Id: <20230716062109.06DD887033@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/quickjs: disable
 on sh*
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

commit: https://git.buildroot.net/buildroot/commit/?id=0067ab06a30ab5ba2cf417cb41382bace61ff93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
sh* since its addition in commit
5d50793659acb95050c110d5fc05399df20ce30b

Fixes:
sh4:    http://autobuild.buildroot.net/results/46d/46d7da58a857939ee3a33f60ab64ad278157c3bd/
sh4a:   http://autobuild.buildroot.net/results/b1d/b1db05e79e5505c6606524e54e159224b633eac2/
sh4aeb: http://autobuild.buildroot.net/results/c30/c307a1b67142405f81c9276056b28bea366f2ccf/
sh4eb:  http://autobuild.buildroot.net/results/945/945b508385ba5aa25f982f8a8493628fa828e472/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 1880a061e8a34b759a62da9ef0eed8ab566c88dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quickjs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 292dba86d0..fd174bc657 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
 	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
+	depends on !BR2_sh # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
@@ -18,6 +19,7 @@ config BR2_PACKAGE_QUICKJS
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
+	depends on !BR2_sh
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
