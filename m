Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2B7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4928883F82;
	Mon, 15 Aug 2022 09:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4928883F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 158ZqQM6at0c; Mon, 15 Aug 2022 09:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6416183F4A;
	Mon, 15 Aug 2022 09:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6416183F4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6651BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0FDF40A97
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0FDF40A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMlBxryHT9xi for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C4B40AE2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C4B40AE2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EC0CF875A8; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ddff6d76043e47ea6104debb601438b8a7e7078
X-Git-Newrev: fa77b1b9f270d09f20ce5f9924dae27d91c7f883
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.EC0CF875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: drop
 bogus BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa77b1b9f270d09f20ce5f9924dae27d91c7f883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 'dc7ca780a0 package/gstreamer1/gst1-plugins-good: convert package
type to meson' from 2019 removed the symbol, stating:
  Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
  Existing configs will already have BR2_PACKAGE_ZLIB selected, so no
  legacy entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB

So drop the reference to the symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
