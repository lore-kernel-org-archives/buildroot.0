Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68930C021A0
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 22:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD8D8100D;
	Tue, 11 Feb 2025 22:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0VORFCxCPez; Tue, 11 Feb 2025 22:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D64580E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D64580E6B;
	Tue, 11 Feb 2025 22:26:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 355766C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF0540180
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_8pcVtWYTrC for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 22:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1924E4018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1924E4018E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1924E4018E
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:26:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AA46B5FFB1;
 Tue, 11 Feb 2025 23:25:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Feb 2025 23:25:59 +0100
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 23:25:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Javad Rahimi <javad321javad@gmail.com>, Marcin
 Niestroj <m.niestroj@grinn-global.com>, Sergey Matyukevich
 <geomatsi@gmail.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <Z6sit8qik21z9jj3@ryzen>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
 <Z6scc31LdTE21rU1@ryzen>
 <CABGWkvpMURxUinVjRe43i2nmnzz59rKE8TQUh3WgJTMu3NxX8w@mail.gmail.com>
 <Z6sit8qik21z9jj3@ryzen>
User-Agent: Webmail Free/1.6.9
Message-ID: <4086215a2d992582fdb1d77550835831@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739312768;
 bh=7g3f7SlZMuKLQnNcNW2cr7k8bHJ4sNg2257/vIzetaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KD5cJmyDRfxWvPnykUKsg9eM85yYF2n4Cdb8fjbaJ+B1VwNf2V7u+fHn0ZcOjOBeE
 vhBvSuxdsSVrPS0oCGPQChTntldfE0c7XEOgDgnUwCIN4C2ayKePL9GjKz4/6NtvGj
 bTNR06UPwzUtSfGMDFLmmi4ZF8j5ihPjg7xssnL8Oby9WuvSR0HUdKTBKX2o0BVdMR
 1PA/M90eWlafUZZilXMShLm9E1UhKdENhVTTUlzjSJFOQINl8pZ2CnkdAtV3yfPlc9
 il8GPwB9Umv8PEvhEmRBIIZ3d8/yVrfMwUWWEju4/N4wg9U4pLmE6IIIxv68gDM3sR
 Qy7z/7NZmFdOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KD5cJmyD
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Niklas, Dario, All,

On 11/02/2025 11:13, Niklas Cassel via buildroot wrote:
> On Tue, Feb 11, 2025 at 10:53:28AM +0100, Dario Binacchi wrote:
>> > Hello Dario,
>> >
>> > here:
>> > https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/
>> >
>> > Julien said that it does not need to be /dev/null,
>> > and that it works fine with just an empty string
>> > (if the default is the empty string).
>> >
>> >
>> > So, shouldn't you simply be able to remove the:
>> >
>> > BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
>> >
>> > lines from the defconfigs, without any need to add any
>> > BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>> >
>> > lines to the defconfigs?
>> 
>> Since I can't physically test the patch on the board, this way
>> I'm sure that the modification is definitely backward compatible.
>> This is the rationale I followed.
> 
> Considering that the problem is that the build fails if you don't have 
> this,
> there should be no need to physically test on the board.
> 
> You could simply build the defconfig for one of these boards:
> $ make foo_defconfig && make
> sha256sum the uboot binary.
> 
> Then apply your patch and:
> $ make foo_defconfig && uboot-rebuild
> then sha256sum the new uboot binary.
> 
> If the sha256sums match, I think you are good.
> 
> Personally, I think it would be cleaner if these defconfigs could drop
> these lines, since they shouldn't be needed once your patch is applied.

I was able to do some more tests around this. I tested with
orangepi_zero_plus2_defconfig, since I have access to a board.

So, some versions of uboot (e.g. v2024.10) are building fine when
SCP is empty, but build print a warning. This is what I initially
seen when building orangepi_zero_plus2_defconfig.

Some other versions of uboot (e.g. v2023.10 and v2025.01) are
failing to build by default, but can configured to ignore those
errors with the uboot make option BINMAN_ALLOW_MISSING=1.

All versions are building and booting on my test board
if SCP=/dev/null is passed.

See upstream commits:
https://source.denx.de/u-boot/u-boot/-/commit/b38da15a054c4ce5ac7c46147995f1387ab24d3b
https://source.denx.de/u-boot/u-boot/-/commit/8bbd8a35942aee05adca4c8909b133df23b91b3a
https://source.denx.de/u-boot/u-boot/-/commit/bbc3d12516ec759379d71819ff49b8574f233aec
...

So, Dario, you were right to be conservative. Thank you for that.

Also, reading the uboot documentation:
https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/board/sunxi/README.sunxi64#L64

It seems this SCP is very specific to sunxi. There is no
infratructure in Buildroot to build it (or to download
a binary). I initially thought this binary would come from
a firmware package. I now see a limited use of such
BR2_TARGET_UBOOT_SCP_FIRMWARE, if any, in this state.
It is also not completely fixing the current issue,
due to the different behaviors of uboot versions.

So Peter's suggestion to avoid exporting globally the SCP variable
(and other download infra variables) in package/pkg-download.mk
seems a better solution now. See:
https://lore.kernel.org/buildroot/87zfis2zsg.fsf@dell.be.48ers.dk/T/#me93f1a884e422fea63917d4c7992291a38dba4f8
I think is worth exploring this path.

In the meantime, the workaround can still be to set:
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

> Kind regards,
> Niklas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
