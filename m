Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0ECD6E4F
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 09:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A43417E7;
	Wed, 11 Oct 2023 09:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A43417E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKD0ua4YWqCF; Wed, 11 Oct 2023 09:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A92B4188E;
	Wed, 11 Oct 2023 09:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A92B4188E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC7B1BF362
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1FED61021
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1FED61021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EP2F3GWSkXqi for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F0D560FE9
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0D560FE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CE5684524; Wed, 11 Oct 2023 09:04:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 11:00:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40c3696131a2b93ea3da2556352dc79c19ac2e9c
X-Git-Newrev: 19fe76b8b4dd09bd11fce6832932cd799332ffb5
X-Patchwork-Hint: ignore
Message-Id: <20231011090437.0CE5684524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: security bump to
 version 1.22.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=19fe76b8b4dd09bd11fce6832932cd799332ffb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2023-37329: Heap-based buffer overflow in the PGS blu-ray subtitle
decoder when handling certain files in GStreamer versions before 1.22.4 /
1.20.7.

https://gstreamer.freedesktop.org/security/sa-2023-0003.html

CVE-2023-40474: Heap-based buffer overflow in the MXF file demuxer when
handling malformed files with uncompressed video in GStreamer versions
before 1.22.6.

https://gstreamer.freedesktop.org/security/sa-2023-0006.html

CVE-2023-40475: Heap-based buffer overflow in the MXF file demuxer when
handling malformed files with AES3 audio in GStreamer versions before
1.22.6.

https://gstreamer.freedesktop.org/security/sa-2023-0007.html

CVE-2023-40476: Stack-based buffer overflow in the H.265 video parser when
handling malformed H.265 video streams in GStreamer versions before 1.22.6.

https://gstreamer.freedesktop.org/security/sa-2023-0008.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 2bbb8af904..c6d1f2e009 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.2.tar.xz.sha256sum
-sha256  3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f  gst-plugins-bad-1.22.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.6.tar.xz.sha256sum
+sha256  b4029cd2908a089c55f1d902a565d007495c95b1442d838485dc47fb12df7137  gst-plugins-bad-1.22.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 1713f0b4b8..983be754e9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.22.2
+GST1_PLUGINS_BAD_VERSION = 1.22.6
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
