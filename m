Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C975C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C3E418AD;
	Wed, 10 Jan 2024 15:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C3E418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZWiBtZEO45C; Wed, 10 Jan 2024 15:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6C24175B;
	Wed, 10 Jan 2024 15:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C6C24175B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECD21BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36619415F6
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36619415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpO1f-OdyaeM for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CD84175B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80CD84175B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B75841C4; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:40:04 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9a6a2f9155b84587c62e126b269b34e5b3286420
X-Git-Newrev: f7474d10659cef1e6c48e2e38fa596908f2af09b
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.64B75841C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcamera: use
 udev configure option
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7474d10659cef1e6c48e2e38fa596908f2af09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Use the udev configure option introduced with upstream commit [1] (since
version v0.1.0).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=d314d3b98b86dec9a25ce7b829e72a790b7ead1b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5020985e392907c05a66ab7d12b0406fd74ab023)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8b33b9e708..dd31d90e98 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -98,7 +98,10 @@ LIBCAMERA_DEPENDENCIES += tiff
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCAMERA_CONF_OPTS += -Dudev=enabled
 LIBCAMERA_DEPENDENCIES += udev
+else
+LIBCAMERA_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
