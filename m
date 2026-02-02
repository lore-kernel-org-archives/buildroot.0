Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E9CE7316D
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA7540B11;
	Mon,  2 Feb 2026 13:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fw6IrPcYSpBu; Mon,  2 Feb 2026 13:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0ED40817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770039015;
	bh=R4bR2A+DfgKFpF36xAGnfitJ/FpMHhrx1UuZoOM+A+k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m03yRTD/VydkPyp20bwgIK8KfL94M4NES54amXm0QfNXJHmemcGDF7yolz40++sPj
	 ngjgLtNjKTUaKswGIOv+zpgQ+Miu0FdXrCCaYp+abZ/iabZzk8oNlOWXk4yZDSbU8z
	 nxevnDefqyGV1zj7e/zVyPxWOr4+uG+QrabcvLTGQv8RpFBMj3IxDeMyYc4rOF84S5
	 VX34dZD+kC4f9ASUKAAtAxX/CFU4FAndU4lcii7ZcymEtzkI+zTgi7m+tjCG1P4S38
	 h7sPD+in18RyhX0AufiIXvZ7gNN06yl5LSEAYOLJn3I64+y2fGni0uTJNuHNIKTAWK
	 0ZKZ9II3VpnRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0ED40817;
	Mon,  2 Feb 2026 13:30:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A491E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9E5860B46
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsVqdY-xEppP for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B6A60B0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03B6A60B0B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:30:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECD908632F; Mon,  2 Feb 2026 13:30:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 14:25:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb800d3c63fe91628f42ce749c211ebef278628
X-Git-Newrev: 926381d360082e926cb6be28cb1e97639d26ea0f
X-Patchwork-Hint: ignore
Message-Id: <20260202133012.ECD908632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picotool: Add host-picotool
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

commit: https://git.buildroot.net/buildroot/commit/?id=926381d360082e926cb6be28cb1e97639d26ea0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a host-picotool package to picotool.
This will allow users to build rpi pico applications on the host system.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picotool/picotool.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index b27f5d8dc3..bca9489665 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -6,9 +6,14 @@
 
 PICOTOOL_VERSION = 2.2.0-a4
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
-PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
-PICOTOOL_DEPENDENCIES = libusb pico-sdk
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
 
+PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
+PICOTOOL_DEPENDENCIES = libusb pico-sdk
+
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
