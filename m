Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC5CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF15A401D8;
	Fri, 13 Oct 2023 18:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF15A401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxBafwwLhyj1; Fri, 13 Oct 2023 18:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 923A24190C;
	Fri, 13 Oct 2023 18:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 923A24190C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B56B51BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2273B6F67E
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2273B6F67E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB1O-K1_kfBp for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F14A6F666
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F14A6F666
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45CB084FC8; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:17:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0284e84d46ad78b2aa3fab3c84467a496d4e9c2e
X-Git-Newrev: b1e2cd3e25f9f1d96d932ee1a17a8285cb58f2cd
X-Patchwork-Hint: ignore
Message-Id: <20231013184633.45CB084FC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gst1-plugins-bad:
 security bump to version 1.22.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1e2cd3e25f9f1d96d932ee1a17a8285cb58f2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 19fe76b8b4dd09bd11fce6832932cd799332ffb5)
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
