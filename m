Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662EFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21BCA83487;
	Mon,  7 Mar 2022 22:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IBNxF7D-qbO; Mon,  7 Mar 2022 22:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4C0828F7;
	Mon,  7 Mar 2022 22:11:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E23531BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A44C260D57
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXs6rt9led1B for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E48F460D87
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 19CE182941; Mon,  7 Mar 2022 22:01:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 23:07:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1ff6a67739b29b79c81ee6bc14bd8c94a0a85c6
X-Git-Newrev: 3f5be21db989acbb41b0f432d0f72bc7cc458b24
X-Patchwork-Hint: ignore
Message-Id: <20220307220127.19CE182941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: needs OpenSSL
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
Content-Type: multipart/mixed; boundary="===============7856239057343981436=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7856239057343981436==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f5be21db989acbb41b0f432d0f72bc7cc458b24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

W/o OpenSSL QT5Webkit fails to build that way:
-------------------------------->8-----------------------------
.../build/qt5webkit-5.212.0-alpha4/Source/WebCore/platform/network/qt/ResourceRequestQt.cpp: In static member function ‘static bool WebCore::ResourceRequest::alpnIsSupported()’:
.../build/qt5webkit-5.212.0-alpha4/Source/WebCore/platform/network/qt/ResourceRequestQt.cpp:68:12: error: ‘QSslSocket’ has not been declared
   68 |     return QSslSocket::sslLibraryVersionNumber() > 0x10002000L &&
      |            ^~~~~~~~~~
.../build/qt5webkit-5.212.0-alpha4/Source/WebCore/platform/network/qt/ResourceRequestQt.cpp:69:9: error: ‘QSslSocket’ has not been declared
   69 |         QSslSocket::sslLibraryVersionString().startsWith(QLatin1String("OpenSSL"));
      |         ^~~~~~~~~~
-------------------------------->8-----------------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/Config.in    | 1 +
 package/qt5/qt5webkit/qt5webkit.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index ed87efca95..26c3897d1d 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LEVELDB
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 9012a588d4..6912359674 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,7 +10,7 @@ QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
 	gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
-	qt5sensors qt5webchannel sqlite webp woff2
+	openssl qt5sensors qt5webchannel sqlite webp woff2
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1

--===============7856239057343981436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7856239057343981436==--
