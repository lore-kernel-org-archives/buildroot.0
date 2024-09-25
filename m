Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF42C369AA
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B036112F;
	Wed, 25 Sep 2024 09:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf6hM0GchrCE; Wed, 25 Sep 2024 09:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A5956113E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5956113E;
	Wed, 25 Sep 2024 09:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8F8F1BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8464848FF
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHC8PmiT0B6f for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33BA7847EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33BA7847EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33BA7847EB
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1s8WcV0uSI-00efmq; Wed, 25
 Sep 2024 11:05:45 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:22 +0200
Message-ID: <20240925090526.3462217-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nXKlfPDYDX0mLMnwm/86fet43997WLL/GwSFwzym+guDkq7JJan
 K+97mZRrLtjyJFwHcYhErkXTD1hTyKXsxoGbou3bGV4M2lFYoDZO8gsxZMu3CK3850yxCEt
 u5afbZD81gbbB2Z52jgEabUFxExAX9hcbboYRWSRH4vDXjerHPyeJ/RmtaU22Bsn53iM5XK
 Fubu73uMa2i2DBGTKV62g==
UI-OutboundReport: notjunk:1;M01:P0:6thS5YJJR7s=;+2PV4v/z3EYbOTpYBCBZJde1vM5
 +QVVy2xUPrZSDEIQ87p2YBGBIhe6gkvo++4NYkqmErEn6CQOnU3Qof9Hk7dlj6q+wzTq6v67K
 KIQjGYuudo/KFmZV+I2viYUsY3lorizMVGGiZvmmoKzEeh/cZ08nvxoWbUtCOe/OtC39I+uW4
 poEEYbM4EK54xFeQ0eoj53z3qy8Y8OTK7yGRrqq/zaC/qygCAqWpW0pZNTXYHAF23Nt/t/Mag
 6bV4g8lfXw+G7FvEiAzDEED2bNBYWb+Bf724eDqZp4ZNMahEAVuzld2scMr4PShGn7kZfPgEj
 FfxjT7hM6MPDiTXnUxTe+8KVJQ5AWz9KuGHENA63ZfNA3KWpGTz1i9b3Gq8TZ2ag54h+8G5K2
 eKlg8Zwis2SCv9sLA6sv3qo36ZsUknnE1WIVtYPShdh6efw8eXSntf9awYM2VqLpLl+KGNCMC
 2Z+kIWmePI7FXfjF/VfHYMLgXowLWw98jefb4A5ewbQCsOoNqp/v/a+3rdl6uv7ezcvW4GR3y
 R0lu12NRN9CjTLdDq+y2nlZTCbstDfvQqXhUEw1wPZmyLI6Ok1DOwBl7c/MPCFVFoOHzSzMS0
 OVGwaksEzg+dGS68dOSBBAJK3Ya27nvIP9mt2OEfMltygy7h5SA/m5/SkeI2NGIxoIx/YcPK2
 8WSEc1FFThwWzokLsz5vYPwdPuL9qGC8JTUqEoTDg1Wj1qFTNX1z+sD7wEQGu06q80os5xUPU
 xdt4WEwNoHqJySk0dPiiHZwqKxPi7rS9I26G+fT0iosVxAnJjTjZZYixXDaiTNobQAeXvDrkX
 ytZpyDIK3op2kQ2Zm3W9b0iw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255145; x=1727859945; i=fiona.klute@gmx.de;
 bh=m4XkB+4IF2szZ/IC1W/BaEqEIf4/gGRfl71gHHiF4bQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fqfxbReyq05CEUlKSwEB+gpkCNxPL1uK6wbBTSwHRArKwpvuicmVIPd46sylNbkb
 jCOD8ImoZm2h9idS34vw90NfqM9xcwmNOfUIeS5vHvEQHpXJtO5q4cQ5r1S/3ILhD
 9SY+234MiiDM1Ac06LnfSL8Dv9axfFYzm6VqrHfEEVfDnxUq/xXQE96zq7w7an+Uu
 yLW5gMPH/lsH1tEF9te8RCc0oIjAsXcT4pPoya81JQZIZL1FG6Hn5GYe14pNdipI+
 Gq13zybrfYlicRWOH9EXo9ZAdXkt2q4qeGgHX3jl6sxyjAjBzXyVXdjhe7ebQdFYK
 E9x98kdHEsG2hNJAaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fqfxbRey
Subject: [Buildroot] [PATCH v4 4/7] package/gobject-introspection: works
 with musl now
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Fiona Klute <fiona.klute@gmx.de>
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
index b8a9e244a6..042760b430 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
 	# cross-compiled python3 must be installed to staging. As there
@@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
