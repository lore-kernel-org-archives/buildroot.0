Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DE2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E6E412F8;
	Fri, 27 May 2022 07:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQP_inUz_Wql; Fri, 27 May 2022 07:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93014412F4;
	Fri, 27 May 2022 07:58:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9275F1BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F45860BF3
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eINI4f4JR5Tk for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E79E860BE3
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1692B865B4; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 23:21:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f5bec810a67023bde7785ff04465b9e13f48ebdd
X-Git-Newrev: 02d193545d9b70330ef8bbdcb13bdb9af34cbea6
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.1692B865B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zlib: add
 BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
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

commit: https://git.buildroot.net/buildroot/commit/?id=02d193545d9b70330ef8bbdcb13bdb9af34cbea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cdfe7d17b395813f66e231ed183a7b75afb14b8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index d6d94889a7..3a486376ac 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
+	bool
+
 config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm
@@ -33,6 +36,7 @@ config BR2_PACKAGE_LIBZLIB
 config BR2_PACKAGE_ZLIB_NG
 	bool "zlib-ng"
 	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	select BR2_PACKAGE_HAS_ZLIB
 	help
 	  Zlib replacement with optimizations for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
