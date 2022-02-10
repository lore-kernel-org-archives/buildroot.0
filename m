Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B64C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 18:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2537D402B1;
	Thu, 10 Feb 2022 18:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ClHWzMoDPuO; Thu, 10 Feb 2022 18:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13B4A4017C;
	Thu, 10 Feb 2022 18:57:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 936141BF407
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81A8982977
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 18:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuciSfxTE1-K for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 18:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02D88291D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:57:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB92D8275E; Thu, 10 Feb 2022 18:50:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 19:54:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da9f2a8fda2a746cd7f387d3335f28be6afd6e37
X-Git-Newrev: 54ee9dc4f88c021f5501a0ae90a5b219736b56f5
X-Patchwork-Hint: ignore
Message-Id: <20220210185001.CB92D8275E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-devtools: drop python2 build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54ee9dc4f88c021f5501a0ae90a5b219736b56f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Looks like this was missed in c4bbd6da50488944debba29e195557e5b345f2b1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 66b509ae2c..9089b12188 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -12,17 +12,13 @@ GST1_DEVTOOLS_LICENSE_FILES = validate/COPYING
 GST1_DEVTOOLS_INSTALL_STAGING = YES
 
 GST1_DEVTOOLS_DEPENDENCIES = \
+	host-python3 \
+	python3 \
 	gstreamer1 \
 	gst1-plugins-base \
 	json-glib \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3
-else
-GST1_DEVTOOLS_DEPENDENCIES += host-python python
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
 GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
