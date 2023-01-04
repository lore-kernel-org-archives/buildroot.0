Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE964C4708E
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6537381F80;
	Wed,  4 Jan 2023 11:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6537381F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEHJg_mdA6Xz; Wed,  4 Jan 2023 11:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8116A81F60;
	Wed,  4 Jan 2023 11:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8116A81F60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1961BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE53E40891
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE53E40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiOZcOhrujXE for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 762E14088C
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762E14088C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6294C87430; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 08:46:29 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: bb4c7c3faf101162476fba333bbcfd6ac859cdb6
X-Git-Newrev: cfb0d4d0adcf37826b4826be78361f530d310ef2
X-Patchwork-Hint: ignore
Message-Id: <20230104113933.6294C87430@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/freescale-imx/imx-alsa-plugins: update codeaurora URLs to github
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfb0d4d0adcf37826b4826be78361f530d310ef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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

Note 2: the _SITE_METHOD is also changed from "git" to the default
"wget", for faster downloads. This is why the package hash has
changed.

Note 3: this commit also adds the github as project homepage in
Config.in.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1ed90a96aa1f11fed19045036b4a10d9a8263a98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-alsa-plugins/Config.in             | 2 ++
 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash | 2 +-
 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk   | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-alsa-plugins/Config.in b/package/freescale-imx/imx-alsa-plugins/Config.in
index ec9b5b19cf..df47edd16d 100644
--- a/package/freescale-imx/imx-alsa-plugins/Config.in
+++ b/package/freescale-imx/imx-alsa-plugins/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_IMX_ALSA_PLUGINS
 	    * Rate Converter Plugin Using Freescale ASRC Hardware
 	      Resampler (i.MX53 and most i.MX6)
 
+	  https://github.com/nxp-imx/imx-alsa-plugins
+
 comment "imx-alsa-libs needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
index bb7beede9d..1ca7697f03 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a9a5ef408a7329c2c5fa2a084ae7824afbfbebed68612bd72509488ccb0b94b3  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga-br1.tar.gz
+sha256  089bba009f82bf5e4a1e34b77a7d3badce2948619d92bec7a7ad42e766442d4c  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
index 9c81ff0df0..912cc7c68b 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 IMX_ALSA_PLUGINS_VERSION = rel_imx_4.9.x_1.0.0_ga
-IMX_ALSA_PLUGINS_SITE = https://source.codeaurora.org/external/imx/imx-alsa-plugins
-IMX_ALSA_PLUGINS_SITE_METHOD = git
+IMX_ALSA_PLUGINS_SITE = $(call github,nxp-imx,imx-alsa-plugins,$(IMX_ALSA_PLUGINS_VERSION))
 IMX_ALSA_PLUGINS_LICENSE = GPL-2.0+
 IMX_ALSA_PLUGINS_LICENSE_FILES = COPYING.GPL
 IMX_ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
