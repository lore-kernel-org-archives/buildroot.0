Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62EBC28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7102360C00;
	Wed, 26 Jan 2022 12:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02Aj0Voz-0jk; Wed, 26 Jan 2022 12:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71F360F44;
	Wed, 26 Jan 2022 12:50:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7051BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36DFC40132
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xe96Ax4u-vpU for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 12:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64467405AD
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:50:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0EF282829; Wed, 26 Jan 2022 12:43:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 13:34:53 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 11fbee06c3bfa53f9194b7c115570ed3877e1565
X-Git-Newrev: 6d9f754a5bf92d008469b0f281bfd9fe139ed218
X-Patchwork-Hint: ignore
Message-Id: <20220126124312.C0EF282829@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/gstreamer1/gst1-plugins-bad: add missing Config.in comment on udev
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d9f754a5bf92d008469b0f281bfd9fe139ed218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS option has a
dependency on BR2_PACKAGE_HAS_UDEV, but no Config.in comment was added
about this dependency. This commit addresses that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 029a3c3ed7d84f26e7f2d5726aeb46af797fda5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 239a45bb63..f9f9aed486 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -665,6 +665,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
 	help
 	  Video4Linux Stateless CODECs support
 
+comment "v4l2codecs need udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
