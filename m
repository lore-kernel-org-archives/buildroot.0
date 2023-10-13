Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9185CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F0F140CAA;
	Fri, 13 Oct 2023 18:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0F140CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm1SuJ56jAC8; Fri, 13 Oct 2023 18:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D6F94188A;
	Fri, 13 Oct 2023 18:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D6F94188A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7C31BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B0FA40CAA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0FA40CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8ppVBlRyZB6 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485BA4180A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 485BA4180A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37FBE84FC9; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:16:59 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6aa971dffb4e5d1b853be7f1623f72cbec72dd63
X-Git-Newrev: 0284e84d46ad78b2aa3fab3c84467a496d4e9c2e
X-Patchwork-Hint: ignore
Message-Id: <20231013184633.37FBE84FC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/gst1-plugins-good: security bump to version 1.22.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=0284e84d46ad78b2aa3fab3c84467a496d4e9c2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes CVE-2023-37327: Heap-based buffer overflow in the FLAC parser when
handling malformed image tags in GStreamer versions before 1.22.4 / 1.20.7.

https://gstreamer.freedesktop.org/security/sa-2023-0001.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 40c3696131a2b93ea3da2556352dc79c19ac2e9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 604e74b57d..1b315ac1cc 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.2.tar.xz.sha256sum
-sha256  7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd  gst-plugins-good-1.22.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.6.tar.xz.sha256sum
+sha256  b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817  gst-plugins-good-1.22.6.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bbcd3aecab..cfe1a55f31 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.2
+GST1_PLUGINS_GOOD_VERSION = 1.22.6
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
