Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A97C02184
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A69607E8;
	Mon, 13 Jan 2025 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZIH-xrTBNBu; Mon, 13 Jan 2025 20:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3641660807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3641660807;
	Mon, 13 Jan 2025 20:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2710C940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE9E481067
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_9mMlDidLRF for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26F3781046
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F3781046
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26F3781046
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1t8WP91KQR-00hnmF; Mon, 13
 Jan 2025 21:05:28 +0100
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:04:51 +0100
Message-ID: <20250113200454.3108562-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113200454.3108562-1-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qRxZBy5u9nVTiISvJ6o/VxqIEwYrn17K6KbAW3FgKICBZb0ZZ9F
 xn+ugkokGDOI+QcdL2ctv8mqdXKezACGA+tdRFbjYfs2OCcmQB+hJF+t9al3KeYBoGLcmW2
 rsj+EJ6dxk4dKfxFydZOvOwN4YcP0/HH3xX17DRNK1uJvoWMzriKpc4vHY8dcFMEVwO9Hc5
 xMldHUCayP1SZ8LpbiHVA==
UI-OutboundReport: notjunk:1;M01:P0:yNYY8fGaS5c=;S/XJ+jwI2vaHm33/lDT1xYryodj
 f8ScOaLeLLOVgeQrwicSgcui+3ADrOCCl+mAnz5cnVX2l5R9fN2cHsgsymftgQ4W1IkmhHGTd
 5pDp9rsmE/aE95M7+gka671UF6SGNcwNgfq/bmt0GYpCRrwCwuHxEMM/rFv/eu9u5sRw99RUz
 LN/P9UNGhnQNTX1QiXujC5lx/ENLCczMg5OvhRc6H9bEXos5j7+XMM1rHTChSnhkI9YAGrDPF
 k2qGawLvzdNJw37Mlo6Kdll+r5GACsPuxmbdrIJsOm3BTXpzMJ0LSSe2wfmguHdNKs++qsLQi
 pw/HjHfHCQ9ptjEsCKeYMEwpvlMPG+hNwRWVFO+xQj3tMKplNpfTmTGbViJpHBtA57dLh234h
 PuCTrdQTYtjaFILczdVOAdMHa6UQfO6Adm7xUpxVXCpar7QIzYiEZKGlqzQltRcxvOHr2GJbN
 bBU9S+w6u0A3gXlDIbg7Da6PUtJr2CCDP9peRl8Cl2zTJAsHJp5ShCcxn+/4BQZ3IInIFzTT1
 JKG2Ix/d+VcvU77JjlVMiZOlhYB5SKc23XheEfCLAtvSMZORkRW5o8zKpcCWer7U82d1qvlqY
 oW6grWY8xe3dZfiSylxX01WkkCCqRR9PsGUSXlmRv2o3PC3Tnlpg/bNf6PngmuPIGT2dVGc46
 IXQz3/Ltxg/TqZjqZJgQ0rWbnTrxe9ene161uFUVRofOTHdvHh+BqyL25NfaP5KWML8741ohl
 ASnnEFXGvO8WWet/gv4biMEnL3KSa8l7HG6zKWCbHNSU1HuaNLWD2MAZgrwDpSRqEA7jaMcdH
 na6GFHyCcyR7GKmpPUDk2C/lQn3bLG8CxWjm7SQQVfneEwfS04olewBkbRQo8E9I6kY1t/Acm
 PgEoNFeEIX8uhOizWhJQ2hMVlbgNRilsnBhmeEJjfUun76ac92yktTPesx1i/PkVkvg6YCtsE
 Kar3bmRi/0UQO5pnITTLOnwjq+E+bAet6OgK7CnOOSj94x9Yb49mDOGly8wU+T3gltO5JE70J
 t/TA4PkYElNhtKhqvlUJ8CAQtt0MGeDkFbffpkkTgc49bPtVE+jDE6NMaBbEz8KHnKDPTd/qk
 Ajrr8AXMTo0YbbOsOTY1LtUKAUoZ+c
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736798728; x=1737403528; i=fiona.klute@gmx.de;
 bh=vqw6D5wbXbZnEDcVhsbVe6z0Da5QV1DyPgVq/ZA8o38=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GHnftyBEQ2bI2q1glT9yByuTitP2jY8WcCDcbocjfgGKpuU+5mVbcDqH4AdXrN9X
 MpGM1CKCP/kEN0sWpv4Ugf+1MTewLHyBsNB7Omj/d8v2T3Z3lq4+jLExGhBLrU1lF
 ezg8ZSGQZP4ygjDQPi8qI56uCayOT7G0O5rdKNQ0gPFE+kj52F5SAN3FNNH2WzxhW
 zqfDe9zVXZZd8f9bRW64hYaGA8PmC+vixeVvfMQy2ym7lf8JwXJNu0ev2pNmXKxqi
 1BKq+5RBLRxRdLidAzeuGOEhXb6zmkZ01iDfuY/iNRDfkI6K1a2NHnTZN0R0/fjvp
 4kIApGNcsQSRkarHvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GHnftyBE
Subject: [Buildroot] [PATCH v7 2/5] package/gobject-introspection: works
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
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
