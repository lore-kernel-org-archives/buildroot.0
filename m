Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49CC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDB681233;
	Wed, 26 Jun 2024 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Habb7lLMtAjj; Wed, 26 Jun 2024 15:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B4F81259
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B4F81259;
	Wed, 26 Jun 2024 15:00:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB2F61BF271
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91E1606D4
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nxsv9TzlMG13 for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 15:00:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78EE4606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78EE4606AA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78EE4606AA
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 15:00:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.117.148]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1sWs0P0B2r-010VZ7; Wed, 26
 Jun 2024 16:59:56 +0200
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 16:59:42 +0200
Message-ID: <20240626145942.3154406-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:N6ZBtcy7+STdNZ9vMjIafYD4h7faCh+LIgL0EKl7Hu63Ma+rebe
 Ji34Urvmclf4PECnsNpGCzNKOwRAu8HZbM4E3KKhR98vVLFq9phfegeGAqS6rpayUPRCeKl
 YFWId1srijaKpvMlAShaAJkQhNZQOs54vHwgG944q5gw7wBnQLoQGof3NtSZJGyWGHMno6r
 3pQNWRtMdcYXok2wwH5jA==
UI-OutboundReport: notjunk:1;M01:P0:k+GFbenrgak=;ZRHafnLCTJwWjInNYV7i8IwUR0e
 vzyQgo8MNFtD5gODjcYs7CMPsEPcmU8W/urJFPSz+mYYtPp5PPnVrw/hda3mJBQwpuLDo1Cuq
 XXCdGa54TXS6JRHNrLPfjlf5V1uDG2396gvxugJYOJjzv0WEEImA2OHPmOvbbgeCQQ5uBcTw6
 O9kRcAMYb7n6os8E+IdUDoF0wZmmkMjp+ggnmGp/roqoD5S1XO/1wBGEL7I4rV3oSxyJ3CCCD
 2MVXWjE+PS8XdziMO0efuWh8mHjVJqFS+/rVQVOp5jiUNt2G3d7xdYSczKLOr2uNik61wnWrC
 lDj//xfLRypjSR3Zs7hVwsNCfdhi/3+VIRZXklnRGRw3JmhD6q81mzwHMKf5i2xj8mYH8g/d9
 sScc1TMpAtQoBRqizpIREKCMcI/utMZrZls1FuSsbnGnxWd30/bd87vwVjAVs9BVQgIZpkJNg
 tZx8P9UyZHS2mHh63mxyrmjHnwzlxyHVW4vgbehpBvbUJK4e1MtD65HQqhPaj2X5wF/NPle//
 +AdYXy5gYvq3kaSJtN4nsc0Wz36OFI3kENsUjHoDXSU9ZlmGNbs40bNpllE+PMvaits0jTRpY
 ZVTL9eDHx62wH0wFxNvFh0e6/ZOpb3P0x2o48MGG2RlV1x3cjqUmiY6LicQdCGR7181J07jnS
 dHzVmlfFzuEjINoOnWPYN8uPPhYxmRCKv2/7UeD02x8VC6hoFQBN+RAJRHz3p/LeGvHDaCHp3
 kU8N2KtWr1quQGKwDTBcIUKMRk6yWVfqTZHZa5mTFws1nhb3Zf+QEs8vjXtCL4LJ+MZNVPYlv
 vsWx2IqlMib9xl/8eyDlv/i2Tz3q+ia8gUqd3Tq2F4oF8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719413996; x=1720018796; i=fiona.klute@gmx.de;
 bh=di9ReBA+hduw5yLnFzbuMdNeK0MtsCN3jQMt4VUklic=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o6/fbt6E8Z08E414Ra7ujvzwuWBid94lnCHiqb0vUjPHtQZmeaH+3VwejVqb6Ise
 mCLLiuDorlQKGB4b1X5xYd98EyVi90jSKtY+7tCojXlDAsLP0hNHnr7y6TeMs3Szy
 90O98+uVN6wSbAF+JAMoBzQ1rwu20LJOeucSJ2BS/b6Y57PPnfuQc7JBXSwzvx5GO
 hQ1lQcF6hSW+snKgX5+KX0+eXJkeOkjhaxEv+u8igY0abthlyZZIFccqZ572B6MPj
 SyZmbbnyB6KLjysocnsc0a1K7fD7ciZRUx1R5W2Xtm93xXjvbrjD5FPDwBohqyfJ+
 pHy/z5+FnmtWCV66pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=o6/fbt6E
Subject: [Buildroot] [PATCH 1/1] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes link time errors, undefined references to various ENGINE_*
functions (paths shortened to the output directory):

host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference to `ENGINE_load_builtin_engines'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference to `ENGINE_by_id'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference to `ENGINE_ctrl_cmd_string'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference to `ENGINE_init'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference to `ENGINE_ctrl_cmd_string'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined reference to `ENGINE_free'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined reference to `ENGINE_finish'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cert':
signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cmd'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key':
signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_private_key'

Before linking there were matching implicit declaration warnings
during compile.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
I assume this is a consequence of
623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine
without the option enabled.

 package/rauc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 7451b29a55..69a65d165b 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
