Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C84AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED2B40362;
	Sat, 31 Dec 2022 16:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED2B40362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6HP6TOnCP66; Sat, 31 Dec 2022 16:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E940400;
	Sat, 31 Dec 2022 16:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125E940400
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2527F1BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABC3405D0
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BABC3405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TThAT3bCQUS9 for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB39040327
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB39040327
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A836986F9C; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 153b91ed13174a9013393a8b8eb907a5ff511e58
X-Git-Newrev: 774c39caf093943aa9416c636fe3b2ec31a64e21
X-Patchwork-Hint: ignore
Message-Id: <20221231163500.A836986F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmc: update codeaurora URLs to
 github
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

commit: https://git.buildroot.net/buildroot/commit/?id=774c39caf093943aa9416c636fe3b2ec31a64e21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

This commit also:
- changes the _SITE_METHOD from "git" to the default "wget",
- updates an old and broken freescale.com app note link,
- adds the github project page as project url.

Note: this commit does not change the component version. Only the
download URL is updated. The archive content is expected to be the
same. The version "fsl-sdk-v2.0" is an old tag from 2015. It was not
migrated to github. This commit use instead the commit id
corresponding to this tag.

See:
https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmc/commit/?h=fsl-sdk-v2.0&id=a079d2c844edd85dff85a317a63198e7988bcd09

The commit id exists on github:
https://github.com/nxp-qoriq/fmc/commit/a079d2c844edd85dff85a317a63198e7988bcd09

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fmc/Config.in | 4 +++-
 package/fmc/fmc.hash  | 2 +-
 package/fmc/fmc.mk    | 5 ++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index 4399aa2cab..c89a87c99e 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -21,5 +21,7 @@ config BR2_PACKAGE_FMC
 	  packets flow into hardware configuration. The tool provides an
 	  abstraction layer between the end customer's vision of the PCD
 	  task definition and real hardware implementation.
+	  See application note:
+	  https://www.nxp.com/docs/en/application-note/AN4760.pdf
 
-	  http://cache.freescale.com/files/32bit/doc/app_note/AN4760.pdf
+	  https://github.com/nxp-qoriq/fmc
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index fed33091cd..7309562b09 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cb896ec1fac2fe9a3a9bb8be2221b79acf5f9b75841609a681db0d9e7bec02a0  fmc-fsl-sdk-v2.0-br1.tar.gz
+sha256  e8594e37eb81e5b1f492f8494b98086f65180637b1e2e08d8a4475c23653a404  fmc-a079d2c844edd85dff85a317a63198e7988bcd09.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index b385730138..6ac8c768df 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FMC_VERSION = fsl-sdk-v2.0
-FMC_SITE = https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmc
-FMC_SITE_METHOD = git
+FMC_VERSION = a079d2c844edd85dff85a317a63198e7988bcd09
+FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
 FMC_DEPENDENCIES = libxml2 tclap fmlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
