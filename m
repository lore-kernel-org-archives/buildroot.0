Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD9C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02918148A;
	Wed,  8 Feb 2023 12:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02918148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceRNCgjZL9Vl; Wed,  8 Feb 2023 12:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B8781403;
	Wed,  8 Feb 2023 12:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B8781403
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8981BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A034067F
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A034067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUEqonkKNZss for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:24:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA3940632
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA3940632
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29C4484639; Wed,  8 Feb 2023 12:24:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:24:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 456a7398316655ad0b669635f580e4887c24a700
X-Git-Newrev: 11b2ab5ee261e8af1065f15e2e69290e15e9e4ea
X-Patchwork-Hint: ignore
Message-Id: <20230208122444.29C4484639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 zxing plugin support
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

commit: https://git.buildroot.net/buildroot/commit/?id=11b2ab5ee261e8af1065f15e2e69290e15e9e4ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 9 +++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1e89cd124f..d477924eec 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -738,6 +738,15 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
+	bool "zxing"
+	depends on !BR2_STATIC_LIBS # zxing-cpp
+	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
+	select BR2_PACKAGE_ZXING_CPP
+
+comment "zxing plugin needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+
 endif
 
 comment "gst1-plugins-bad needs a toolchain w/ C++"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index dfe1f1c9eb..edac818985 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -70,7 +70,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dwasapi2=disabled \
-	-Dzxing=disabled \
 	-Dmagicleap=disabled \
 	-Disac=disabled \
 	-Diqa=disabled \
@@ -812,6 +811,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += zxing-cpp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=disabled
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dgpl=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
