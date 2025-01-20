Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C09C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6C840457;
	Mon, 20 Jan 2025 21:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ibUJI95830D; Mon, 20 Jan 2025 21:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F6E9402E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F6E9402E4;
	Mon, 20 Jan 2025 21:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB1369
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD374145A
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pN3jWBNEW70 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F65741458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F65741458
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F65741458
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbirE-1swn2r1zm2-00lZy7; Mon, 20
 Jan 2025 22:17:31 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:04 +0100
Message-ID: <20250120211707.2381182-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HPMI1WYP4pSMuEUYUoX51cdwRMcMy3hrxM15nFr73PQvl/ei6hD
 vr6xA8WLKvniOEe6lzIXBd1KJ4+fvDPX0Ap+YttMd/xFkVTLgzLDYKT/bmWps+HdW/k+KjV
 sAPD8HdwvXfE9Wz2m1bGzTl6WgyiVji9mPIZd5PC4r9vTWTLFbsqGWCz5H5icxP4AngqxS/
 K77k8iisPRa5MuLxulc5Q==
UI-OutboundReport: notjunk:1;M01:P0:Jnajhd++DJE=;N5ZEwQ4O2usyBJdkuLf4civB/de
 fU9h4Gpi1512yrAYNbjMKO4dat8+oxR/47nFB1kPoqg1RILroZJpC83UG3E1nQAdv54KCUYR3
 JctLz6Tzo5mDbaO4cgLX0xwL1j6EBreD2BH+VAyDEp84KnsLICpy8470KOhAFMjqenZguqdCo
 P3oP+gZUrnBOJPnAjBnA+VBDvOncmCHmyrTzpOoIpPxKpzuhneobO0aeRjK4OX037u4pBoeV5
 vvYAwsqfrF/ALfkdLLv1pvq1HGdhBuPYdArwtx2wbVaHZCPi9ujC0gvyIUeO0t4kJZ/vCvPCO
 PPbaZsIb48vJnnzS2qVEUk/nZVgu/LP6SBAj6WDttKqcpUEBcR8o5/x2hL0tI5hOvT21TYufL
 54PRkMxWEGHroL5GjIR2LhwmFS1wK9TJ81zgbXt1SA0AyvhnLExiTiQizRFR/jg/Tha5v2CWG
 uRK492RsNljZpYpw8d81q/Cc1nLtn1bC7YBRsBJL/NP5X+1Bd1+zWE4OysXdTWyNiAzGmQew4
 X0mwuo7VhMYd1j2q+Hf5ZbRJYrkG8E/zrzx0mJzC+R5YYSZ1stK55i28J2UgD1k9RNWXB4C8q
 d8ZvZnv8PjmiFGRTyIEGdoH0wd8HjjTMEkPNTRy8JVjFKqVwNx5Q3lUEetwzIGaLz4+/0LxS9
 RHT/bSmBI/ercyGiyxQv7QPwG+r3ckkMQahQBgEq6ZeomXLS/JOQj2IjdD9kl7OXC2RCBhiJE
 cOUfZqaDPP9cFtqqFFKAI4+p7QJ68ph+5UccPhjtz/EsnmEYpxeG1ccxid3WAReMWVWIepN4P
 TCcxpcFJ6zyv09pD9lX90qU1zYRPZ/2JDtHQwvLGlpOXkjSTn8nNa3dQSk58Tm+vZYjyE/UUd
 yoxFu55ZBak868R1ifbx6dRfEQIsvWEM/uTw5NyntEkve5MG6nx5KVJy3SwwftNk4elVSP/0T
 8WUknEfHvVu5VtZOqhXlJ+9qgfKKgyavN5/yNgofGB4xYw28tBug2Ef/MU4cxhxxQURhPFHa8
 Y/yQKoH69WDcCcJ90YCH+xIk/TzMr101m+1HuIvokfk7u9aJ6sCHGgd8MvU7L1NY0ezY0ZCsp
 yftlhD+ze1mmvKwoe0anEw+uA5T+7yK4kpTUXubFrGxcmkxoZcwhcrS1ye0U4P58ehAjjWAe6
 IfpInkhz87DjJzhKX8erGJtvJjJtE2Qm8As28L6pZDg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407851; x=1738012651; i=fiona.klute@gmx.de;
 bh=vqw6D5wbXbZnEDcVhsbVe6z0Da5QV1DyPgVq/ZA8o38=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HiZ7cIAR/OkEh+xZdAMuZ7AhRn7pjP96aChcgeeCMo3G3P0z0IP1A6tkif6ezGbX
 OMDV5VdvMVSsXbFBKi23rOt0jpfdHxSyWvR6vsCsVrTHQ9ikL9MJlo8GEMej079DA
 WEP5PaBF2FG7C78vbBXPxvNB9z1I6u8M/WvxSzvi9uIlK2iRd1/79ztK7UT0m5xwW
 X14gkgpI3uJNbRnfHuIltdF3Om+SnGkK0Y+arviPYgqQdXZYJ4JFxoA35BFB7dw94
 jhENOOdXsT52e9xY8iNBahFiteR2h5v9SfJPAWAOPS9SpD3H5BUyZQpbZoe4CtbSG
 59pFfSCjSuQuOtymxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HiZ7cIAR
Subject: [Buildroot] [PATCH v9 3/6] package/gobject-introspection: works
 with musl now
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Current versions of gobject-introspection build with musl (Alpine
dropped the last compatibility patch with the update to 1.80.1 [0]), so
relax the dependency on glibc.

[0] https://gitlab.alpinelinux.org/alpine/aports/-/commit/528c4ee63970fe6ee733b6ea99ef7a59a8f108ff

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 7b47c9561e..54a33d8666 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -48,9 +48,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gobject-introspection needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
