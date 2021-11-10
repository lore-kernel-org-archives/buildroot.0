Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03013C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7952961105
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7952961105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B632608EB;
	Wed, 10 Nov 2021 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xlaftc-orlC1; Wed, 10 Nov 2021 09:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B865B608E2;
	Wed, 10 Nov 2021 09:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4621BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BEA080EDD
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2mHdp64_NSx for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F11C80EF3
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B5E168B886; Wed, 10 Nov 2021 09:36:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 10:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e86c81418f681bce5d6507ee016d7786e048af0
X-Git-Newrev: 7c9e88120d9545696afd5ff20f6422542811e4e1
X-Patchwork-Hint: ignore
Message-Id: <20211110093634.B5E168B886@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/gpu-amd-bin-mx51:
 don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c9e88120d9545696afd5ff20f6422542811e4e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override GPU_AMD_BIN_MX51_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index 5586073712..c99c568f73 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -12,7 +12,7 @@ GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
 else
 GPU_AMD_BIN_MX51_VERSION = $(GPU_AMD_BIN_MX51_BASE_VERSION)-x11
 GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
-GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
+GPU_AMD_BIN_MX51_DEPENDENCIES += libxcb xlib_libX11 xlib_libXext \
 	xlib_libXrender xlib_libXau xlib_libXdmcp
 endif
 GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
