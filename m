Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C4EC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 20:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE325401DF;
	Sat,  6 Aug 2022 20:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE325401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drL7GLbgbb7n; Sat,  6 Aug 2022 20:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A2540116;
	Sat,  6 Aug 2022 20:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A2540116
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65C231BF47A
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F99460F39
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F99460F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkLMq-oy43ne for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 20:47:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC2960BB9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC2960BB9
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 20:47:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13CBA240004;
 Sat,  6 Aug 2022 20:47:51 +0000 (UTC)
Date: Sat, 6 Aug 2022 22:47:50 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220806224750.62132558@windsurf>
In-Reply-To: <20220725164425.7316b2e3@windsurf>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-3-damien.lemoal@opensource.wdc.com>
 <20220725164425.7316b2e3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659818873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaUPauYcL/SKCZ4e9jtEI6byo4X5i17a2WpY1HPWP48=;
 b=ThxgwZaUGA3pd8NfHOWGNn3sC+pD1+/RJgNBwp00caKkRYCSkKK0fCe+iPq0dYimEQ56Oo
 6FHzOEI0iAb8u3ySHySyphdSmWrrx4WhT34QNBBjCAlxLRc7jZ7oluM+/KV2OZr+eQ/pli
 LXg9ZnVo8XtfO8Q6vwmNjGOUFP6+QjWYSR8WCTgxxTnf3pXxf8q4hEkpF4AT6hi2SAty7a
 eoW7yw03hNduWGopqIqoEMwygA4jkurMlqdN3oeOyFAzr3q3vo+gg2xbAb5UArKM9vLNue
 XyjIlWyb8NvFmFQsOvIBCP/T2kLzcAlNNbIcNCVXwCrjYmHW8JQoI4F/s1Ro+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ThxgwZaU
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien, Hello Niklas,

Are there some updates on fixing the elf2flt segfault? It breaks some
of our defconfigs for other CPU architectures, so it cannot stay in
this situation :-/

Thanks for your contribution!

Thomas

On Mon, 25 Jul 2022 16:44:25 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Damien, Hello Niklas,
> 
> On Mon, 30 May 2022 12:38:27 +0900
> Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:
> 
> > From: Damien Le Moal <damien.lemoal@wdc.com>
> > 
> > Remove the old elf2flt 0002-elf2flt-add-riscv-64-bits-support.patch
> > patch file for riscv64 architecture and replace it with 3 patches:
> > 
> > (1) The first patch fixes the data section alignment
> > (2) The second patch fixes a bug with the handling of the eh_frame
> >     section causing text and data section overlap problems.
> > (3) The third patch adds a simpler riscv64 flat bin relocation support.
> > 
> > These 3 patches are submitted to the upstream elf2flt project as pull
> > request #22:
> > 
> > https://github.com/uclinux-dev/elf2flt/pull/22  
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
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
