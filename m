Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA7C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F1342A54;
	Mon, 20 Feb 2023 21:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F1342A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7G6ctr2xVbHn; Mon, 20 Feb 2023 21:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667BA40285;
	Mon, 20 Feb 2023 21:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667BA40285
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2DF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76EB2822EA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76EB2822EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOmW9aYiwiZW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90BC1822E9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BC1822E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EE028648F; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a03e57ccbf432f73275869cf9a3e6a7a234cb5de
X-Git-Newrev: a019e5e460f0d85b0b44163ba80be7cd6a53738a
X-Patchwork-Hint: ignore
Message-Id: <20230220205220.7EE028648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qoriq-rcw: update
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a019e5e460f0d85b0b44163ba80be7cd6a53738a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qoriq-rcw/Config.in.host | 2 +-
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qoriq-rcw/Config.in.host b/package/qoriq-rcw/Config.in.host
index 08fc83acd0..58c16d495b 100644
--- a/package/qoriq-rcw/Config.in.host
+++ b/package/qoriq-rcw/Config.in.host
@@ -9,7 +9,7 @@ config BR2_PACKAGE_HOST_QORIQ_RCW
 	  $(HOST_DIR)/share/rcw. Either a SDK or post scripts can
 	  then use this toolset and examples.
 
-	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
+	  https://github.com/nxp-qoriq/rcw
 
 if BR2_PACKAGE_HOST_QORIQ_RCW
 
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index f34c771d11..2a887d57d4 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  caa6802f2ba5ea92fd27e7c977749010a91c9091fcc3fe626f96d9cacfba1f0a  qoriq-rcw-LSDK-21.08-br1.tar.gz
+sha256  f199c10e50bd18d7bed0d60f5b68194240dea4f1aa164cec98332723727a4796  qoriq-rcw-LSDK-21.08.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 0501c36f46..8b1ceacfce 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 QORIQ_RCW_VERSION = LSDK-21.08
-QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
-QORIQ_RCW_SITE_METHOD = git
+QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
