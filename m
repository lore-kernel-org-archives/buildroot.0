Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080E2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD18C40188;
	Mon, 31 Jan 2022 19:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioUZECPIT4yG; Mon, 31 Jan 2022 19:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFAB640159;
	Mon, 31 Jan 2022 19:58:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB981BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECEA82CB7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GY-FqDtaBWXl for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B3A6826DF
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:57:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8D3E281376; Mon, 31 Jan 2022 19:50:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 20:54:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35a3c018246813597db52ef65b36a295ebdd9285
X-Git-Newrev: 2dd01a63004994393ca42c90f99aeaf767a61e9f
X-Patchwork-Hint: ignore
Message-Id: <20220131195022.8D3E281376@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: widgets are
 mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dd01a63004994393ca42c90f99aeaf767a61e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version
5.212.0-alpha4 in commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:

CMake Error at /home/fabrice/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake/Qt5/Qt5Config.cmake:28 (find_package):
  Could not find a package configuration file provided by "Qt5Widgets" with
  any of the following names:

    Qt5WidgetsConfig.cmake
    qt5widgets-config.cmake

  Add the installation prefix of "Qt5Widgets" to CMAKE_PREFIX_PATH or set
  "Qt5Widgets_DIR" to a directory containing one of the above files.  If
  "Qt5Widgets" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  Source/cmake/OptionsQt.cmake:646 (find_package)
  Source/cmake/WebKitCommon.cmake:51 (include)
  CMakeLists.txt:137 (include)

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index b7beb2b252..68b679dfcd 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5SENSORS
 	select BR2_PACKAGE_QT5WEBCHANNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
