Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B58EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42CA1405B2;
	Thu, 14 Sep 2023 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42CA1405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWv-vRLEpAsW; Thu, 14 Sep 2023 21:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737B141917;
	Thu, 14 Sep 2023 21:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737B141917
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 800641BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5977E40743
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5977E40743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZhkMF7aaSGO for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C16640860
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C16640860
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5918787002; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:30:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8672a8b600f2781b54cf4750f1c0eeca264ec14
X-Git-Newrev: 23e774d2de35c42ee13f618dd2a895f9a97a4d1c
X-Patchwork-Hint: ignore
Message-Id: <20230914213332.5918787002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zbar: add ZBAR_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23e774d2de35c42ee13f618dd2a895f9a97a4d1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zbar_project:zbar is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/438B9E70-F8E2-4318-83B5-46A0DF320CE3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zbar/zbar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index fb83fa01d5..2c933929cf 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -9,6 +9,7 @@ ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE.md
+ZBAR_CPE_ID_VENDOR = zbar_project
 ZBAR_INSTALL_STAGING = YES
 ZBAR_DEPENDENCIES = libv4l jpeg $(TARGET_NLS_DEPENDENCIES)
 # uses C99 features
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
