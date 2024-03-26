Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB4ACD11DD
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 12:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F5D7405EA;
	Tue, 26 Mar 2024 12:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQeEmUIzj-Yo; Tue, 26 Mar 2024 12:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149C04068C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 149C04068C;
	Tue, 26 Mar 2024 12:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150871BF95F
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 12:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E95181FB6
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 12:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLBmsczKoXNX for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 12:21:44 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 26 Mar 2024 12:21:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EF1481FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF1481FA6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de; envelope-from=laurent@vivier.eu;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EF1481FA6
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 12:21:43 +0000 (UTC)
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MlwBf-1sWe0d1aPD-00crPw; Tue, 26
 Mar 2024 13:16:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 13:16:34 +0100
Message-ID: <20240326121634.1248184-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:o8HmdFX/V3yZsxDPPC008f7bHSJ9sdHWvBy6IzqdCaSHDb1hJsC
 p/3scl8Xfu4UcRfMYu00X+ft1w5rHUaT6QfHRBbZ/6EHgZnssnbHqQR7si6LqgAjpvVrX+x
 X5Kq3pNhH6joeCR+60fp/TV5q7uO6vluvuOP/xaImJCjUkqqoRkt+aqN/zvRPW/C5DGYcEC
 b8nm9j6CGFYIx1g0iY94g==
UI-OutboundReport: notjunk:1;M01:P0:vbt3iS2m55g=;K0qpHTMMN9E1x+FbXgrVIEfbl7Z
 4avLI92bRSwK3gsJNLukzJgvDIt3ozeF05N/5cYyV1BMPi4+xky1zhuq4pwvfiDFUCgpMN1IE
 0tRpOiGfpx8wpNfGn+fa0qo5XL3n4RTpZDV58BOCOCfrYs4clbuuxXEFHwoZN7VHNyADAltRZ
 Hh5/JU/yegx+rqmlSy2m2yHvB7yisoSJr17USTef+TKQGr/xhyWKvRIUaHz1dRcOgLc4yE8Iy
 H+3yophXryejTezgI9TrGBssqYPswpQkAaVaXhIH/j4jEz92aU0cuHvXAeyXId3VJ3UzHUa68
 Um3Qn/BTD6k7uT1fVTJ3orMJw8M1b3mXRX2ljUQ1Gg18kfqd9ECWxeaUzROovimzKq8d/gLch
 4Y0633q5u7D+ctaJrnXXZ1Z6VVxlFafqJKqotLWAlSoyYi62PoKp8r+SJBNaExBv7q4enrsp1
 m7SnmYMovkKWSi3Dovubi5DLSmsocmU4tSdBjWzD4DVmGWU5T/7uX4FefftD7T5rAgJxuja0k
 OR6V4c4VAhnRpWvBHJDyobNxPr0NKoMUEl4k2jTZZqiIJmXp8Bmop+YH117xlzaTjdmVy9jHh
 ALRYkr9Qf8HHt5JsnwDgFAikldUUPM1MF6QSPagaMeiWXcimihu1Dzj79xfIGvshXgqHWcKSv
 KXrcIoQxSxWXtezuBPX8ydzWUbyW8aDIOoNfwkdIfNNcB4w419CuNsWwHZJusewWrAjduNQJr
 aYZi6Jk6bug08T3egkHohmzbVK7EjBna8M3AGKA5DDzhjtK2kqT5bA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vivier.eu
Subject: [Buildroot] [PATCH] package/petitboot: bump to version 1.15
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
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/petitboot.hash | 2 +-
 package/petitboot/petitboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
index a9a21f2c1b69..3a90bc529672 100644
--- a/package/petitboot/petitboot.hash
+++ b/package/petitboot/petitboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa2367370d3ce5dd9910ab08a0832071e2508c8bf75cfec6d3b9807fbefc507a  petitboot-v1.14.tar.gz
+sha256  eed29ec841c2bcd5ecc65347f5b95a0087a541bd9c04ca3c17c55d1f7357d189  petitboot-v1.15.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 4c8bc35adb38..cd7631fa5cae 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PETITBOOT_VERSION = 1.14
+PETITBOOT_VERSION = 1.15
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
 PETITBOOT_DEPENDENCIES = \
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
