Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C6C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 550F9701C8;
	Tue, 21 Feb 2023 01:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 550F9701C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABunK6zc-cbK; Tue, 21 Feb 2023 01:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A751701BB;
	Tue, 21 Feb 2023 01:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A751701BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 369421BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C866270014
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C866270014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0lgP_RaaKP8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03211610E3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03211610E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E857881979; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:27:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6dbf3909dd4816230001f0d71dd31d9e96939083
X-Git-Newrev: 631d0289fe880952d9bedf37cc10b043c70c1482
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.E857881979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zxing-cpp: needs wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=631d0289fe880952d9bedf37cc10b043c70c1482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

wchar is mandatory since switch to an active fork in commit
456a7398316655ad0b669635f580e4887c24a700:

In file included from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Result.h:12,
                 from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/GTIN.cpp:9:
/home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Content.h:40:14: error: 'wstring' in namespace 'std' does not name a type
   40 |         std::wstring render(bool withECI) const;
      |              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4f97f1b291a99218f4706fce8b2934bd845755e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 package/zxing-cpp/Config.in                   | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d477924eec..d2ef450d74 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -741,11 +741,13 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
 	bool "zxing"
 	depends on !BR2_STATIC_LIBS # zxing-cpp
+	depends on BR2_USE_WCHAR # zxing-cpp
 	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
 	select BR2_PACKAGE_ZXING_CPP
 
-comment "zxing plugin needs a toolchain w/ C++, dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP
 
 endif
 
diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 2550dcf023..0d8b79538d 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,9 +1,11 @@
-comment "zxing-cpp needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
