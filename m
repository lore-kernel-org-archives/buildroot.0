Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE78C600CD
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE78C600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77013405C6;
	Wed, 17 Nov 2021 15:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5R07kZaF5Kki; Wed, 17 Nov 2021 15:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82CA34048E;
	Wed, 17 Nov 2021 15:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 286A11BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2575D60670
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_c_d6T4Dnbt for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 764E760605
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 100E08D47D; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:01:32 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 3934f1ec89a77e916e0f862ae9c6008fadbd32fc
X-Git-Newrev: ca4ef6b4fe8382b3e7194008affddbbe290db665
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.100E08D47D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/freescale-imx/gpu-amd-bin-mx51: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca4ef6b4fe8382b3e7194008affddbbe290db665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override GPU_AMD_BIN_MX51_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7c9e88120d9545696afd5ff20f6422542811e4e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
