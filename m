Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC38C369D5
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7D96067A;
	Fri, 25 Apr 2025 22:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCBWMdBVETqb; Fri, 25 Apr 2025 22:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A3D60685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A3D60685;
	Fri, 25 Apr 2025 22:26:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD5D441
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5FB96067A
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkTweRvatgA4 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F1B96063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1B96063A
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F1B96063A
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8RVQunzi3voVF8RVRumo5F; Sat, 26 Apr 2025 00:26:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 26 Apr 2025 00:26:47 +0200
Message-Id: <20250425222647.2340402-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMx+L3GcV6Bx/aLhnC7gV7ADbMSyhjNGEH2dJJ/zFTe5gZsCI6vInZzqkNt1KfS+LqdCzSTLWFzKA8KafZ3eLi4Z1nvMyuSGZ43lSHe4VhvBLfmUY3YC
 SpbkAoKMKDM8/eLIIeGU6Nr9BGJlz3sp4w6DIpfOGfujCc1PBhLRjVkY5FMyEIgcqtjLwVWWGxqVXmegkqZ5AkAMyYc9/qKvBdnoYTNm2XdCc2gJc7ImcNct
 bCwlqwL0vLXy2QIjbaC9w0pdhUMmDB5yGn5hu4I/PWpn//FJscPJscR3trBFIed6eyccQ+aNd7iApLh08Y2+XH6/rxrQHIMKR7by/y4gx0QKe2dZRmZNVYio
 dxKYWoAqioFUSfsRCUWJ36FHfuFYyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745620009; bh=5IqXM4ve0m4OgVDFRNYGhFFeUVO+Oxo6fMEdtNJcrbU=;
 h=From:To:Subject:Date:MIME-Version;
 b=lre0xiNywRaBgS8dMTblalsPqdU3qypdBbVaqmRE1RACjMeKYuSPxLPwz3RJZ+j+A
 dbCqyq4wivdHgg+lNLcPt0zfyG3CR3COcvX1oaHmub6mQVT/MBOuHTgtvwCHcHT5KN
 u2PLmzYMmHoQZ6LevxQJYJ3QrbYhE/wfQ81LaM0+C7BYx8UkS1aeUOTKPz17tDV0G1
 tSTMMnOgdn+bOk5ZlIDq5pRJGiVI9e91xq5fH+WmEnF7Kg9KHoFVemic8tOM8Ykvt7
 41g6irfegc4huAwkraTiC6fJ1Nl+1zEPdWgptQFTnABWrw6+8giIFE4IBk4z3YKmVr
 vqBOQWWtQxJww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lre0xiNy
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2025-03-30 on branch v5.6.4.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds support up to Linux version 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index d6da50a694..bb7c4b297d 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  56b43fa608c0b8587a03076f9beb21833e3259682f01c63df5855b3c82a61ee9  rtl8812au-aircrack-ng-80d4ba5a672f69a4a8b2c4b4dacfe804844e6952.tar.gz
+sha256  d4a1435e29bf4a46a4b0b31cad91f30bb263a899b382f828125437dce3cb4bae  rtl8812au-aircrack-ng-c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index afb8d25ac8..1308508e00 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 80d4ba5a672f69a4a8b2c4b4dacfe804844e6952
+RTL8812AU_AIRCRACK_NG_VERSION = c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
