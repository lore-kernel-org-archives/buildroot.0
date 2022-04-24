Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49872C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77F8410D3;
	Sun, 24 Apr 2022 15:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmmyZCrhqWME; Sun, 24 Apr 2022 15:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90714410D5;
	Sun, 24 Apr 2022 15:54:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 043071BF383
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF35E40145
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE2c46YTOxEO for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10F840121
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 27B958421A; Sun, 24 Apr 2022 15:43:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 16:53:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6e7a8511526687d27d45570171bd9e4dda6bd59
X-Git-Newrev: cdfe7d17b395813f66e231ed183a7b75afb14b8f
X-Patchwork-Hint: ignore
Message-Id: <20220424154321.27B958421A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdfe7d17b395813f66e231ed183a7b75afb14b8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
