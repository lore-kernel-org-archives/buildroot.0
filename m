Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38DEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C96610D2
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01C96610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF02404E6;
	Fri, 15 Oct 2021 08:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YX0DBXw3kMmc; Fri, 15 Oct 2021 08:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE92404D2;
	Fri, 15 Oct 2021 08:16:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B414F1BF334
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B130482F37
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzrByWf4zR4I for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 08:16:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7704982EB5
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 08:16:04 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bINmmNKmdiqGsbINnmEBJh; Fri, 15 Oct 2021 10:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634285763; bh=wIJeCHjr8kkipH7m6EHiLX5W3vI+1ZNgIQ+K8nmmPlI=;
 h=From:To:Subject:Date:MIME-Version;
 b=QNO+NNtSERWorXeyBLF2a8AzaHk8UHNNpwmoZtIeb8nMn9IKwIrIcIvlNBSF+xhF9
 mtS/38LWfQctIl6/7kLR0eZhJvnQmbB+O023MNS9Nty240BpDweW3zRfAcvC94RTfh
 znxbVT9DbkkIb0W2DejvssP1xvTsh+JfL3sdDnVcGObIEifllZ5438WC61SK80MDMI
 lhHrgwgIwJrTQCzuf/bFIuH2+JnjxtFAaupZXt+irfwpliXgJquLVZqh81cm9bTL5q
 q7L+LYV1SzfphwO1WxY63UA3Uhvx0RdvpCcNXZFew1gE8I22kUEEoYEfKlTtUW9+up
 fi8JIoCORnPfg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 10:16:01 +0200
Message-Id: <20211015081601.2472850-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <be4f2e4a-4068-6467-27fa-df96969f1049@benettiengineering.com>
References: <be4f2e4a-4068-6467-27fa-df96969f1049@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMHfXCk/x2ZuGJUP9PcrJB0OwOut+0Qjhy1fHk43DUpbqvKBHlG2eDEavNGm2y+1svZ7hWwoTUIotV9poMX3Ih8o1ppf2vxshaMhoY8VET+27BvtCsbE
 vYF1lebt8ZgFhzIFh+AtPSEUqM2d7BdryjuOW2oKtcCFKrYPQW/a2EjSD/kymnWJWVRi5O6urITCJp3c82bkw9xdRL4pdA2YgpTncDPXQ+bM5TfFf2OSzHIT
 QJhHvSVmjXKc+h/sPOrqaFrNWGzaBh2u+vRLmpIl2xE=
Subject: [Buildroot] [PATCH v2] package/sunxi-mali-mainline-driver: update
 help section to make it work on Linux >= 4.20
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Linux version >= 4.20 in order to have mali working we need to pass
drm_kms_helper.drm_leak_fbdev_smem=1 and at least
drm_kms_helper.drm_fbdev_overalloc=200 to have a double buffer fbdev.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add double buffer too
---
 package/sunxi-mali-mainline-driver/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 5db66c5bf6..bd6819cf82 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -25,5 +25,11 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	  starting from Linux Kernel >= 4.20 following options must be
 	  enabled:
 	  - CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
+	  and following kernel command-line must be passed:
+	  `drm_kms_helper.drm_leak_fbdev_smem = 1`
+	  since drm_kms_helper.drm_leak_fbdev_smem is set to 0 by default
+	  `drm_kms_helper.drm_fbdev_overalloc >= 200`
+	  since the driver requires at least double buffering and fails to
+	  work with the default value(100).
 
 	  https://github.com/mripard/sunxi-mali/blob/master/README.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
