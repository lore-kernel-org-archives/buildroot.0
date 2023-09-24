Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C48CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E983417B9;
	Sun, 24 Sep 2023 19:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E983417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awZlx2yxARnU; Sun, 24 Sep 2023 19:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EA341860;
	Sun, 24 Sep 2023 19:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38EA341860
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AADF1BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B14F60ADE
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B14F60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0x1phvyMsej3 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC4260585
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC4260585
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F33080288; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:00:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: fa5e2cec8a97d5fdc2e434429d10f27deac05b12
X-Git-Newrev: 8a0ac6c44db88eb685f833840bc535393028dac3
X-Patchwork-Hint: ignore
Message-Id: <20230924190552.7F33080288@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/zbar: add
 ZBAR_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a0ac6c44db88eb685f833840bc535393028dac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

cpe:2.3:a:zbar_project:zbar is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/438B9E70-F8E2-4318-83B5-46A0DF320CE3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 23e774d2de35c42ee13f618dd2a895f9a97a4d1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
