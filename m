Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD28C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883D8415EF;
	Sun,  7 Jan 2024 17:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 883D8415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwYP3NsVHm7I; Sun,  7 Jan 2024 17:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC82415E7;
	Sun,  7 Jan 2024 17:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC82415E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4799F1BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20CF9415EC
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CF9415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPObFicKk3rr for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D7F2415E6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7F2415E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 485E18482B; Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 18:28:29 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0e5b9818a285c5597e94714c02c5fcafdfc82053
X-Git-Newrev: c3e41c34a1c3e930c53892b2e69dce9247afeda2
X-Patchwork-Hint: ignore
Message-Id: <20240107173611.485E18482B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sway/Config.in:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3e41c34a1c3e930c53892b2e69dce9247afeda2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
