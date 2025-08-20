Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3011CA0EED
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF60D83BA4;
	Wed, 20 Aug 2025 16:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvvfAplW-pte; Wed, 20 Aug 2025 16:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A3A82F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A3A82F3D;
	Wed, 20 Aug 2025 16:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCFCA7AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B6F83077
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeE6D94iixUa for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2CE7814B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2CE7814B5
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E366E879C3; Wed, 20 Aug 2025 16:37:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 17:51:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f001f40c8bf74ea7290606ffb9a79daa13f9daac
X-Git-Newrev: 7ae23dc70fba3f0139745b67377a26fd202b96b0
X-Patchwork-Hint: ignore
Message-Id: <20250820163742.E366E879C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-base: security bump
 to version 1.24.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ae23dc70fba3f0139745b67377a26fd202b96b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following vulnerabilities:

- CVE-2025-47806: A stack buffer overflow in the SubRip subtitle parser that
  can cause crashes for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0006.html

- CVE-2025-47807: NULL-pointer dereference in the SubRip subtitle parser
  that can cause crashes for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0002.html
  https://gstreamer.freedesktop.org/security/sa-2025-0003.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 6133825e58..cbe3a00566 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.11.tar.xz.sha256sum
-sha256  98572c1f8b710e52673e250cd96e4f2660d79bd66aa172c5dde5f690c1231e1d  gst-plugins-base-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.13.tar.xz.sha256sum
+sha256  31a4a34e02df0471274fd0e8016495475b670320d20a3349faf0634340166c42  gst-plugins-base-1.24.13.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index f0cf3e8686..456cd205bb 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.24.11
+GST1_PLUGINS_BASE_VERSION = 1.24.13
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
