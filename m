Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0551C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9782980BE6;
	Wed, 31 Jul 2024 19:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnDphdmpLW9D; Wed, 31 Jul 2024 19:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5A180B60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5A180B60;
	Wed, 31 Jul 2024 19:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACDF1BF232
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17253403C7
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyO7FSNiamax for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 19:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 882BA400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882BA400FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 882BA400FC
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 19:59:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 21D1DB0055E;
 Wed, 31 Jul 2024 21:59:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 21:59:23 +0200
Message-ID: <20240731195923.32520-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722455971;
 bh=hAXsoNEUsKthcZuUUUZ3D4pXcq/gfc7UMLTQiiKYb5k=;
 h=From:To:Cc:Subject:Date:From;
 b=XYOVp+tw6I0QHy+W1QnWkIbRUPAst9/JSVEbciothsyH2Bw9pTujHUM4qiGcfpQoV
 Det7hq2JR4zcowM6WKfpVHlW9PrEqPmud962BstAHa4BuYd62oiW5ymgzDIxeEcWJ6
 CsN9YnKYOtYI4jqUwujeRcspFCtCAxXmOcGowp3nnSKe5BHY7EieM5WNE0B0drNtp7
 lXzs+HTDG9tGnkL96tzTeP2G/ytCA0rB3lNhM08HU//Vct5/Bpv3Ll118VcKqL9iqv
 WN2sjr8J7s1GCWwxFhejgeGJRWCVsWud54D/yzEzMpdkXfHp506oteai6Y5W5O7VbK
 voKZkfOMqbmkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XYOVp+tw
Subject: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump to version
 lf-6.6.23-2.0.0
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
Cc: Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/nxp-imx/imx-mkimage/compare/lf-6.1.22-2.0.0...lf-6.6.23-2.0.0

Note: the Buildroot package version name before this commit was
"lf-6.6.3_1.0.0" (with an underscore "_"), which was in fact a
branch git reference. See:
https://github.com/nxp-imx/imx-mkimage/tree/lf-6.6.3_1.0.0

It should have been the tag name "lf-6.6.3-1.0.0" (with the dash "-").
See:
https://github.com/nxp-imx/imx-mkimage/releases/tag/lf-6.6.3-1.0.0

This commit fixes this issue by updating to a new git tag reference.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 3161d66ad2..02205def1e 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  48e7bad4a49e693415418859bb0330b63938a77bbb12660bc64761a5daa915c9  imx-mkimage-lf-6.6.3_1.0.0.tar.gz
+sha256  0a5654229c063e4e87b5d69f47a4a913ecee51f8a817ae2346a2a407e765ed3b  imx-mkimage-lf-6.6.23-2.0.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index a82854eb6e..f7396ba1b2 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-6.6.3_1.0.0
+IMX_MKIMAGE_VERSION = lf-6.6.23-2.0.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
