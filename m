Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF3BC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97CC40382;
	Thu, 15 Aug 2024 13:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hIMiCDOLAqH; Thu, 15 Aug 2024 13:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28004071F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28004071F;
	Thu, 15 Aug 2024 13:20:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 185FA1BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1356F80DD9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGiyHZaJM-TB for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26C2680DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C2680DE5
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26C2680DE5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:20:18 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id A5D30240E74
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 15:20:16 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 8934B240F6E;
 Thu, 15 Aug 2024 15:20:16 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3CD95241975;
 Thu, 15 Aug 2024 15:20:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 15:20:15 +0200
Message-ID: <5464720.31r3eYUQgx@laptop>
In-Reply-To: <20240815130312.526791-1-kilian.zinnecker@mail.de>
References: <20240815130312.526791-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1216
X-purgate-ID: 154282::1723728016-074CE779-357C0176/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1723728016;
 bh=J/Hi1aLAY1Jot8EFFc/89TChdHZoPh8hNzglJszxwS4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=PGjeImH3Snm3RYYWhoggq+Xkmnm44cbRcFgyeL2XbrFXoXpNWiQvBQkK/vlHIw56n
 /NMNIbJDnxGDhQ8SIdkVuQHjjA8cN8cdgLPrajAi6mEu5ie1PoMnel+JlNioC28CTy
 uK+8bQWruSNibhHLhLtU4wfdObSDVB7vmPpm+e+u0S0oyUTfJB2cChe6zqny0MZBQM
 adH57hJMxcIDlPNejdeETL9wP+oBVLmTCELAmEppNMqDNAzPL/jIZHuj1I7UpQzyHr
 tJ3sTWoHvLOgGfIwjBObdSvA9fxSexJMlZvzW8ts5qBgJEoNjLijN7Y8Hauav2cCHR
 jO43XGQFiZKSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=PGjeImH3
Subject: Re: [Buildroot] [PATCH 1/1] configs/bananapi_f3: new defconfig
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

the board support still has some flaws. Maybe someone can help me a bit with 
it:

[--SNIP--]
> --- /dev/null
> +++ b/board/bananapi/bananapi-f3/bananapi-f3.dts
> @@ -0,0 +1,15 @@
> +/dts-v1/;
> +
> +#include "spacemit/k1-x_mingo.dts"

Maybe someone knows where to find a more suitable dts for the Banana Pi BPI-F3?

[--SNIP--]
> --- /dev/null
> +++ b/board/bananapi/bananapi-f3/post-build.sh
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +set -e
> +
> +MKIMAGE="${HOST_DIR}"/bin/mkimage
> +MKENVIMAGE="${HOST_DIR}"/bin/mkenvimage
> +BOARD_DIR="$(pwd)"/"${0%/*}"
> +
> +"${MKENVIMAGE}" -s 16384 -o "${BINARIES_DIR}"/u-boot-env.bin

I guess I should rather be using BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE here?

> "${BOARD_DIR}"/bananapi_f3.env +
> +pushd "${BINARIES_DIR}"
> +cp "${BUILD_DIR}"/uboot-*/bootinfo_sd.bin "${BINARIES_DIR}"/
> +cp "${BUILD_DIR}"/uboot-*/u-boot.itb "${BINARIES_DIR}"/
> +cp "${BUILD_DIR}"/uboot-*/FSBL.bin "${BINARIES_DIR}"/
> +cp "${BUILD_DIR}"/opensbi-*/build/platform/generic/firmware/fw_dynamic.itb

I don't like using wildcards here. Does anyone have a hint for me, how this 
could be done better here?

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
