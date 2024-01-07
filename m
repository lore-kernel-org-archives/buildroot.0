Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB288C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD874169C;
	Sun,  7 Jan 2024 17:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD874169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHTReblnFa4E; Sun,  7 Jan 2024 17:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024C04168D;
	Sun,  7 Jan 2024 17:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024C04168D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 587C11BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302C340396
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302C340396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Y2tFnfJNqax for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 188D44037C
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 188D44037C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A8184888; Sun,  7 Jan 2024 17:37:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 18:28:07 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 32b652d878167864f4ca8349f81faf5070714def
X-Git-Newrev: 3cd431470ad70d1bfecc387396e7736713477459
X-Patchwork-Hint: ignore
Message-Id: <20240107173718.07A8184888@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/sway/Config.in:
 remove duplicate dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd431470ad70d1bfecc387396e7736713477459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d107888e38f8c34e7ce429552bb77ade5247ce88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sway/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index f8d073520f..26b5b2ecea 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -2,17 +2,15 @@ config BR2_PACKAGE_SWAY
 	bool "sway"
 	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 	depends on BR2_USE_MMU # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	select BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_JSON_C
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
