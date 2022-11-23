Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2BFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29EF5610A4;
	Wed, 23 Nov 2022 22:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29EF5610A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAWNQnm5ZZWD; Wed, 23 Nov 2022 22:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C5460E37;
	Wed, 23 Nov 2022 22:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C5460E37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5351BF316
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7757417C3
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7757417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBrd1gfIVsR7 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:34:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFFF6417BF
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFFF6417BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB129844B2; Wed, 23 Nov 2022 22:34:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:33:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8c63011e2b0c54e0a17171b668bfcb253954481
X-Git-Newrev: 1692691e45fcaaad9572330fb9f7b35b72ad0854
X-Patchwork-Hint: ignore
Message-Id: <20221123223437.AB129844B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-vpu-hantro-daemon: remove _SOURCE variable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1692691e45fcaaad9572330fb9f7b35b72ad0854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The value of the _SOURCE variable is the default value for this
variable, making its definition redundant.

Fixes:

package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk:9: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

https://gitlab.com/buildroot.org/buildroot/-/jobs/3371766926

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index bf9088b065..4f6f166b60 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -6,7 +6,6 @@
 
 IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.4
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
-IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
 IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
