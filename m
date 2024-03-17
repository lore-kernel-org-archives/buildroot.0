Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6755EC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA3781767;
	Sun, 17 Mar 2024 14:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIweijl2E8ti; Sun, 17 Mar 2024 14:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B95E8176E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B95E8176E;
	Sun, 17 Mar 2024 14:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2681BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8749B817A3
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pV2yTG7RIiKO for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE08981767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE08981767
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98A4782751; Sun, 17 Mar 2024 14:36:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 13:55:16 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 38e800efad61165ac0ad4510fba1f39d374a9458
X-Git-Newrev: e00705b984e186e51f40a96eaff27f5aa1589d66
X-Patchwork-Hint: ignore
Message-Id: <20240317143626.98A4782751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libuv: remove
 POST_PATCH_HOOK
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

commit: https://git.buildroot.net/buildroot/commit/?id=e00705b984e186e51f40a96eaff27f5aa1589d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4, which
switched  _SOURCE to an upstream-provided tarball, forgot to remove the
POST_PATCH_HOOK which adds a file already present in the tarball.

Fixes:
http://autobuild.buildroot.net/results/e4d0c06e3babed6b290b6223a1cf7e4cce38064c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 38b8f6aa050bcb5a8e2facdd0d053f1553bfe702)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
