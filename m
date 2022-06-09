Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE79EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 07:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46E7340477;
	Thu,  9 Jun 2022 07:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9Bjj1kXqK6w; Thu,  9 Jun 2022 07:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CFBE40BE8;
	Thu,  9 Jun 2022 07:08:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6A21BF342
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF2B83DF2
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdRp6rXdA-KW for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 07:08:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ABD583DF1
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 07:08:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1006A86E77; Thu,  9 Jun 2022 06:56:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 09:07:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3b50e06910bd01792e0f0f0ad79f8fb943b02cec
X-Git-Newrev: 491d6dd699dfbe0575c860157269d5366d320afd
X-Patchwork-Hint: ignore
Message-Id: <20220609065611.1006A86E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ogre: add missing
 !BR2_arc dependency inherited from libfreeimage
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

commit: https://git.buildroot.net/buildroot/commit/?id=491d6dd699dfbe0575c860157269d5366d320afd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBFREEIMAGE
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_WCHAR [=y] && !BR2_arc [=y]
  Selected by [y]:
  - BR2_PACKAGE_OGRE [=y] && BR2_PACKAGE_HAS_LIBGL [=y] && BR2_PACKAGE_XORG7 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77926e7008d6f95a982e1f094dea4dae71e05961)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ogre/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ogre/Config.in b/package/ogre/Config.in
index 7d57d3f82a..e00d76d93d 100644
--- a/package/ogre/Config.in
+++ b/package/ogre/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_OGRE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
+	depends on !BR2_arc # libfreeimage
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBFREEIMAGE
 	select BR2_PACKAGE_PUGIXML
@@ -34,9 +35,11 @@ comment "ogre needs X11 and an OpenGL provider"
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_INSTALL_LIBSTDCPP && !BR2_STATIC_LIBS && BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+	depends on !BR2_arc
 
 comment "ogre needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+	depends on !BR2_arc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
