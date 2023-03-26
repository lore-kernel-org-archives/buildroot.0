Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122CDC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 08:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB76760EB8;
	Sun, 26 Mar 2023 08:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB76760EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKzjC7UbeBJs; Sun, 26 Mar 2023 08:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ABFB60E4C;
	Sun, 26 Mar 2023 08:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ABFB60E4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA4A1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4467B40194
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4467B40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ms_BcJTXYecu for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7D4405B6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D7D4405B6
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 08:00:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MF3DW-1piTxk1ugq-00FTWz; Sun, 26 Mar 2023 10:00:36 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 10:00:32 +0200
Message-Id: <20230326080034.14629-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
References: <20230326080034.14629-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ev4zpF0KFrM58//Xp6LVskp8YgYDts2qQYyyfNkGtQjGHwwCmmQ
 aEdWVu0+yXGRZFQkjmflIEET+GqCAXX3GBfMgEaHzlzo4QZZ/A7nNF+x51zT0ZhhrnwGU5R
 momDEe6UXNUU8k1ax+Kwy8AWoPq3H1m8fFFV2RsKYsbT5nk5Uj5iWDKYgyMUnD03hChZltu
 nDz+MKOZKQqLfk6btT/yw==
UI-OutboundReport: notjunk:1;M01:P0:v5/sVLUopTQ=;I6I6hCK3e8LcuSI8cY/9s2eLbBM
 ADXwTROqc62hgNBk2o1Aav+ZcT9FepynHRsfQ9yUZR5NRDs706Gy7ndjQjth7QwFgv/UJu0ru
 En038tBR/z4GqcTCOKM2NSnKEGYhiCOqRBGP8hr5UGxTfOnwy6xY1tP4HXjz7hQ8LAcDcWMAw
 J9YFFqd37h/mhPSRlJIT23q7NG9nA3s1R3srNgi07CCtpt1Khwf9fFXmI/Xdekt8GbBSUa8iN
 hb7qqzBPfQZRa2kwSFhqGs8tamDql2/naN8rFGwwGS+KxbTEMWA6QSTIaAbFWqHijm6YZSg1G
 VU+BL5zMqR0d6u1h+zm79iWp3z+tTY7lIucEi11ppZjbbSRWrnsVVeQXq8tIenVvumYGtQKKK
 TIABOuI4mCowOGo4aVR67N+T2CIguFSnmfTpUfnOoY4KFtrOSzAxvDQnxypRQMUbxfOeaaVEi
 4yFdIJNlguW45KkkYXnjpY76LloheWMSpUBzPHTqHuvcGn3yC6s0KAWGDv70CCzaH//Efgiz/
 qa9wEOk331tHcWjrCHHjmfveDkHJNwAbE0DVycD8us8k2nZmPHAPajIWxtB9TpfUtm7/q+qZ0
 Gw+DDymSpFfdMlLitIuA+9aXJ26K2qo0S/LNN4CeKj9Qdymq8XgGj9shrP06OxMRxorL5r+Ct
 25keYc/1H6u+ke8MJnppCG9reY7cwRlzi+8YH37Ziiys59JbEtKRMpNCdKJxIKVKEdcTko9Rk
 97SUNSqf+Rr69DI5wSyxSgffW7ytlC6fD5Dq46KOjlIysmWHEU+hwi86+fZMXkrgv8TmBRwWr
 +iwht6yrD9vtxnk3fif8r2omhBWLmPnVZxyFEzKBiXoqXbx90GjlHY938YpxraM5x7AamXAlD
 HU/gmNDVxlqh5dqfKT8uYSRZC7lSty79DRbJT1dwTpyNmeTGIdVlNXo981pHVqxJmY1vCRAaa
 f6bgmmGzyNtU9KHm1CKAeNjtc6M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679817636; i=ps.report@gmx.net;
 bh=ygB43AjpIULIpH0K+5N/UDHUvGIz2VM3eZg45sWta4s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=miy92QTKbvuJZgl5623QrfXlLhU6PB/G44Wc7wUkllxl3fkrUx4n3aqi4c+PJVSQJ
 Ghc5c2yAOQAqWsNBd8BA5oAUTkE/eg6DRhPzkKsJsk+cxaW8yMN75YsciWZFaZX40h
 BR1G3eWGv7ZtpJ/pRV9J7u4KbWwv9CrRlo2rNTm8Tvuh1lZdZYaWTR/uUsXc0jH4WJ
 QNraMw7ZPv6C8UOSaCOfJCdDfA88R4JDv94glB2iLguZOP7O7JpJ2jPuJf+EFn18Gl
 4MeoSApqEZ5+HMuU9pi5OcbVfi5WJxMWOP9QGZseuedzxT78zRhCp2fsR+voenW6Ef
 9Gak4cxgvdULg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=miy92QTK
Subject: [Buildroot] [PATCH v1 3/5] package/libosmium: fix double space in
 Config.in comment
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libosmium/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 3a4c64e9d2..825e2b7e33 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBOSMIUM
 
 	  https://osmcode.org/libosmium/
 
-comment "libosmium needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
