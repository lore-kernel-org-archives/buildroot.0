Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42EFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DD360F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96DD360F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC414157E;
	Tue,  3 Aug 2021 22:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kS355KGFN8yq; Tue,  3 Aug 2021 22:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF16B40677;
	Tue,  3 Aug 2021 22:34:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 271CD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C924053C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ8rE9lKaGT6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB10740494
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2B8CA87B3E; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 11:34:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e2bcf6605a540ff370479dffe94cd26ee6df2c6e
X-Git-Newrev: ac16bb646fb8790654d9ae35bda39b4946d552d2
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.2B8CA87B3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/waylandpp: add
 dependency to BR2_INSTALL_LIBSTDCPP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ac16bb646fb8790654d9ae35bda39b4946d552d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr: propagate the dependency to kodi]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/Config.in      | 1 +
 package/waylandpp/Config.in | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 782cca3c18..f4cfc6380c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
+	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
 	depends on BR2_PACKAGE_WAYLAND # waylandpp
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
index 3d7362b3c0..86ca965056 100644
--- a/package/waylandpp/Config.in
+++ b/package/waylandpp/Config.in
@@ -3,14 +3,16 @@ config BR2_PACKAGE_WAYLANDPP
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_WAYLAND
 	help
 	  Wayland C++ bindings
 
 	  https://github.com/NilsBrause/waylandpp
 
-comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
 	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		!BR2_HOST_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
