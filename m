Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA66C3DA7D
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 196E4401F3;
	Thu, 29 Dec 2022 19:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 196E4401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wytt6POpBRjb; Thu, 29 Dec 2022 19:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E1B40235;
	Thu, 29 Dec 2022 19:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E1B40235
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A17DC1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 881564089B
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881564089B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ziH9-7Q9oqZ for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F8644088C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F8644088C
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:48:50 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8C3C22003C1;
 Thu, 29 Dec 2022 20:48:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:05 +0100
Message-Id: <20221229194729.8085-3-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343328;
 bh=CKe70LO2cB3M+rTTbVnhLDGYn8nBxsG0J+rtIkZTK3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=st58XkGo1mUtVcg7Ltlg/yyjPYRDJ+zsQ0SyHGQ+OSx8J4kkfpGaa3RDzDsxRTC9g
 F7bJ4nUfGj4xctv2zgjM/Cf5NosKgGV+wxqHb4+kgjAkQOwh1YH9qIf1I9E3SrwJFP
 fvOpPIVpPYMdEb3ULfQoJsj622yqcnianPKtSzWKXxZyScg6OMoRpyF5E/J8SigdSU
 8qKb8K6jTCjPEJa15ne6R7DvNXqoOUnSzgW6rL1sclJXXzVKnFDQwzeXSD9oyaB9W/
 9oeIhh5TsNY25yCmovX2jD3ONcMwFkV1ArGMd/zOUnytl9BCmi67pUvQs8IiNISlI7
 zoinTHqHe+ntw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=st58XkGo
Subject: [Buildroot] [PATCH 03/27] package/fmlib: update codeaurora URLs to
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
