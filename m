Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF7C5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E62CD60AD8;
	Thu, 30 Jul 2026 21:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUofv_fg7tHM; Thu, 30 Jul 2026 21:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F5060AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446408;
	bh=zqomDMwPOQGFNjZXJRlVFbI/3IeTwmJ3PisvUFTS2tA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XZKH1DN387DHuGxwBiLyvfpI3QOEhXBrPZU04+A7qJukEabcyFk3VgvfgUZiTXyxX
	 ofbgzFQRVRMFiTYn4+ho+hnmwpRaZaezzMwHXkNjXACEYG991CLhqEM5iiK8mYQ2mH
	 rB/ugB+mmBF0Glfl4hGQr4LRnz5GiM58NFqsDcyDcKsw2UC5J9yw+STgZ1X9Erb1kj
	 +BW3TubeNP3q+KukO86oAB+VMtAoDT7OHBQCrUYTOrvrhbwmzfPZollqfacRxvu/0P
	 MnS0ZHX1ilTT8Yipl+c9sYpFLxw8OLC4pdIEX0ngeN12gHO/bsrVzoysqiyLYf1R6F
	 lnrggqlfQEYRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F5060AD5;
	Thu, 30 Jul 2026 21:20:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F2169
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3FD60644
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyJG6CmA9_l4 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D1E60A6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29D1E60A6A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62D908B651; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43cea41928f5934fb6c38399a12d1bbaabc88dbc
X-Git-Newrev: 9bc585a804b2ce7b5f82f538f6108cca27c3116a
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.62D908B651@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: bump to version
 lf-6.12.49-2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6090101715782205457=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6090101715782205457==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9bc585a804b2ce7b5f82f538f6108cca27c3116a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

For change log, see:
https://github.com/nxp-imx/imx-mkimage/compare/lf-6.6.23-2.0.0...lf-6.12.49-2.2.0

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com> # MX95-15x15-FRDM
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 02205def1e..4828c25eaf 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a5654229c063e4e87b5d69f47a4a913ecee51f8a817ae2346a2a407e765ed3b  imx-mkimage-lf-6.6.23-2.0.0.tar.gz
+sha256  2b0ac561798b126959167efd767a7bed7e2cca39665a3201b340b77c91dd5c6d  imx-mkimage-lf-6.12.49-2.2.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index f7396ba1b2..ac64b36ea7 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-6.6.23-2.0.0
+IMX_MKIMAGE_VERSION = lf-6.12.49-2.2.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = LICENSE

--===============6090101715782205457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6090101715782205457==--
