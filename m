Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4CE6103E;
	Wed,  4 Jan 2023 11:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA4CE6103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIDzkJiu8MfM; Wed,  4 Jan 2023 11:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD7060B15;
	Wed,  4 Jan 2023 11:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD7060B15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33A8E1BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BFE40574
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BFE40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFDbYYjZZHXF for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91BF5403F9
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BF5403F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E7F28742D; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 08:46:52 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 328332e6aaafa74fee5cadbf57498a7b0f989253
X-Git-Newrev: ab24990c5554729b48ac395004dd15a899f19f32
X-Patchwork-Hint: ignore
Message-Id: <20230104113933.7E7F28742D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/freescale-imx/imx-lib: update codeaurora URLs to github
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab24990c5554729b48ac395004dd15a899f19f32
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

The commit also:
- removes the comment in Config.in that the package does not have
  an upstream,
- adds the new github.com url as the package url

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8c74c6472b8caf31b34a5a57654ab0c3d18dad36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
