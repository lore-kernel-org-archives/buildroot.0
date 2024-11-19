Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA50D591A5
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 16:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2767D60BB0;
	Tue, 19 Nov 2024 16:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojGmsnL54sRz; Tue, 19 Nov 2024 16:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3836960BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3836960BC3;
	Tue, 19 Nov 2024 16:35:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 056EF27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E763860BC3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 16:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRdWPiO0PlHS for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 16:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F370460BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F370460BB0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F370460BB0
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 16:35:37 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0328178034E;
 Tue, 19 Nov 2024 17:35:34 +0100 (CET)
Date: Tue, 19 Nov 2024 17:35:34 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Message-ID: <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr> <874j43g4o8.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874j43g4o8.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732034136;
 bh=4PCvS924T3BCvVpTVbE+iuehsStdnTqPaodAknLaUEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLlvcF1mFwGrU8PfaGGrNTcjxEL52Q7aSHO/TRCqWo0aVs2PQmuqj3vs7nQZC0fMF
 0LDT28DvEebemhLNxdnUNq7zKRqmg1Dks9u2IsAiqj3acclIAvnGCnqVoUlNY25m9X
 XvgvU4TNe2tDKdSQiEhV1LkdcWdBBWxazUGJDeUb27bRR9LXYikr0sMqgKZ5U0HPf4
 beDND2dl5mARpqqIeBkvZ+mhEwpYeAyKme/nh4W6DbaxfdWV+M0XAbc5Zc8CMIi+gw
 uf7NdCTDYiIzSyFpAD2NdD90NhuPmSVkPdqXcq/Oo5aw2qDX5RBdyaEsfw533xk1EN
 boinPW5sQsDMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lLlvcF1m
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Tue, Nov 19, 2024 at 07:42:47AM UTC, Baruch Siach wrote:
> 
> I think this should depend on BR2_TOOLCHAIN_USES_GLIBC. Other C
> libraries do not provide NSS functionality. It looks like this won't
> even build without glibc headers.

Thanks, done within the new update.
  https://patchwork.ozlabs.org/project/buildroot/patch/20241119163025.54898-1-vjardin@free.fr/

Thanks for the suggestion. I think I found a way to check it using:
$ utils/test-pkg -a -p libnss-ato
                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
                    bootlin-armv5-uclibc [ 4/41]: SKIPPED
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
             bootlin-microblazeel-uclibc [10/41]: SKIPPED
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: SKIPPED
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: SKIPPED
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: SKIPPED
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: SKIPPED
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: SKIPPED
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: SKIPPED
                   bootlin-x86-64-uclibc [26/41]: SKIPPED
                   bootlin-x86-i686-musl [27/41]: SKIPPED
                   bootlin-xtensa-uclibc [28/41]: SKIPPED
                            br-arm-basic [29/41]: SKIPPED
                    br-arm-full-nothread [30/41]: SKIPPED
                      br-arm-full-static [31/41]: SKIPPED
                   br-i386-pentium4-full [32/41]: SKIPPED
                      br-mips64-n64-full [33/41]: SKIPPED
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: SKIPPED
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK
41 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
