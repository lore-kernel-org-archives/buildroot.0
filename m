Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24957C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1320813EA;
	Sun, 12 Feb 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1320813EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9tTzFZczsS9; Sun, 12 Feb 2023 20:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C73813C5;
	Sun, 12 Feb 2023 20:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C73813C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDF8F1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4B49813BD
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4B49813BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqBUVVw--AWc for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093E5813B9
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093E5813B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC4138578B; Sun, 12 Feb 2023 20:29:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:27:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dbf3909dd4816230001f0d71dd31d9e96939083
X-Git-Newrev: 631d0289fe880952d9bedf37cc10b043c70c1482
X-Patchwork-Hint: ignore
Message-Id: <20230212202900.EC4138578B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zxing-cpp: needs wchar
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
