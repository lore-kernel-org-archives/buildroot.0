Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22EEC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D0B081EBA;
	Mon, 20 Feb 2023 23:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D0B081EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PM1fInN5sjG0; Mon, 20 Feb 2023 23:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F1F83521;
	Mon, 20 Feb 2023 23:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F1F83521
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8451BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF06B61AFE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF06B61AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qcc840nGEL7J for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C335D61AD7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C335D61AD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B50548648F; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: faa8c35d117348f35c129c62a3d02447f47bde88
X-Git-Newrev: 153b91ed13174a9013393a8b8eb907a5ff511e58
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.B50548648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/imx-mkimage: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=153b91ed13174a9013393a8b8eb907a5ff511e58
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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/imx-mkimage/Config.in.host   | 2 +-
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/imx-mkimage/Config.in.host b/package/imx-mkimage/Config.in.host
index 8d273557a1..09df2a3c29 100644
--- a/package/imx-mkimage/Config.in.host
+++ b/package/imx-mkimage/Config.in.host
@@ -4,4 +4,4 @@ config BR2_PACKAGE_HOST_IMX_MKIMAGE
 	  imx-mkimage is used to combine input images and generate
 	  final boot image with appropriate IVT set.
 
-	  https://source.codeaurora.org/external/imx/imx-mkimage
+	  https://github.com/nxp-imx/imx-mkimage
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 81d99a5d1c..8346fd64b1 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  769b3d7376a1f7107ce2958a1babe361bfd29e2cbfbe47eeb2911acc460058e5  imx-mkimage-lf-5.10.72_2.2.0-br1.tar.gz
+sha256  593bd94aac027844bc58c62aae55557c14e1f8a99e68ba235a46f083759df3d4  imx-mkimage-lf-5.10.72_2.2.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 0bfca72504..54c948e0d3 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 IMX_MKIMAGE_VERSION = lf-5.10.72_2.2.0
-IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
-IMX_MKIMAGE_SITE_METHOD = git
+IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = COPYING
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
