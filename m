Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F2C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 05:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF3A9400EC;
	Tue, 29 Aug 2023 05:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3A9400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPoBOWXUI0Kh; Tue, 29 Aug 2023 05:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4125A4016B;
	Tue, 29 Aug 2023 05:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4125A4016B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 613491BF317
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 05:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43EF0608A6
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 05:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43EF0608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBc1jHxTVXkk for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 05:09:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B999C60803
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 05:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B999C60803
Received: from fli4l.lan.fli4l (p54a1b6f9.dip0.t-ipconnect.de [84.161.182.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF3F9A4C077F
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 07:09:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38626)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qaqym-0000VU-01
 for buildroot@buildroot.org; Tue, 29 Aug 2023 07:09:28 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 07:09:27 +0200
Message-Id: <20230829050927.18710-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693285768;
 bh=MGV1SJD6HCYBMjrN3TU3Xo5Pesi5KrP0SZdESq6tYEI=;
 h=From:To:Subject:Date:From;
 b=KhdseR4hzkA0yIc12dg5CFYM6kZQu8qr2ZdtgpNpq7YCPW8ZEYX8YuO8KZsi84ap7
 HlfPsPxtTy4bV713vuFFBpJDAlcusZ1UnLypUSrxY4InBJ2r8BxtICBcZxk0Ep+K4t
 ZSApNvsiAPnbIZc/AdzNzLHI6H2FOmtmRaWz4MezN8HpQ7m/P4dRlDV9OubZkf6bEK
 SgTOkrLtcQuJyDURO7AHHT7fyY/yiuzNl6T45yWlE2KtK+n25k2kfiiCAk87SqWdMN
 9rX2f4ZkkeOjYIxS/O0my2RubxgykyLS7brmRG9rsOiTgQxIQu8FDTb4pXMaeqJp2M
 kWZMVfYOCuc0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KhdseR4h
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://blog.clamav.net/2023/08/clamav-120-feature-version-and-111-102.html

Fixes CVE-2023-40477:
"Upgrade the bundled UnRAR library (libclamunrar) to version 6.2.10."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 9a41806d1e..c140a2df07 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  71dd39fe0d3937747fc280ea07c15cc990269257c4abb12dc438b4409d1b44c7  clamav-1.0.2.tar.gz
+sha256  8779458dc31fdee1232eb8986f092d25568b39f5d337c0cbcd9c1abb5dc2886b  clamav-1.0.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index e677c3375a..e1e0fa8c63 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.2
+CLAMAV_VERSION = 1.0.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
