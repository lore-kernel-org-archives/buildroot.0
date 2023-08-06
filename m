Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D70C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 18:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD1D40A00;
	Sun,  6 Aug 2023 18:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD1D40A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKrgwHKIPa5v; Sun,  6 Aug 2023 18:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 573824109F;
	Sun,  6 Aug 2023 18:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 573824109F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3A61BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5772606FF
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5772606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsBkYgdLQ7q0 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 18:30:53 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 06 Aug 2023 18:30:52 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA55605A6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECA55605A6
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 18:30:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.70]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63RQ-1pmhfc1kDY-016Qwu
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 20:25:44 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 20:25:43 +0200
Message-ID: <20230806182543.1751-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9BWlABoBRT895Myqd7L81aGpBvp3DpofbFfxs8JrmjZy93Gkwpx
 VjvgrvhDGfWoSHiAmuor0hvYvM/3SfD7giraZIxBW/EnjvVIg2qTTsMGNfgXxjePW5AAIj7
 ldE/Tkasm7NI6CcpJkG640CbZYQPMF9DFnk3Xlwa3BnTWbkenGiS8IO8CF0feM+FlzD5eDq
 Ak7skoRXBHgHwPlLIYWjg==
UI-OutboundReport: notjunk:1;M01:P0:DwFL6V96ukw=;LCT0B2+OUgo+RmNyjovu5w99S7l
 F3EjjuGjrUh8GGRXjqvm0Zkfo9onqXjgbdUSQBK06KfxGKkCAAZljB9SSq5tjOzFF2BZMlrbs
 G3LXkzlZtRSNY0bkvMusHIij3ULAPlEBh/D1Nrjz71vtvMLFx0PXgBLt4cfc0O2Qsegudfveq
 PoDi6+4jjVjpD2puuC7XPVuQPqMYXe2HUlTb0LuwDwHRHiI+9ycbt5ugttLFY0i8YVV0qR//J
 HLKR1LBI7RLi024RCVPlgAejzjRoyoMSOC4iMelq97PwQeRc0ciIBm6pBWc2jMbDL02pWxhgM
 Jzxm2g76igevLz7pxQ3gYJEo6vR1/MAut0sC5ewnYMcmM+ftQaRPX6AkIc/vbIlgLU2tLf+Kv
 lxYzr3BisTiYtTBdrvSOV80VhPdw9kjx7e+HAcS5NQh7ms+dXytVsSyNy5gggR39CwXAEKEFw
 8LsCoRwcU2aurn/lOPQ/C8OnABwfHwr9sVirowgs27O+F0cP4XzodaBJCMdWudy/CzLJr1LBM
 UBITRpFvFLbbnEKqQqLQT7dSkoSMWNav5IZat216OoRdnOuhhFV2TTVOSsppYPxDovLde4qnJ
 kWt7TvLtxLGg3lOLLoYqLWkQK2g9XsMUkkHHGf9Qc//jha32hgwT+BccTY0Q4dDthDL6E2jaa
 iQuxW8IV8T4rBJTFOlKvGMxQTk3BSCjXoTJ0QvtPWKdiYap09zrM1qRzLNNNvsh+DOXsGIezu
 uXw/gjoKqyyw0A+6mjAQRgZ0PVvHRmcrXsZ+/WqRP2Spje85XT5PgK7kdTxzxb8rVCZh1moEw
 dGYB5aOuqtP0OM3+AHaA859ZKdWevkScGGc/m69Bryk6vrgMxV+k/gNPiH96t0+hXL3dFSZL3
 wlUVgichk0hfyUhcxmtVuGlWTfVjLJPa+Ep4odfT33xQfv9qZNz35MoRTXqjXTJgyMunKBGdV
 4/3oDWtRLF7hAzQVhThpXuFTiA4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691346650; x=1691951450; i=ps.report@gmx.net;
 bh=EsmHVLJ+QhHYU8bvn6wVqtRly09Be0sR64w32XCTwsA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=ez8p45bPeVtcN6H1Pred//VVxfXbgcbQbf+kxAcCK2hWtAu0pd4mHmdN9d6k2y6gqHDG9B5
 2Pg69FsZjc39N5B/usu3yKkY1rhVcyxUsncfFt/zKN1tyuqDuNGTci2WRAuiWm3ukTktFDHyR
 P+TkqGyks/xVTjD36r1uUUTLlcotynK1nd6ULNarV7nED2RI/IVt1xnnVfWO0/W6cU9v90mZj
 Nd56/Gg1B9K2HinZAMq8Mwy0U+Gvk2j40z7+0qpbVyU9dKcPqagWfvh8rzaFuN3hGKphhOP0d
 pGlkSjsGhZC59Iih8Vb1B80GSN68eIPzw+Zw/UsrqC94IUzdpSMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ez8p45bP
Subject: [Buildroot] [PATCH for-2023.5.x v1] package/libopenssl: bump
 version to 1.1.1v (fixes CVE-2023-3817 and CVE-2023-3446)
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

Fixes CVE-2023-3817 and CVE-2023-3446 (see [1] and [2]).

[1] https://www.openssl.org/news/cl111.txt
[2] https://www.openssl.org/news/vulnerabilities.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 708926de80..4541087c07 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
-sha256  e2f8d84b523eecd06c7be7626830370300fbcc15386bf5142d72758f6963ebc6  openssl-1.1.1u.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1v.tar.gz.sha256
+sha256  d6697e2871e77238460402e9362d47d18382b15ef9f246aba6c7bd780d38a6b0  openssl-1.1.1v.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 178979f43b..fe68a20ed1 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1u
+LIBOPENSSL_VERSION = 1.1.1v
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
