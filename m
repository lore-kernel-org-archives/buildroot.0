Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA46BC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71432842F2;
	Fri, 16 Sep 2022 11:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71432842F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjq0PaKYbhry; Fri, 16 Sep 2022 11:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 975D8842EE;
	Fri, 16 Sep 2022 11:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 975D8842EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B53DC1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A49B842B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A49B842B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWu8kjPKGqkq for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED84842D2
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED84842D2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC35B83CBA; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:30:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c8ef68cea3bc46cdee4f8345cc915929ca32b601
X-Git-Newrev: 7974339bfa9c2b1a58dab7a6d8a72eca8ac1123d
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.EC35B83CBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/gstreamer1/gst1-plugins-good: drop bogus
 BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
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

commit: https://git.buildroot.net/buildroot/commit/?id=7974339bfa9c2b1a58dab7a6d8a72eca8ac1123d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 'dc7ca780a0 package/gstreamer1/gst1-plugins-good: convert package
type to meson' from 2019 removed the symbol, stating:
  Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
  Existing configs will already have BR2_PACKAGE_ZLIB selected, so no
  legacy entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB

So drop the reference to the symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fa77b1b9f270d09f20ce5f9924dae27d91c7f883)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 61ffc7b989..de7dcb985d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -480,10 +480,6 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavpack=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
-GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dbz2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += bzip2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
