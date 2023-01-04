Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4191D813B0;
	Wed,  4 Jan 2023 11:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4191D813B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auMEymP7i0-Y; Wed,  4 Jan 2023 11:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4114781276;
	Wed,  4 Jan 2023 11:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4114781276
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52A941BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D7ED60AB5
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7ED60AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhXK-5dOCU56 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5030260A64
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5030260A64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FF6C874A5; Wed,  4 Jan 2023 11:40:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 12:12:14 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 324f3611d316b0ba67d7939635fcd6dff770143e
X-Git-Newrev: 93ac861758fb899582397ad1f538742116925430
X-Patchwork-Hint: ignore
Message-Id: <20230104114043.3FF6C874A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/fmlib: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=93ac861758fb899582397ad1f538742116925430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
same. The version fsl-sdk-v2.0 is an old tag from 2016. It was not
migrated to github. This commit use instead the commit id
corresponding to this tag.

See:
https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmlib/commit/?h=fsl-sdk-v2.0&id=43fa98fdbf0c697167e415c3f060896d5b482791

The commit id exists on github:
https://github.com/nxp-qoriq/fmlib/commit/43fa98fdbf0c697167e415c3f060896d5b482791

Note 2: the _SITE_METHOD is also changed from "git" to the default
"wget", for faster downloads. This is why the package hash has
changed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a94678cfd965ed11a4e2d18d840c03a41c148d6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmlib/Config.in  | 2 +-
 package/fmlib/fmlib.hash | 2 +-
 package/fmlib/fmlib.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 7bccfd7c83..97d55d1250 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_FMLIB
 	  configure driver parameters and PCD (parse - classify -
 	  distribute) rules.
 
-	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
+	  https://github.com/nxp-qoriq/fmlib
 
 if BR2_PACKAGE_FMLIB
 choice
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 47460d091c..d4dcf3be5c 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  59415d346af1d22f510f2785be4c7e3606dc3181476a666e832270550f7d44a6  fmlib-fsl-sdk-v2.0-br1.tar.gz
+sha256  6e9e6bdb42dc2a6a76cfd756a2d4cdfcc2be90925c1f439e8a11eafa871896a6  fmlib-43fa98fdbf0c697167e415c3f060896d5b482791.tar.gz
 sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 8cb779201d..9509f3de56 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v2.0
-FMLIB_SITE = https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmlib
-FMLIB_SITE_METHOD = git
+FMLIB_VERSION = 43fa98fdbf0c697167e415c3f060896d5b482791
+FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
