Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF5C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 12:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00474167D;
	Sun, 30 Jul 2023 12:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00474167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8yyu4OTaqR6; Sun, 30 Jul 2023 12:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2F34160B;
	Sun, 30 Jul 2023 12:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2F34160B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 150661BF419
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC82840159
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC82840159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_L-Y_NJVtub for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2717C400CB
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2717C400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13C9283C65; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 14:40:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6404185f728fb1feacfbb5eaf59b1243b00a14a7
X-Git-Newrev: 38b8f6aa050bcb5a8e2facdd0d053f1553bfe702
X-Patchwork-Hint: ignore
Message-Id: <20230730124111.13C9283C65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuv: remove POST_PATCH_HOOK
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38b8f6aa050bcb5a8e2facdd0d053f1553bfe702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4, which
switched  _SOURCE to an upstream-provided tarball, forgot to remove the
POST_PATCH_HOOK which adds a file already present in the tarball.

Fixes:
http://autobuild.buildroot.net/results/e4d0c06e3babed6b290b6223a1cf7e4cce38064c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuv/libuv.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 75590ad8f2..76316484e4 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -15,16 +15,4 @@ LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE LICENSE-extra
 LIBUV_CPE_ID_VENDOR = libuv
 
-# Upstream needs tests to be run sequentially. This is the default in
-# automake 1.11 and before, but not starting in 1.12. To maintain
-# sequentiality in 1.12 and later, the automake option 'serial-tests'
-# must be used, Unfortunately, it is not recognised by 1.11 and
-# before. So upstream only adds it conditionally. We use automake
-# 1.14, so we need it.
-define LIBUV_FIXUP_AUTOGEN
-	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
-		>$(@D)/m4/libuv-extra-automake-flags.m4
-endef
-LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
