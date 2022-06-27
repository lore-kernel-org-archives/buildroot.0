Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B0C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D5360736;
	Mon, 27 Jun 2022 21:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D5360736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rS7Xcb2lOhOl; Mon, 27 Jun 2022 21:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAF060C0A;
	Mon, 27 Jun 2022 21:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CAF060C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4F41BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB39F404BB
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB39F404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xgzHt04XSJH for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:37:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F554050C
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F554050C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8DAE38763B; Mon, 27 Jun 2022 21:25:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:37:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1a2a28460ad1c868e0ae1508d6fe484b19abcd5
X-Git-Newrev: ce4a549dbe1e865b70dc4493ebbe1bc9ff5ffc8e
X-Patchwork-Hint: ignore
Message-Id: <20220627212513.8DAE38763B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-good: security bump
 to version 1.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce4a549dbe1e865b70dc4493ebbe1bc9ff5ffc8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- avidemux: Fix integer overflow resulting in heap corruption in DIB buffer
  inversion code
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2609

- matroskademux: Avoid integer-overflow resulting in heap corruption in
  WavPack header handling code
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2613

- matroskademux, qtdemux: Fix integer overflows in zlib/bz2/etc
  decompression code
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2611

- smpte: Fix integer overflow with possible heap corruption in GstMask
  creation
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2605

- smpte: integer overflow with possible heap corruption in GstMask creation
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1231

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index cccd07dd2d..81da41388f 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.1.tar.xz.sha256sum
-sha256  3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa  gst-plugins-good-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz.sha256sum
+sha256  f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7  gst-plugins-good-1.20.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 2b6cf769aa..61ffc7b989 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.20.1
+GST1_PLUGINS_GOOD_VERSION = 1.20.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
