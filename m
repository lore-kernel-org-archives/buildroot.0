Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA529C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6699C812FD;
	Thu, 29 Dec 2022 19:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6699C812FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nt8ooGdApk21; Thu, 29 Dec 2022 19:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862F4813CA;
	Thu, 29 Dec 2022 19:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862F4813CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42D4C1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B0FC812F8
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0FC812F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmfXZqbXVMyW for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:48:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF6181289
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EF6181289
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:48:33 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 45BE2200385;
 Thu, 29 Dec 2022 20:48:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:04 +0100
Message-Id: <20221229194729.8085-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343311;
 bh=bgbr8rNRnemXyYHsVdLCL6oYWgOqleD5fxSHIHRqTl0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0AGREuA92ZCqwgK+Q3z85hYekqHGy9L4z5/KrKzv6oMpzPDJthmeAoKGKhz6SoLr
 0tSI5r7Fo6GMdaIXBVa0aV2GG2oKrN644x+jlygxoZ9sEnz60NFKUeKar50O+1Bn7f
 oLLDfiXUtzzaXdpMI1upSjRgzmAHmXKG0THY2huvWdJwQJIkKQVjR7VpRxCLVIeGHr
 M7i3OpX/j13bwMArauLUvaMjGUztU8/1Jo9WZ4cQgxfHKV2EbZtxkLfRW6r+/lJnPr
 CF/26ceaZ7t/NCdIgc1zKX5CXfMWSrJgcUY5GspMYnspN+8YtmQzaMcx6JqB6mNp+J
 WAMZucnwQl2hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X0AGREuA
Subject: [Buildroot] [PATCH 02/27] package/fmc: update codeaurora URLs to
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
