Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD4CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:27:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EB660C49
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8EB660C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B9AE8295A;
	Wed, 13 Oct 2021 18:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CMfaMZbnYI7; Wed, 13 Oct 2021 18:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08DE1826A4;
	Wed, 13 Oct 2021 18:27:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 317021BF9C2
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213BB60D56
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTo66d9-qvsA for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA9D60BA7
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CCC0B958EC; Wed, 13 Oct 2021 18:24:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a
X-Git-Newrev: ddafea9c80bd0d7faa53f14a7755fdf126a7456a
X-Patchwork-Hint: ignore
Message-Id: <20211013182444.CCC0B958EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-util: Update help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddafea9c80bd0d7faa53f14a7755fdf126a7456a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DFU 1.1 specification is also supported.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
