Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D0CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7272D41196;
	Fri, 12 Jun 2026 11:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rxAS1-GWDx5; Fri, 12 Jun 2026 11:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A82411BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263374;
	bh=iOISxWNeBMSpOe7ugIc4D4KsZq7nSoP0dZFW9yaa/DY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rLCp7wttPoBmxMpTe0bKjOZDCJ7fk1fZjIMzRDzBI4UkJG3Lqbvf4cP0bEjKDPk+W
	 LockNouSdbF7WyyrrsXknpi/ekDbuS1d+Mai7CCqjNrNxjPLmhtd1Wu34wdaKfWKIC
	 F0g6YiqAH38LO+bQ+pylPnL/DliZLAdydrSeecCp+szXGgQXV91zT1mDRAbaESvKT4
	 UNRyPQm5sMByTakpAwR0xnSxLqC8A2L/d5YtbjUHyJyL6J/HonyplMwtQ7b1Qlh7gF
	 SJCmqDimFByqfINi4Lru2X0lWtY5Z83tOuXwp8gEVgFXVJlLNlS6fP8ypyKU6KCi6D
	 vDc+aeSeRBa5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A82411BA;
	Fri, 12 Jun 2026 11:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6BB237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2177160EF8
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd8O-7YwM0gR for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E33060F22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E33060F22
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFDA1880DE; Fri, 12 Jun 2026 11:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:40:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 101957026e7f3dbecbf662a71ceb08c147f40078
X-Git-Newrev: 6e7d2d44fea7223b202e4f49b9df5eb9b5ed0941
X-Patchwork-Hint: ignore
Message-Id: <20260612112209.EFDA1880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/gstreamer1/gst1-plugins-good: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e7d2d44fea7223b202e4f49b9df5eb9b5ed0941
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE 'freedesktop:gst-plugins-good' is correct for this package [1].

Also used in conjunction of 'gstreamer:gstreamer', see the package
vulnerability history [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-46470
[2] https://security-tracker.debian.org/tracker/source-package/gst-plugins-good1.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c9ccb93275338b5a90cc2278e66790370e2f241)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
