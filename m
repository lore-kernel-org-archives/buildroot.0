Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B413C77B78
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 21:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80EF40A16;
	Tue,  2 May 2023 21:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A80EF40A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehsYJ8E4o5tF; Tue,  2 May 2023 21:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD025408D7;
	Tue,  2 May 2023 21:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD025408D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F6E1BF35D
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF27360F0F
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 21:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF27360F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33qSEWTc_GzU for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 21:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6664D60F0C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6664D60F0C
 for <buildroot@buildroot.org>; Tue,  2 May 2023 21:12:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315712406so1566705e9.0
 for <buildroot@buildroot.org>; Tue, 02 May 2023 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683061922; x=1685653922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nugFwXGQfcLSLvDUT3Tt47ZFhrCUUcAf2vwxeHxOI84=;
 b=lduVhPADhd1B1mGnhJuQmbtawuBRZYzx1R/6kKL5E1xyJUboQogN0SgyolAiE5DoeJ
 kGZRmqZINsA3y0fVdiIog6EZLJ3U37TqMUR2zo6JwLZgvV570kKy9y1lSj1uuChBssEz
 8Ub+/L9tBsg708QteKGETNyrVfSaSoACIkJPqrPvxxM/B34wZftTo9fMpgn58MjFB+zh
 Q1sGhNP/hJys/lUScrq0xsq/0Cp9jlw1wRYQEkxittrQPOcyiNpMsdHqC4g9fyWINh+8
 yPp+hatiOfApLP+Zkp9iA4t2hymfkW3LTucR40tTr11XmPLSAMQa3G7XVTnxxfl5yekZ
 upew==
X-Gm-Message-State: AC+VfDz9p5ozNYkDi7hjmrI/8H0uVB2DiEfiORUbG667MzNY6ECSb4yT
 13cX8HYr5fkxsGQ46mJcXC6IILDKjNE=
X-Google-Smtp-Source: ACHHUZ77JkRXjuhRPaXmstkOXk0tO7GnMYjWOuewV5Dq3/RcpXVD07ii8V2IjFPQ1ygEuM4EsH8Eag==
X-Received: by 2002:a05:6000:1247:b0:306:3688:e5dc with SMTP id
 j7-20020a056000124700b003063688e5dcmr3472462wrx.10.1683061922545; 
 Tue, 02 May 2023 14:12:02 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adffc52000000b002efacde3fc7sm31767609wrs.35.2023.05.02.14.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 14:12:01 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 23:11:58 +0200
Message-Id: <20230502211158.2832484-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683061922; x=1685653922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nugFwXGQfcLSLvDUT3Tt47ZFhrCUUcAf2vwxeHxOI84=;
 b=bptEtQjGovmn00PLme5aTrExYWFITzHLEUL8bRiT9v/NdRf2AKL5yjOWes/xuYaUW5
 XBpOIORdlEK96pEP95C9I5q37239A3R5o/lX4nX1Oyzedko6YN+4wfZbsokybihEWcpD
 21qe6pUANtiUareJUixQny383t6zw2K73OxvQ4erAIL8ToIu7Hduq+W1FcxGX3+4vVjO
 dCiQSdA5DPVS/YvuXRQ0Lo6JaIrMhR3nccm3bPxMR3Az4EBMCVfGg10Op1CDxquhRk8X
 EwgIIv0HQdhnYYWveCcezgxVEk5wPcDeDxEj6ISjq63vddEzv3Ty0h8XsmUlyG6twkBZ
 RATA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bptEtQjG
Subject: [Buildroot] [PATCH] package/gdb: disable gdb for or1k builds with
 musl libc
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
Cc: Romain Naour <romain.naour@gmail.com>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The or1k musl port is incomplete, elf_gregset_t definition is missing
(user.h is empty) [1]. It fail to build gdbserver and the full gdb.

[1] https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276569

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
---
host-gdb build fine but it's useless without a gdbserver on the target.
Keep it enabled for now to avoid dependency handling for or1k with musl...
---
 package/gdb/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 80b1185b5e..0800d39ced 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
+	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
+	depends on !BR2_or1k || (BR2_or1k && !BR2_TOOLCHAIN_USES_MUSL)
 	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
