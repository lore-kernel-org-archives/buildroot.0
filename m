Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5528CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA26882B2F;
	Sat,  1 Jan 2022 10:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqVy44DEDzYW; Sat,  1 Jan 2022 10:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED218140B;
	Sat,  1 Jan 2022 10:03:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98F951BF263
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F9BE60E1B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4y-YcxUGEbX for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA34160DE5
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D18D0817B8; Sat,  1 Jan 2022 09:57:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:02:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d943a4ede09210a407846c59c41373263b2e5a1d
X-Git-Newrev: 57edd417c58e58dc10e60d84b6b1920e72560262
X-Patchwork-Hint: ignore
Message-Id: <20220101095723.D18D0817B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libimxvpuapi: switch to using
 host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=57edd417c58e58dc10e60d84b6b1920e72560262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package builds just fine with python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libimxvpuapi/libimxvpuapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index a2a3b21105..d8f214b9e0 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -8,7 +8,7 @@ LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
+LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python3 imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
 LIBIMXVPUAPI_NEEDS_EXTERNAL_WAF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
