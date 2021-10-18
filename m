Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1732FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E54B60EE9
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E54B60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F406440407;
	Mon, 18 Oct 2021 12:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_CM__mVx2Sd; Mon, 18 Oct 2021 12:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05C3D403D1;
	Mon, 18 Oct 2021 12:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7801BF27C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C229405E0
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZiv4VNfmPGF for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 753604049A
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D289B86AE8; Mon, 18 Oct 2021 12:44:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 14:45:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6f039073f21446cfa088e2bf687e4a82cb0f71d3
X-Git-Newrev: 8fe1f626531ec7b4a5fae97d54f9f45afc06cfcd
X-Patchwork-Hint: ignore
Message-Id: <20211018124423.D289B86AE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dfu-util: Update
 help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fe1f626531ec7b4a5fae97d54f9f45afc06cfcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

DFU 1.1 specification is also supported.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ddafea9c80bd0d7faa53f14a7755fdf126a7456a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dfu-util/Config.in      | 7 ++++---
 package/dfu-util/Config.in.host | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
index 71c1a1687c..2eddbf0521 100644
--- a/package/dfu-util/Config.in
+++ b/package/dfu-util/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_DFU_UTIL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
-	  Dfu-util is the host side implementation of the DFU 1.0
-	  specification of the USB forum. DFU is intended to download
-	  and upload firmware to devices connected over USB.
+	  Dfu-util is the host side implementation of the DFU 1.0 and
+	  DFU 1.1 specification of the USB forum.
+	  DFU is intended to download and upload firmware to devices
+	  connected over USB.
 
 	  http://dfu-util.sourceforge.net/
 
diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
index 1bf9275f97..5ce0da0372 100644
--- a/package/dfu-util/Config.in.host
+++ b/package/dfu-util/Config.in.host
@@ -2,9 +2,10 @@ config BR2_PACKAGE_HOST_DFU_UTIL
 	bool "host dfu-util"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
 	help
-	  Dfu-util is the host side implementation of the DFU 1.0
-	  specification of the USB forum. DFU is intended to download
-	  and upload firmware to devices connected over USB.
+	  Dfu-util is the host side implementation of the DFU 1.0 and
+	  DFU 1.1 specification of the USB forum.
+	  DFU is intended to download and upload firmware to devices
+	  connected over USB.
 
 	  http://dfu-util.sourceforge.net/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
