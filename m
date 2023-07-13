Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805EEEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114FF6130C;
	Thu, 13 Jul 2023 07:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114FF6130C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqe0faVe1d4S; Thu, 13 Jul 2023 07:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46BC161293;
	Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BC161293
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD6D1BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5499A40BE4
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5499A40BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtTBwjC0m3Gu for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF8A840A85
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF8A840A85
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N63VY-1pvYoB1YYy-016Ps4; Thu, 13 Jul 2023 09:38:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:46 +0200
Message-ID: <20230713073854.19510-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:NfDEfjsNB8LLJfNdIJOVn2qYwDMzNcQizagPC+p1xAT8ElVZfyR
 VOHX37ld37e/MmSgQhiG9STa4+jvg55xV7ou9LAB9Yp8cyQkiIgzBhuXwzsHTRxRNdlCMrY
 5nhT7JxPJ6w9X8DthCcJMUz0bBj4Te42GfQbsdPsYhROgt/sKQ1K9WR7eAmCDfIRWDiwYpH
 ji9GqLq0vdSKd4zK0ao5w==
UI-OutboundReport: notjunk:1;M01:P0:MQcLwiQJrZs=;kcgsz/gtRNLc0ke3y8uGgWbSNxh
 gPY5ITr6jpg2qPOPEsAY7ZqxZU8NiNqCycI01VCXu73HOv6ya14pTJwFdnEaLT84JC6IeEumi
 n3jkPn6UMWRfbkV9UINduGQNP5u3iA/knkkTU0FT/zk5+lVvJm7fiw5fiWx63tCuVKlj6/fbl
 rlyGcXvXYbWflr1g2QsmxhWtZWGbHip44hF++Vt6PSIEOstbrDca2GJiibpLiX6TGCgwjogTS
 55HlmZ6QGCl9mXOQJ8rHpk8mDH5kILkua9I+oTB2QbXjlkp1ZVh+y+5gvU01o4M4bmw3eH6j1
 FC63VaAAVYur3JjXtsQ+6dlCNdtnK5/rl/8Y0AaDmp35oOhnhQz3DwqwHNhzRxm81cLXrScG+
 TeaxK4FMotvTcVYaK6eQmU0gbkl+2WKIPdR9AZmg3l/w6p0o9HvInInJIAxEWAbC2Ai0uRGtO
 a/gKeoQj2JoHRk2UNke0OHTD9+vhZTSp1IWGj/MqBce56wFrmePMlqQ7LdOXwRx7y0HaTF01P
 V4Ejlh/z5rtOP7pp0aiB71P3A0UUW/6jNHy1glXUQrU9aju+KPYTo2+bMAP+xt7MDOLq5Us6t
 UpnJgIP6QoSTjLk/VLGDTWnRgjhrE16cF65C75vgHasA/dvGVEKCdwxzizDfxzdfPniSUxj6Q
 Mwqktv5MgQA/si6gO7xs25mtV/pMgNdeLq4DOWxVVmubD8zc73oSn9KsNpV7FGYzP2FRG8pRS
 CJIR1QGF2ZXL/ANVyWKM9q6md6CGarJCfeTBdzQGzdzteZ5FhokhI/IVhPjM1xquacySi8Lfs
 KqyfRjJJUiUIzpocVWYfpMKnbudiQqUIxwGKHwyudGEv9xrxmxxDwMJ2hRJM0Ca0RrIjHTVHB
 GuYPNPl7aB4/vBLF4wAb4S/pd2wfc9O/bvGSx7HZvTDdyhUKyQQNp/VidESzyblu7G/DeLygk
 WP1ExNESkPVZ4shB3uZhJ2xNu50=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233935; x=1689838735; i=ps.report@gmx.net;
 bh=/OEJ1xj75fc2e839yu8q1/2CcUAqw8kq9Pq+xRLPiM8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=YXCAK4KAGz1EJ5/tLN5JHohXD0HYKb5Hh+2kh3juSUI/zsynUWl9j1qN0fhXPdjqqHoq4uK
 8jUhv7IlT4BLqhT8plNkYjbrgHT2k/w1RHbvxpbzVUdOASXIOlfxtxLosF0aMnhNrtNLzUrqj
 xte7Ot9m2QOEZArYnb4p8dIsJMmQF3TDxwbvXTogXn9rUbhWqbWErFMILKxKDBYVO9/0DtfxY
 ++r8BpqJGRyHW2mVK+263fHFo0ROB1FNTUAXCVs4TDRuuA6+PrPRomi5MSzopnr/7laHAS+Mk
 DKtJrwbY21LP+Eh5bdfVDDIpUdPNznriyRsceRl5ioy0Zdw4sxjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=YXCAK4KA
Subject: [Buildroot] [PATCH v1 1/9] package/python-click: bump version to
 8.1.4
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 81d19c419e..9b2f8ed833 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  a804b085de7a3ff96968e38e0f6f2e05  click-8.1.3.tar.gz
-sha256  7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e  click-8.1.3.tar.gz
+md5  d19686712c4a599bc8bf1f6f3ea7947d  click-8.1.4.tar.gz
+sha256  b97d0c74955da062a7d4ef92fadb583806a585b2ea81958a81bd72726cbb8e37  click-8.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 6444d0148e..a6f2c3773c 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.3
+PYTHON_CLICK_VERSION = 8.1.4
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/77/88/b0cc5fe95c31c301e9823ea9b028f669c0dcfa205ff71111037a5ed4892c
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
