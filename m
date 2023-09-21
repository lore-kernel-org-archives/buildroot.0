Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A630CD494C
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 04:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C24F60B50;
	Thu, 21 Sep 2023 04:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C24F60B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yudBgAjI-Qs; Thu, 21 Sep 2023 04:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296A7605E8;
	Thu, 21 Sep 2023 04:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296A7605E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE941BF34C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F7E341FAB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7E341FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vlz7cBM9gUXc for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 04:15:39 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D49BE41B31
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 04:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49BE41B31
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mzyuc-1rejny32OM-00x6j8 for <buildroot@buildroot.org>; Thu, 21 Sep 2023
 06:15:36 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 06:15:18 +0200
Message-ID: <20230921041518.72066-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YfrMROgUv3PGfQu8H1N4Kd+eDwZwD/DJbzH2dd5vjQCI9nVFlvl
 Z2rU8ls8VxlN8iEOgNZYj0EFdkaBDaQyvR7+MIxM0SZNxNKNog/6L1W8NIdF62HBkch/qSQ
 V3h3ryiLYeR11PtHgscWu5MZimEc7VxKpPj0vqa/+6dHLT5t+9aotJHqaV1q0Syp7oLGXVj
 3EehcL+5twemdBZatJIiw==
UI-OutboundReport: notjunk:1;M01:P0:I/4D+YIhMrI=;2wiIrhR8EByUxDd3ZsgZHOnHNgL
 uenwfPWrIj+5IepZw6c/C5NqMRr68Lfy8kD8Z77KR72ZYzI+Jwb+5teLK55JlJhLX1dFqGMAM
 Sf894ImE9K4VnByKU7tA400AnjfJmQi4yE5KDIEeLyt/ZXNuUW74l9LPu7B4aZZVG6snFEY23
 12f1EsePb/Nj9JpNZLvyqpXW+ZG3q7qUfZFXbjMNeco4oAfTgL4spjHG5DGFHPOfnxlAJ6IvV
 Ru7LhpLAbqIE20afMUgQjt325jdLsBlaXFGOccgqhHH4KTGhkHa42HJ/anIyNtqSqfmG64ydU
 msYre/tIwk5u1Ex+pPsjBcmHFLTNzFGeJp+pqq95YjDh56U8gnOfvyU/KAKbaRmCyifVqheXT
 pO6z9QE9Nd6AsaghjVx9Get2hKur8WEP+qx4lOJNynHdhVa/fGF/nuJ/BWnT8nCWWettvtUSY
 kNnRQbKgEBHMAO8JCJpuWjrVFwZNVQmIDnvf8VjBZOIK5s9yd4hqqpaPmxSr8X4Y+4LXNVAAJ
 h8ffnpeFT2zkO9r5i1BV8RjCJOKnwpiD8RoXAkhVw94C0j3ZjrN1RJFXslhd7jzs91LvFIg9a
 CImrV3QcKuwU3TPQUte1WeGUUZrU6yIpnnmn9m6HKgPUtb7MtnLuT/eWXOLCoYH0Thspw4fjE
 ou3/hVzQEydHoDG8GNMzkORNBsmJcSsHCkvEl9xRO57O2b1cu7WkX7vvF2vdnIdJcVYA93fYy
 ZzibwBYDiJAH79p/EG7Tqml8a6uYGfD4B0L7xWRE2AV5NqbUroViHY7wAyDiU+KLS1CKYir2W
 LKeOT8/PZ6/FBjyA1qJs+AKR+N9gNpjJQVVv8ueQdZxG8aBt2rNcr0V2/CHsXsby8ymjGb/W3
 pNOOeb6V+fZU5d7ZHWWcWpKxxnvU9dY0m1tkbXoqIgGbNXhMmEIT2kPeURnEpBG+2U0XhPsnn
 OIfzWoPQ5yLRVSTn4WSZr+2WXho=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695269737; x=1695874537; i=dalang@gmx.at;
 bh=d5FuVRwX69/TVStuOmMIfAvmLcLDkTezevC8oj7DXws=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=ph8QPS9olU2k2MFWCxfHflMXKHQIawtc+5zOvyvr5WOdW4F7F9XF/jZOnuqBNQmwBJ7btmjis2v
 zXcEbfu5EnVzarOiK0OlVskEiDHEwqu7YL3bkAIfE/fUuBn7FBMzo/feIkHcEUXCCVPlAhWxWJk5e
 y0BxDap7lfTn7GVXDa9OrSwsG8OVzP4ibxEEXla56+UO/ruf2dQIRJy51mPD/qmiGUGNmwZMMVAIG
 cFXegaOOXBgNU+lP0aLsYq+oTyljSmKH3ncM9PYJdmZq6jyByzE2jEKZI488PgbBPj87pIA6NZU4G
 FeJY+bHc0DNoYXkTEru9MGpfeuLzV5s1dtbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ph8QPS9o
Subject: [Buildroot] [PATCH] package/sysstat: drop CVE-2022-39377 from
 IGNORE_CVES
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

As off 2022-11-22 CVE-2022-39377 is listed as affecting sysstat
< 2.16.1 instead of < 2.17.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/sysstat/sysstat.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index eaf505dc49..377396d986 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,9 +14,6 @@ SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_CPE_ID_VENDOR = sysstat_project
 SYSSTAT_SELINUX_MODULES = sysstat
 
-# NVD is not up-to-date; 12.6.1 includes c1e631eddc50, which fixes the issue
-SYSSTAT_IGNORE_CVES += CVE-2022-39377
-
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
 SYSSTAT_CONF_OPTS += --enable-sensors
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
