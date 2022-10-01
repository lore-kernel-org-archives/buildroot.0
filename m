Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7E4C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10BB83339;
	Sat,  1 Oct 2022 19:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10BB83339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X79SRK1I6yoH; Sat,  1 Oct 2022 19:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06E2832E6;
	Sat,  1 Oct 2022 19:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06E2832E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E04761BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA3A2415FB
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA3A2415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enaUKF08FbpC for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:07:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B9F415FA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05B9F415FA
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:07:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 36934780306;
 Sat,  1 Oct 2022 21:07:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 21:07:02 +0200
Date: Sat, 1 Oct 2022 21:07:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20221001190702.GQ30794@scaer>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
 <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664651226;
 bh=OJkzcDdKQD6BwdB3RMAicCbQNerrvDvOLqSCuO3aJbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MybMtBlRevOFVqO0QXPC3r9sqSvNLLkvQJCG0jiK4TVuucM5Q1z8wWUubgSGzEy2l
 YkbBlyDq3DjaRTwVYMWtPgEEsAlNukuwlIEYkNlO/uIFS4rwX0B7VcaXvxxerd7PrQ
 fb+0tRYEJMEzWZZ2RJfcFQtKpAJFNrB9+kno10TqqfVO8eQNat/EVLx8dtrVDmkaoj
 nWp8zFGFT0XGs4hZeGXl37IwRIOo843ycFxlr1cfV45UF2Fh63MrXdxg9ifSeIPv0s
 x5PPlHyYFeMXFyW0H87cEuvaMn0IBmoZcMV7JtYohR+fSNfHQ8XvPt11hoLvkRzelS
 ggNMgJjeCtsXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MybMtBlR
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-09-28 15:28 -0700, Florian Fainelli spake thusly:
> On 9/28/22 14:38, Thomas Petazzoni wrote:
> >On Tue, 27 Sep 2022 15:11:33 -0700
> >Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
> >>("perf tests: Add test for PE binary format support") present in >=
> >>v5.10 there is an unconditional installation of PE binaries which will
> >>be rejected by the check-bin-arch script.
> >>
> >>Make sure that these binaries are excluded from being checked to allow
> >>the installation of the perf tests.
> >>
> >>Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
> >>Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >
> >Thanks for the patch! Before merging it, I'd like to understand a
> >little bit more how readelf behaves for these PE files. Indeed in
> >check-bin-arch, we are doing:
> >
> >         arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
> >                        sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
> >
> >         # If no architecture found, assume it was not an ELF file
> >         if test "${arch}" = "" ; then
> >                 continue
> >         fi
> >
> >for a PE file, I would expect readelf to badly fail, and therefore
> >${arch} to be empty, and the file simply ignored.
> >
> >What is the behavior/output of readelf on these PE files?
> 
> If I use my host system readelf which is packaged from
> binutils-x86-64-linux-gnu, I get no output and all is well, however when
> check-bin-arch is called and it uses $(TARGET_READELF), I do get:
> 
> ./host/bin/aarch64-linux-readelf -h
> build/linux-custom/tools/perf/tests/pe-file.exe | sed -r -e '/^ Machine:
> +(.+)/!d; s//\1/;' | head -1
> IMAGE_FILE_MACHINE_AMD64 (0x8664)
> 
> which is what prompted me to issue this patch in the first place.
> 
> I should mention that the readelf binary in this case is the LLVM Object
> Reader and it does support PE/COFF which is probably why it even remotely
> attempts to parse the file.

OK, but isn't that flawed? It is named 'readelf', so I would expect it
to not report on non-ELF files, at least by default (i.e. unless a
specific option flag is passed).

If a readelf tool does not behave like a readelf tool should behave,
isn't that a bug in that specific readelf tool to begin with?

Otherwise, it is very intriguing how you managed to have a toolchain
without gcc et al, be usable for Buildroot that only knows about the GNU
ecosystem.

Is that a publicly available toolchain? Can you share the recipe how
that toolchain was generated? Do you have special, local changes in
Buildroot to accomodate that toolchain? Will you submit those changes?

That would allow adding more testing to avoid such issue in the future.
Otherwise, I am not fan of adding such exclusion for private cases that
we can not (easily) reproduce, as those cases are not supported.

Regards,
Yann E. MORIN.

> -- 
> Florian
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
