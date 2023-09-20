Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E33CE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 04:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E960A404E0;
	Wed, 20 Sep 2023 04:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E960A404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B72EhJBHnhK5; Wed, 20 Sep 2023 04:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48BFE40A8D;
	Wed, 20 Sep 2023 04:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48BFE40A8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D23E91BF97A
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93D540347
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93D540347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPHHK9cqrLC0 for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 04:34:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980584021C
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 04:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980584021C
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N4QsO-1riziO227y-011RoL; Wed, 20 Sep 2023 06:34:42 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 06:34:20 +0200
Message-ID: <20230920043420.37133-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HfzLmjz9b7VO/1razL6XMDR0R+gMchZ1EajoetI3+oPhKJjfHb1
 hlmqQXRhQhD9Wz9tReYsYTk2r5LMUMPfKtWi49T9Mp7k6FWsarTYKER5nbCtQUHNyeV2qCl
 rIV+F9EmBJ8U8yGuatUxge+OsQC3nuwmiMhH24TQ4qHU3KoKHQ0IGXqz//3i1Pq/MpT2+sj
 Rny1/8MYbZxZIX6ceMHSQ==
UI-OutboundReport: notjunk:1;M01:P0:rr/z9+Rvp4U=;995qjfmX5rRJH4eZn1SeLMpHLKE
 9PyNdGTnxyIJx4tT1L0jzcQIDh4une6aMGhRQZDW4fvIYJ4AKvw2S8TWmTHfzrGbYsKXxZ/kI
 vmFU+Yy+4g23yfjs8wqouT5EFzP3mzIdIANC1S72xiX/RbUUVN27HnQQGCPcIJ32mL82fbVgu
 7LfPyl2V1TlWWh8IRNV2G6eb6SzzPxDduQut97ALwox1llYAn+zS7maFUjC+UNe45DznNauSI
 iud3YqiNLt8t4yK+ecDOqkWTCCfobkxom8BPrq6M1/ZMOxrf4IAv4kPeuQkXDFOR3hIylvXfQ
 NErZWGTSi0V2qAOdJD3RjDhGymvmOSfVWZfAVYDf6r6GLwsoEzL0I3GjOjSpMz+e8jC6Knl+M
 JBz0DcjO/jpYCwUJ13EfYGqg5bjt2ZQ0rXMZk2D1CAXu7e8tTEz9M5JKPKvaLt2ENiPXPewdn
 HSq+0owl5xEcQfyF3pF3S9SYjbK8mBRnfu2wRE1Mfqf7+Txx5ZcIUJUdEqsaalRdN5o+zfCv1
 AWP1FIbyblD+hIZEmryG0zBRDt0R4XfBA40nSQoohQcbe6RNTF4mm3GSxKSvCNfZqJYw8Musf
 U4san6AM8YM8jBbFn7QqtipeA3YxaOK5mdBvfmzve4SI8UF4MujG9Y/SfEhuosy83LQj9ka9i
 8+Eqbj0LGl8chlyifacfWtnZ08tio/EsP2lQqCPbiczHisBErinjMuzGBL+VJ7f/FZjv4Ghho
 VHZoPpEC5c/JeKe0e0+KIZ2BfZ2LtrZXodg6jPdFgvcLOuWojgLZAgpt6dxoInAjKZJqZnDaw
 G2jERiJADdu1kfSmdW7eMFZGonb6QVa4qw6ywHWtG5lYWNN27HkqTJN5ECBWpCXnyG0MANGEm
 iYay3HR7eQQbgmhugwUOfCvuqvrWrOxWTlUZfaw6sRTi3mnhJQZtodGb6yPuJXUecctZabu9M
 oQ7Hc1ao21y/DXPUYhejxWQwTrE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695184482; x=1695789282; i=dalang@gmx.at;
 bh=HwKu2x11AQGdKaZ3A4Gw6WTTNGOlFn+VaQQl4SbnhI8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jEQAM7IiWkJOqOr+0bITgFS8W4tqInGDXnY6xcS0ScYj59R+75vU5goY+9G3jDJrsnp/4JegA51
 1pHqw+hJBDy0cRfU+aQ9aIK70RC2pN4V4nq68UYU5gmkaoc44ObSWDWyzC6zUMiECuJqffpn6nvL7
 zdonkfSu3O3FbragcbfGS6HfGdVP7xuUIMfVz8PuzdGCIXwjCxDMeTPiZRljS9f5slnJD1DUFP1N4
 /yvHdMaqE3OsfNJFdZX1JZPCxuKTOp/M4920VTu/PhIlPlJKruUMXc7dNCYziCEvEH6RrE4zhlAom
 X4GbKj5rF+GOQ4vnEvwR02aeh6gnt8vj1fcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=jEQAM7Ii
Subject: [Buildroot] [PATCH] package/cpio: drop CVE-2021-38185 from
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

CVE-2021-38185 affects cpio <= 2.13.
The mentioned patches were removed in b0306d94 when bumping to 2.14.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cpio/cpio.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 19224000bb..911d16822b 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -12,10 +12,6 @@ CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 CPIO_CPE_ID_VENDOR = gnu
 
-# 0002-Rewrite-dynamic-string-support.patch
-# 0003-Fix-previous-commit.patch
-CPIO_IGNORE_CVES += CVE-2021-38185
-
 # cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
