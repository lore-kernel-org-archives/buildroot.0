Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D5CC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD1340A8C;
	Thu, 12 Jun 2025 20:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9WEWlND51d5; Thu, 12 Jun 2025 20:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB6440AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AB6440AAC;
	Thu, 12 Jun 2025 20:12:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F47A27A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F1383C13
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLN_wWnD4W5m for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D2783BE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D2783BE9
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 184B983563; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:41:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff8c9c5897243348dc090b6446cc3241ad1ecff0
X-Git-Newrev: 776bbc3d1c07a58092434f6c9c6ec04fef402fda
X-Patchwork-Hint: ignore
Message-Id: <20250612201230.184B983563@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/gstreamer1/gst1-plugins-bad: webrtc needs sync_4
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

commit: https://git.buildroot.net/buildroot/commit/?id=776bbc3d1c07a58092434f6c9c6ec04fef402fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit [1] "package/gstreamer1/gst1-plugins-bad: bump version
to 1.24.11" added new requirements for webrtc which selects the
sctp plugin, but forgot to propagate its dependencies. The sctp
plugin depends on BR2_TOOLCHAIN_HAS_SYNC_4.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP
      Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
      Selected by [y]:
      - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && !BR2_STATIC_LIBS [=n]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/90b3cfedf44cc92289746aa30e439be409ca3747

Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e34a113b32bec1c4713cdd3500ea47490fb11a71)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 4c4e993714..89db860f87 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -659,6 +659,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 	bool "webrtc"
 	depends on !BR2_STATIC_LIBS # libnice -> gnutls
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gst1-plugins-bad sctp
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # libgstsdp
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
@@ -669,6 +670,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 
 comment "webrtc needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	bool "webrtcdsp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
