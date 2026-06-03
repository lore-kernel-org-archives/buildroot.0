Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521CBCD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A09442804;
	Wed,  3 Jun 2026 18:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S51cel-zJJug; Wed,  3 Jun 2026 18:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C2642808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512595;
	bh=+mVOoHK7N/8h71IRcwWnhbMwDLqLEP22gYG4OEeYVQM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s6W9Rr69kVE/r42H/QJSINzhLmkR/kKBBM0TA55rdg64a3ZCuNoqh8dXF1o/MUgW5
	 GSxLsUGwjkJNzngpi3YOinMg1YJ3Jg5RBWyAKw7B7nCGoj5L0/fa36Xebptg65ekM6
	 3YlIv/Y2iRjTrTTlIGqWcIV/swUU5WAJ3+hdR5zpOtbfYQRcgDoK9x9oDgm/HJkMyq
	 XocOQ+M2qazNWzORIaIORpP+kr1QVNmy/UlToVzpKsc7tDnQnNRB8HaJDEp1wsVGWg
	 RmE+oJWRgLSjBLNPVydSLiumqXrrVCVzj/Z74JHkdpq75BCizPO308mXx1uGembASC
	 s2pMbYHfKoidg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C2642808;
	Wed,  3 Jun 2026 18:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51C0E192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4056F61AF0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYTD3U4gWbLn for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F88B61798
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F88B61798
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3470387991; Wed,  3 Jun 2026 18:49:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:45:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab03ba7396017b8911944c3089c06c9b68822fbe
X-Git-Newrev: 0c9ccb93275338b5a90cc2278e66790370e2f241
X-Patchwork-Hint: ignore
Message-Id: <20260603184934.3470387991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
 CPE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c9ccb93275338b5a90cc2278e66790370e2f241
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE 'freedesktop:gst-plugins-good' is correct for this package [1].

Also used in conjunction of 'gstreamer:gstreamer', see the package
vulnerability history [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-46470
[2] https://security-tracker.debian.org/tracker/source-package/gst-plugins-good1.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index cd1b9f45b9..1b48d83c8b 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -9,6 +9,8 @@ GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
+GST1_PLUGINS_GOOD_CPE_ID_VENDOR = freedesktop
+GST1_PLUGINS_GOOD_CPE_ID_PRODUCT = gst-plugins-good
 
 GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
