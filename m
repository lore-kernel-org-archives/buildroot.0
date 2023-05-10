Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F93CC77B7D
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 20:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9874861148;
	Wed, 10 May 2023 20:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9874861148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvqrkbotvmmp; Wed, 10 May 2023 20:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA8A60D90;
	Wed, 10 May 2023 20:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA8A60D90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC991BF349
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 378AD84426
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378AD84426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1O8extalgYy for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 20:51:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4688F843BF
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4688F843BF
 for <buildroot@buildroot.org>; Wed, 10 May 2023 20:51:14 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wqmEpON6CV3cVwqmFpSVaa; Wed, 10 May 2023 22:51:11 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 22:51:10 +0200
Message-Id: <20230510205110.1962458-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLmAQhQljn+EOdnpZSiwo5ETlDFwSKqg1AYIO7xafpZw2MVhcZuJU80CM0NjMHAMcBuLP30/Ngp9EYDnv99BMil7GLu664oxYagxAPMG3+06bFWVNjum
 OwIOXlJpAbegc1uwMnt5bQxZWLW30WLHrgOvYHL8yWI1bcgiL045CNrGIIyaTRhe2OQI9ymjuXTTwDCVvjGz+I+gh4V6IuT/Xx5uPs05WQUiOI15vzY+Qhlt
 7Lv7BS7xTTkQMptyOl1YdhfaWij37aAyovYSOziag1c7JtgpQesaIA8fSIFhsBh+R8v8jZCVW2EmtjCndcVUQw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683751871; bh=ATU2tL7VBo5bFejd7H7UN0sqfppuNzGug9GZvi0gA9c=;
 h=From:To:Subject:Date:MIME-Version;
 b=L7gORBDneTGtdVvw9K6PVvnSWbffu61NX8ARh920y3fQ4YK2bNSk5awSlcYELs6b+
 zQy3RuslekY9BGwpp7J34VzbCziI3AjitXoWJYKDEFungHcGkCGmNM+91BFu5CAU9W
 VcC4omE6JCaW8HgZ3I2IsriNQQZ67cycusFOmwr4eikC1pZMRW3n1kzL5fy1htJdRY
 DWGP0ld0r/u84OOvYTbXMnSHJkdO2z24XOyw6KsI54o36Gb1Q2V3Z1GVE180IMuD5m
 EdQXaavzGbh90xCYXbWVGWX99jjrXKARodAlYg4UYg/GnvUi3FPE0Sf3hVqrKfJdfn
 7fPn3jXDKTRtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=L7gORBDn
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2023-05-10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patch package builds with Linux up to version 6.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 8676f065f8..1ff36368ec 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
+sha256  e27b6b5fb35ef44a93eb1f5b29bd61c06109e951c8a5ea2cc3e0310663f22001  xr819-xradio-547521df27d1a80fb5542e93fa13bd09fb2259a2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 66c08e7921..1e4cdb6872 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
+XR819_XRADIO_VERSION = 547521df27d1a80fb5542e93fa13bd09fb2259a2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
