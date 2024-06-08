Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AC4C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F297942828;
	Sat,  8 Jun 2024 07:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpDLviZYsOiG; Sat,  8 Jun 2024 07:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDF242834
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDF242834;
	Sat,  8 Jun 2024 07:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF6F1BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B2540154
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqcVbKGie46Z for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E110240165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E110240165
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C81C87D8D; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:26:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 38abde13aa16342a3273dbddd29511f7c474b440
X-Git-Newrev: 976ad4a1c52b7416bdd588e5888066ff66807c40
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.3C81C87D8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zxing-cpp: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=976ad4a1c52b7416bdd588e5888066ff66807c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

threads are mandatory since switch to an active fork in commit
456a7398316655ad0b669635f580e4887c24a700:

CMake Error at /home/buildroot/autobuild/run/instance-1/output-1/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Threads (missing: Threads_FOUND)

Fixes: 456a7398316655ad0b669635f580e4887c24a700
 - http://autobuild.buildroot.org/results/b600582d9c5407c7324af70d61fa5c1f96d929f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c40af98382feda648ff54b8e733eb7307f86164)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
 package/zxing-cpp/Config.in                   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d2c60ec9ce..e85ec16784 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -746,11 +746,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
 	depends on !BR2_STATIC_LIBS # zxing-cpp
 	depends on BR2_USE_WCHAR # zxing-cpp
 	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zxing-cpp
 	select BR2_PACKAGE_ZXING_CPP
 
-comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library"
+comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
 
diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 0d8b79538d..b72a00ec35 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,12 +1,13 @@
-comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library"
+comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
