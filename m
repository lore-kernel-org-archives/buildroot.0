Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A1EC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFAF60B15;
	Thu, 29 Dec 2022 19:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFAF60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QDpI8wgPnlS; Thu, 29 Dec 2022 19:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3138260AFB;
	Thu, 29 Dec 2022 19:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3138260AFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3983C1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 151584019D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151584019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bg0y26QaFnXy for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:49:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5CE040181
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5CE040181
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:49:42 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7BD542003DC;
 Thu, 29 Dec 2022 20:49:23 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:08 +0100
Message-Id: <20221229194729.8085-6-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343380;
 bh=IyHQOT0SNunTWtqXz7ylgvntVhiDzCKK4DG3ukUmttg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6aO503NFmCZ2hKFJ9Wth6x0qZ/3htuogjO1gwgIqifHZgTYOnNCfOpkqGHl9vRos
 0JyYS86Gogdix8Z6F9XvDlKORfcnCDq35VIBycglbUH2r01CUZxSGjlkd8iheQM7EF
 AaXU3vGmdaCBEBf5vy/yhms2rhLLp0cYhHPaSTDh2CosTXrVorSfYfPcoTaXPIn87p
 T/kn4KlUPzsMrl9XU9RsyKYmKg/F4lKymrJvxmoqDH4QUbzcI0DHHjV4ILs91HcuCc
 3vEsq2xkxoBjGQ65zF/tWrYdh9wr3fVcdcT+03337qZTOmMCViJ0YBwVYUkmAmbcQD
 GOiwAKM0Txe7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M6aO503N
Subject: [Buildroot] [PATCH 06/27] package/freescale-imx/imx-lib: update
 codeaurora URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP moved all its open source code repositories from Code Aurora Forum
to github. See for example:
https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097

Software packages are now grouped in several NXP github
projects/organizations (nxp-imx, nxp-qoriq, ...). See:
https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB

The NXP code published on Code Aurora is still present (at the time of
this commit) but is no longer receiving updates. It is also expected
to be shut down on 2023-03-31. The Code Aurora website
https://source.codeaurora.org/ currently show the following message:
"""
Note: Qualcomm Innovation Center Inc. maintained repositories have
migrated to git.codelinaro.org. QUIC repositories on this site will
not receive any updates after March 31, 2022, and will be deleted on
March 31, 2023. If your project depends on these repositories, please
adjust your tooling configuration to use the new, up-to-date project
location.
"""

For this reason, the NXP recipes using codeaurora.org urls need to be
updated to the correct github.com replacement.

Note: this commit does not change the component version. Only the
download URL is updated. The archive content is expected to be the
same.

The commit also:
- removes the comment in Config.in that the package does not have
  an upstream,
- adds the new github.com url as the package url

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-lib/Config.in  | 3 +--
 package/freescale-imx/imx-lib/imx-lib.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
index 746788e4c5..0a89bf140f 100644
--- a/package/freescale-imx/imx-lib/Config.in
+++ b/package/freescale-imx/imx-lib/Config.in
@@ -11,5 +11,4 @@ config BR2_PACKAGE_IMX_LIB
 	  platform specific drivers. It requires a kernel that
 	  includes the i.MX specific headers to be built.
 
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
+	  https://github.com/nxp-imx/imx-lib
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 721c20e5f8..f06453e8a6 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_LIB_VERSION = 3f777974c0c146817e2ff5cb0340ca66a1f99e57
-IMX_LIB_SITE = https://source.codeaurora.org/external/imx/imx-lib
+IMX_LIB_SITE = https://github.com/nxp-imx/imx-lib.git
 IMX_LIB_SITE_METHOD = git
 IMX_LIB_LICENSE = LGPL-2.1+
 IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
