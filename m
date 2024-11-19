Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C76D62073
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 17:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D0660A5D;
	Tue, 19 Nov 2024 17:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fku-nf6FeoZk; Tue, 19 Nov 2024 17:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1055B60A67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1055B60A67;
	Tue, 19 Nov 2024 17:08:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0FEC27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 17:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D239F845E7
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 17:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjKaBHP86g0w for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 17:08:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 941A08451C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 941A08451C
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 941A08451C
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 17:08:04 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 1121A441051;
 Tue, 19 Nov 2024 19:04:22 +0200 (IST)
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
 (Vincent Jardin's message of "Tue, 19 Nov 2024 17:35:34 +0100")
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr> <874j43g4o8.fsf@tarshish>
 <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 19 Nov 2024 19:08:00 +0200
Message-ID: <87mshvdudr.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1732035862;
 bh=54VFKUkoz8jxBr0r9q9sUPJwBE2ZFexd7ndPX6okU2U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Amw1vuvWKA+onHOA3WjEt5tuI4oIE5mgNSX3/JwZ5+aZTUpEcsJPHRijVobYmd88O
 5KxBbgZRew2dTH3mSaCs7WFwEXYa1VaS+dMvA8EN3UsgW24gcW0OaW5KvkCjwDQy4U
 3//prHBiS+osw6Q9u7M5hMhQSLu07eYCfPn4rRVM5Cl+ED2MEt6pOFXJeyy+N0ss0E
 dv5w6ABd2kRGNqBqYr4OrNq69gyvPAbf7JD+9F25E7fpvObBLjbZkaDW+lv1/Inmg+
 LFU973t8dhZQRa+V2mhVpp1WmB+y0aHeeRHAaAOJGquHg2a+GJHxysY5dCUuk8RQuD
 FRTtYh0yKkRQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Amw1vuvW
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On Tue, Nov 19 2024, Vincent Jardin wrote:
> On Tue, Nov 19, 2024 at 07:42:47AM UTC, Baruch Siach wrote:
>> 
>> I think this should depend on BR2_TOOLCHAIN_USES_GLIBC. Other C
>> libraries do not provide NSS functionality. It looks like this won't
>> even build without glibc headers.
>
> Thanks, done within the new update.
>   https://patchwork.ozlabs.org/project/buildroot/patch/20241119163025.54898-1-vjardin@free.fr/

Thanks for the new iteration.

I guess you missed my second comment on your original patch, regarding
Makefile.

baruch

>
> Thanks for the suggestion. I think I found a way to check it using:
> $ utils/test-pkg -a -p libnss-ato
>                              arm-aarch64 [ 1/41]: OK
>                    bootlin-aarch64-glibc [ 2/41]: OK
>                bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
>                     bootlin-armv5-uclibc [ 4/41]: SKIPPED
>                      bootlin-armv7-glibc [ 5/41]: OK
>                    bootlin-armv7m-uclibc [ 6/41]: SKIPPED
>                       bootlin-armv7-musl [ 7/41]: SKIPPED
>                 bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
>              bootlin-microblazeel-uclibc [10/41]: SKIPPED
>                 bootlin-mipsel32r6-glibc [11/41]: OK
>                    bootlin-mipsel-uclibc [12/41]: SKIPPED
>                      bootlin-nios2-glibc [13/41]: OK
>                  bootlin-openrisc-uclibc [14/41]: SKIPPED
>         bootlin-powerpc64le-power8-glibc [15/41]: OK
>            bootlin-powerpc-e500mc-uclibc [16/41]: SKIPPED
>                    bootlin-riscv32-glibc [17/41]: OK
>                    bootlin-riscv64-glibc [18/41]: OK
>                     bootlin-riscv64-musl [19/41]: SKIPPED
>                  bootlin-s390x-z13-glibc [20/41]: OK
>                       bootlin-sh4-uclibc [21/41]: SKIPPED
>                    bootlin-sparc64-glibc [22/41]: OK
>                     bootlin-sparc-uclibc [23/41]: SKIPPED
>                     bootlin-x86-64-glibc [24/41]: OK
>                      bootlin-x86-64-musl [25/41]: SKIPPED
>                    bootlin-x86-64-uclibc [26/41]: SKIPPED
>                    bootlin-x86-i686-musl [27/41]: SKIPPED
>                    bootlin-xtensa-uclibc [28/41]: SKIPPED
>                             br-arm-basic [29/41]: SKIPPED
>                     br-arm-full-nothread [30/41]: SKIPPED
>                       br-arm-full-static [31/41]: SKIPPED
>                    br-i386-pentium4-full [32/41]: SKIPPED
>                       br-mips64-n64-full [33/41]: SKIPPED
>                  br-mips64r6-el-hf-glibc [34/41]: OK
>                br-powerpc-603e-basic-cpp [35/41]: SKIPPED
>                br-powerpc64-power7-glibc [36/41]: OK
>                        linaro-aarch64-be [37/41]: OK
>                           linaro-aarch64 [38/41]: OK
>                               linaro-arm [39/41]: OK
>                          sourcery-mips64 [40/41]: OK
>                            sourcery-mips [41/41]: OK
> 41 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>
> best regards,
>   Vincent

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
