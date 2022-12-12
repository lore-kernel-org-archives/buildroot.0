Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3094C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586E78141D;
	Mon, 20 Feb 2023 22:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 586E78141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1c58QK7MACy8; Mon, 20 Feb 2023 22:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6732B8233D;
	Mon, 20 Feb 2023 22:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6732B8233D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE191BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5420B61261
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5420B61261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjVRVwgSgt2k for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CC6F6128E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC6F6128E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 886958648F; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 20:44:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 470ce5d85c40a2f3b43dd9efaefac0000b047d23
X-Git-Newrev: f3b31a39fdffbf738789885f6e318131055e4b9b
X-Patchwork-Hint: ignore
Message-Id: <20230220205209.886958648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmbim: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3b31a39fdffbf738789885f6e318131055e4b9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libmbim library is licensed under LGPL-2.1+ since at least version 1.8.0
and
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/25cc3ed88d25b17c18fb32f46f96b560834387d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmbim/libmbim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 1c12b82298..e728cf58f9 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -6,7 +6,7 @@
 
 LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
-LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
+LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
