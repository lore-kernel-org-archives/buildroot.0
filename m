Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6E6C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 03:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7859341B5B;
	Tue, 26 Jul 2022 03:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7859341B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74cMedOWYR-x; Tue, 26 Jul 2022 03:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E874410BE;
	Tue, 26 Jul 2022 03:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E874410BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB4331BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 03:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56BB83F61
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 03:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56BB83F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1G1_JZrKyx1 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 03:41:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA00F833C7
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA00F833C7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 03:41:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,193,1654531200"; d="scan'208";a="206890884"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jul 2022 11:41:49 +0800
IronPort-SDR: KYYEzOV2zDKEInxuhknni6SNhBpgwfyMwTDhyptFV0e88QzhnQudt73odmGVegA6qwjLyFKXAI
 WBRgfFGl2uzAaOpewb1K9iO4+u3AaUTXGGfDO5nONAJUdbdhofB/tHjAMTmZZJ5YXMWuaKJdDV
 3onKMTlp0bfxXRIHhvJwt6Diw+8vNrkm25Ur60OHcVTKWvxnMdCoPqYoUgRL1zp6srp7CXxXJ6
 UZDa9pPfvxLdvw1J8icHT4tjDkMoT54l0BD0k6NTd1s2cfKWmcuTNcz+lhrmUHflJTg4DeuUvf
 fnPj2gMBc4on7wnCcubR+L/k
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2022 19:58:06 -0700
IronPort-SDR: vWWyEJsgfQYlly3KfFHPk+rb+dAdWHBJqMaVbmOjHAcB5pHc9ZISiTHDyYMyYWr93t4PznvBpP
 2/PhzOf6ejQkfI7B8tI7Q7e9ImXEhflSyZZxmb/ZpalD6yuZlBVXzNWy8srGr75mp3DUILsyt8
 IbpO8RREtYnN0wbuN/5lgSxf4JnwRbQSvhtYVpmyR2VVKjKyyGOp2iV+z4DP+xEuq8pume6jzz
 Ylxn4nNviakEF8MxDz8UDRnMXFlgX6IyEVbsGkNw09Eqn0pSxIB1TSi59YaV3jhk9aVZW/yFPl
 MXA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2022 20:41:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LsN4t4DxBz1RwqM
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 20:41:50 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zo1J21ksSS3n for <buildroot@buildroot.org>;
 Mon, 25 Jul 2022 20:41:49 -0700 (PDT)
Received: from [10.225.163.10] (unknown [10.225.163.10])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LsN4n6BFQz1RtVk;
 Mon, 25 Jul 2022 20:41:45 -0700 (PDT)
Message-ID: <493e8a12-f32a-0abe-7bb4-ecc4233f6fd6@opensource.wdc.com>
Date: Tue, 26 Jul 2022 12:41:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Damien Le Moal via buildroot <buildroot@buildroot.org>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-3-damien.lemoal@opensource.wdc.com>
 <20220725164425.7316b2e3@windsurf>
Organization: Western Digital Research
In-Reply-To: <20220725164425.7316b2e3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658806911; x=1690342911;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NjRPAUCMbZ8vJ9ZIuy2rXKfrLKmb5MqFi7ezdWDeLCA=;
 b=PSe8iS1gf6PIZzsoPi2EPeF84ppTEBfNEFLiipMgUeqeFY5G6K7zkiWy
 /MbDmXwiRnVCa1JAc8FurdWmNV6wwWoTyMn0ogIHZvUutpivHcaRGIewH
 1566U+BAlPHG43OEpgfE7kR8Fbra9yCOw4tyOeZoPmR5Q4WkASqpr/E4Q
 2dT7AYApjvpAb6fdgfCWHcjBEmO/VWP/6hcQTliC0cC7a5CpU7jE7POtv
 TH02q4YBa8zeRG+tEIOKDoj6noC84bsJFCHltbuV2hfpeQKdK8RJ819E+
 YMsXelSgb1uXn9tgLWIVQldn2QMEwpOQobtSQygXm5CAqelpvzuBceNcK
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1658806909; x=1661398910; bh=NjRPAUCMbZ8vJ9ZIuy2rXKfrLKmb5MqFi7e
 zdWDeLCA=; b=g96ENq3+QGnV2aeqeyhUbdcoNmqWoEfozqTexPRrPIrpzsfzwZK
 PU0N3IwTL9tinSkgiSnLdAEYkN078vomddKOA1da8eIUZz594cXoQtbQjMQppuOO
 opb1dSGZ89hoTdpf0fGw9jhvebyRHvm3L2HsnYnc2Eb00dydb0fR3WfNFVFq1i7N
 01FbW86zBO4PLsZeeXB+ob1jsw3TzGKmyK8Z/7u5zfinNngH9N7AM7Xf60Qx0quI
 9mmaYLBdJbEmPNOp19G/wp1yTbRui3vl5s/IFJOBMd7uaDGTcTCNmFL44NR0Go1u
 vrbiJDF/erRuLOmamRH0S+D7dwpodCy//0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=PSe8iS1g; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=g96ENq3+
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: Re: [Buildroot] [PATCH v2 02/11] package: elf2flt: Update RISC-V
 64-bits support
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/25/22 23:44, Thomas Petazzoni wrote:
> Hello Damien, Hello Niklas,

+Geert

> 
> On Mon, 30 May 2022 12:38:27 +0900
> Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: Damien Le Moal <damien.lemoal@wdc.com>
>>
>> Remove the old elf2flt 0002-elf2flt-add-riscv-64-bits-support.patch
>> patch file for riscv64 architecture and replace it with 3 patches:
>>
>> (1) The first patch fixes the data section alignment
>> (2) The second patch fixes a bug with the handling of the eh_frame
>>     section causing text and data section overlap problems.
>> (3) The third patch adds a simpler riscv64 flat bin relocation support.
>>
>> These 3 patches are submitted to the upstream elf2flt project as pull
>> request #22:
>>
>> https://github.com/uclinux-dev/elf2flt/pull/22
> 
> We are seeing an issue with this patch applied: it segfaults when
> linking binaries on the m68k architecture.
> 
> To be fully clear, when we use the current version of elf2flt in
> Buildroot (2021.02) + patch 0001-elf2flt-handle-binutils-2.34.patch +
> patch 0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch,
> we have the following failure:
> 
>   /home/thomas/buildroot/outputs/m68k/host/m68k-buildroot-uclinux-uclibc/bin/elf2flt: ERROR: text=0x7db78 overlaps data=0x6b940 ?
> 
> which already existed *prior* to applying your patch.
> 
> However, as soon as we add
> 0003-elf2flt-fix-.eh_frame-section-handling.patch into the patch series
> applied to elf2flt, we get:
> 
>   ld (ld-elf2flt): /home/thomas/buildroot/outputs/m68k/host/m68k-buildroot-uclinux-uclibc/bin/elf2flt terminated with signal 11 [Segmentation fault], core dumped
> 
> Our friend gdb gives us some hint on where the segfault occurs:
> 
> #0  0x000055ebfc7524e0 in add_com_to_bss (bss_len=19112, number_of_symbols=3869, symbol_table=0x55ebfd601d50) at elf2flt.c:273
> 273         if (strcmp("*COM*", symbol_table[i]->section->name) == 0) {
> 
> Of course, we're not sure if the error "ERROR: text=0x7db78 overlaps
> data=0x6b940 ?" is fixed by your patch and a later problem causes the
> segfault, or if your patch causes the segfault in the first place.
> 
> Please note that if we revert both
> 32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33 and
> 65d78dcfeb8b2eafaebe2d0c3c8c42e7e85f46ac in Buildroot, we have a
> working elf2flt for m68k.
> 
> Do you have any idea?
> 
> Thanks a lot!
> 
> Thomas


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
