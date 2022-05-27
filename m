Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEADC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCBF4281A;
	Fri, 27 May 2022 08:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1Qt2CPv5Hjt; Fri, 27 May 2022 08:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1312425EC;
	Fri, 27 May 2022 08:12:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C95C61BF302
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110DD412EE
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFlGbbXiSBrT for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AD04412F0
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B5A0865C5; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:04:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: eec52042a9ae246966c54f41b42ee8381f332814
X-Git-Newrev: 544f03b0f8c771dc42202a8c09de995d19934c71
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.8B5A0865C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/gstreamer1/gst1-plugins-good: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=544f03b0f8c771dc42202a8c09de995d19934c71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit 34317969278d7b6d923d4889fb4235f112b2b201:

../ext/soup/gstsouploader.c: In function 'gst_soup_load_library':
../ext/soup/gstsouploader.c:219:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (guint i = 0; i < len; i++) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/21792a9839d9722815075569123df8747fc450e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 288353ec746d91dd84e6abe76bf424909db82d1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1168feb293..2b6cf769aa 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -10,6 +10,7 @@ GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
