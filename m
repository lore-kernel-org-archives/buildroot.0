Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D91EC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 21:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D836D6159E;
	Wed, 20 Dec 2023 21:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D836D6159E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-l4aWGEDszO; Wed, 20 Dec 2023 21:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FAD6157E;
	Wed, 20 Dec 2023 21:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FAD6157E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7838E1BF361
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E26482275
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E26482275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CXXvkxFBIrr for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2A64834D5
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A64834D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF70887CA7; Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 22:05:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdeb41bda6c3f56012264cf38a8d3ae466f04320
X-Git-Newrev: d107888e38f8c34e7ce429552bb77ade5247ce88
X-Patchwork-Hint: ignore
Message-Id: <20231220210618.AF70887CA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway/Config.in: remove duplicate
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=d107888e38f8c34e7ce429552bb77ade5247ce88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
