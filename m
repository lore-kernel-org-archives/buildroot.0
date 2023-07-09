Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21B8EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 07:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F4860A84;
	Sun,  9 Jul 2023 07:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F4860A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TG9oHDSPBeSz; Sun,  9 Jul 2023 07:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C5B60BFE;
	Sun,  9 Jul 2023 07:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C5B60BFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11F531BF574
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8C660AA8
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 07:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8C660AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_XHoEXxtFmv for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 07:56:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF77B60A84
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF77B60A84
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 07:56:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 327F7A4C07E7;
 Sun,  9 Jul 2023 09:55:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43226)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIPGh-0003cU-2l;
 Sun, 09 Jul 2023 09:55:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 09:55:42 +0200
Message-Id: <20230709075543.400474-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688889344;
 bh=USZQlcAtKQkrchsYJfvXWXrvqIXiAo+cpFfXUTjHHEo=;
 h=From:To:Cc:Subject:Date:From;
 b=X3qiRvFPfIDtuZajpshzRAruZu3UaSGkmHyYO3FktTJL8H95D+gGFJ0kKdGPT9S7F
 lh3Y0qCBqvAwfEuwIarWE4HyYr+a3sKY0le7IUQkNf3PekFrXfYLSvU5ZJBV0cbGsb
 aU0APU8rvYZ0ySBR6nd2Q1uk1TrL0cu30qagcXuzZayqH8SY2Xm3kCmfYh8CgbmdE9
 o089dzJvgFHwtvGpcCm/vh+sMD4nY/koSvYbXpGOwO3U6Y4D2gst+6+lu+66jDxvDh
 +Xc/Fo9oXKphU+HR+3UY9tAHKR+p4MyE+f8bnhjGxEENVB4gYWDlrC9jTeAIYV12ra
 FyRKHsg21uMCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=X3qiRvFP
Subject: [Buildroot] [PATCH 1/2] package/mesa3d-demos: needs C++
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
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reference:
https://gitlab.freedesktop.org/mesa/demos/-/blob/main/meson.build#L21

Fixes:
http://autobuild.buildroot.net/results/90e/90e98fa0f37462cadea0fcbff9feabad5554587d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-demos/Config.in | 4 ++++
 package/piglit/Config.in       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index b716cf5799..2947915c92 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
 		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
@@ -10,3 +11,6 @@ config BR2_PACKAGE_MESA3D_DEMOS
 	  OpenGL demos from the Mesa 3D project.
 
 	  http://mesa3d.org
+
+comment "mesa3d-demos needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 5e957a555a..22d1c7c28e 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
-	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
