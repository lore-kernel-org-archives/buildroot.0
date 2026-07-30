Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54CBC55171
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CCF260A75;
	Thu, 30 Jul 2026 21:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1LQtWEtY2KD; Thu, 30 Jul 2026 21:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C8E26064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446404;
	bh=3uY4ZlcrNsZpLyiNdE9CMAkg1kqM57FlqNpAED44p28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fFqioAZyb0m1278xXNic1OOzqALkY8DN6Bx1bSGlosTt52VUEpAA724dZSGyK25m1
	 v0QgrbeVT3zPd5x+J5OAOtxdImJNiHCpCvuEQ8vC+7Hd/UKxYfd5VsYDar0/V+fdSq
	 loINVhZEu6Kw6VDpNeztmLBVEokHCpjcYWRo1neNCVZThs55Qkgr4oOxUoH8I6BDRF
	 Lnc/Tlf5AqROX7HtdcsKg2+mabliotcOif6wrKYbjqdG476ZhvyVun4VALCbKNKetY
	 s2Bd4aXXA0qcF22nw7xJYTFFZqW52xaHnbdmuL9ul94qTPmHJf8a0nzddIse2X4ycW
	 VaX3ElkX2Lc7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C8E26064F;
	Thu, 30 Jul 2026 21:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0410742A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D57C6606A7
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KAl_2-PC8Ym for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7AA608AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D7AA608AA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 455A08B651; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af7e1b1ca81a88f47771556fee7812c8bd726ac8
X-Git-Newrev: 2e2b38c890cc73dff6b9e79093df644042d14e87
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.455A08B651@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.8.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9133442226361801450=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9133442226361801450==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e2b38c890cc73dff6b9e79093df644042d14e87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash    | 2 +-
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index 61f7f38462..e6a94b2848 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e7806a92d4a5ab51b76d9edef5175a95625c4ac3cab467fe1519bb0ce16e6535  imx-vpu-hantro-daemon-1.5.0-3200e68.tar.gz
+sha256  4d0a6bb06c671cf0091dd3c756cfc36e381ffaa7777b216e28625d5368930c93  imx-vpu-hantro-daemon-1.8.0-6d3ec73.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
 sha256  c61176048f74950c0849d91b4b6b30e335e050462a8950b89a4e6f35c7fe577b  SCR-imx-vpu-hantro-daemon.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index cb0a078078..2b3d0426f9 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.5.0
-IMX_VPU_HANTRO_DAEMON_REVISION = 3200e68
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.8.0
+IMX_VPU_HANTRO_DAEMON_REVISION = 6d3ec73
 IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION)-$(IMX_VPU_HANTRO_DAEMON_REVISION).tar.gz
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement

--===============9133442226361801450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9133442226361801450==--
