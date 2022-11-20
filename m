Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F1C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70F1404CC;
	Sun, 20 Nov 2022 15:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70F1404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WXfODYSf7ax; Sun, 20 Nov 2022 15:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90294034C;
	Sun, 20 Nov 2022 15:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90294034C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 617461BF2C4
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 15:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C1314034C
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1314034C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkESx6qLqvHL for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 15:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A24A40348
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A24A40348
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 15:38:22 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id g7so4699440ile.0
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 07:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wceaNdPokkgx9ralRpYb2/b3i8JcgdGwF2Iy/lpVciE=;
 b=hPWLRirk5OrmvTETYkbYsEUK8s4WsG5nRmx9cJvy91kM6Xx9WNar9Afb0EJZryiGUM
 E8cu8ndjWNSs1xyIBoMCyWzTNu42mauNmNKbCcA4Rugmg9uU5dC5Vuysf3bTYGZHQP11
 8F8+akFCWznaCv4oyF7jbxKeOTesu8F/9VZA/IMELTCRPMvsUrPjeWKG6Hd0JCffi52H
 f9z14LILiVXDv92QaTGe24d7B2tBdGcxgxaIbWHiFX1o2J3OkEck+iR+Zy5Ejl/wTwH9
 v2E5vIKVpnaKoCni08JBbg5sBpKBc0pBXQ7qDtHAI8huLJP5PiF8xgM6+52tZ31iRWzG
 qMJg==
X-Gm-Message-State: ANoB5pmQtWEBj45A5Amov9kJfqWJXL714ihiEu/MZeofHVGvXbDaVqL1
 pL9zUlpaji8XIormhucGfxOa7FBkly4SykgEMD8=
X-Google-Smtp-Source: AA0mqf5zztmsyutEXMwq1WN0LrgzZfjMuRn++jP4T77dnYQ/0Bf+t1HPVjor+pcZ6ovz7RyO09zhQaBECTumwfI9owA=
X-Received: by 2002:a05:6e02:c0d:b0:300:b1ee:c196 with SMTP id
 d13-20020a056e020c0d00b00300b1eec196mr140994ile.237.1668958701275; Sun, 20
 Nov 2022 07:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20221117140349.27692-1-ustcymgu@gmail.com>
 <Y3ncNLHK8OQhOo7d@waldemar-brodkorb.de>
In-Reply-To: <Y3ncNLHK8OQhOo7d@waldemar-brodkorb.de>
From: Yimin Gu <ustcymgu@gmail.com>
Date: Mon, 21 Nov 2022 00:38:35 +0900
Message-ID: <CADE7KV2Y2G1fCp5XoXn=iyDf6iv8wvo1hiYmwm24xTZc1XKseg@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wceaNdPokkgx9ralRpYb2/b3i8JcgdGwF2Iy/lpVciE=;
 b=jt7IXQtj9nQIDEJ/IUc7JT76jkwNFu8ulBpcdD95nam8OfK2GolIeUdGpmyEUXF5mB
 iyuUqHw2heE+fFxtnY2Qn7FqPK/PsByUq9K+Ml/ADVEOS+iVGJg3ks5fzgz1j4+kzIRI
 KhGDYS7skpb0xrNthCJWwNGPhzgP6DO7mXwUwyFj9UHchYMJtYddw4gyLgwan6J8fIEH
 eMFFJLfcUBQxoC3IF73H5JQ0bYS+Jm/c+Cgiu7Q8Y2qzhTHsVjqVllq+ySIbisBT3qkD
 gS7wLTUWI/0H16TwDn0mcKfzVmOPb9eniR03ynAi5oHjvea+o1s9P5oOuDM/D5fPbacS
 0M+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jt7IXQtj
Subject: Re: [Buildroot] [PATCH 0/1] arch/riscv: RISC-V 32-bit NO MMU support
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Sun, Nov 20, 2022 at 4:50 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
>
> Hi,
> Yimin Gu wrote,
>
> > The following patch adds support for 32-bit RISC-V No-MMU build.
> > Currently for No-MMU RISC-V, only 64-bit is supported. There're no
> > substancial changes in code but macros and compiling options. Uclibc,
> > elf2flt, and the kernel need to be patched.
> > This is based on damien-lemoal/buildroot which first added 64-bit No-MMU
> > support, and my earlier porting attempt regymm/buildroot.
> > As a lot of FPGA-based RISC-V cores are 32-bit and many of the low ones
> > are without MMU, this can bring Linux to cores as light as RV32IMA.
> > For this reason, only the minimum required extensions are enabled in the
> > buildroot and kernel configurations.
> >
> > Yimin Gu (1):
> >   arch/riscv: RISC-V 32-bit NO MMU support
> >
> >  arch/Config.in.riscv                          |    2 -
> >  board/riscv/nommu/patches/linux-headers       |    1 +
> >  ...imental-RISC-V-32-bit-No-MMU-support.patch | 1355 +++++++++++++++++
> >  configs/qemu_riscv32_nommu_virt_defconfig     |   19 +
> >  package/Makefile.in                           |   13 +-
> >  ...ed-RISC-V-32-bit-compilation-support.patch |   74 +
> >  .../uclibc/0001-RISC-V-32-bit-support.patch   |  145 ++
> >  package/uclibc/Config.in                      |    2 +
> >  8 files changed, 1607 insertions(+), 4 deletions(-)
> >  create mode 120000 board/riscv/nommu/patches/linux-headers
> >  create mode 100644 board/riscv/nommu/patches/linux/5.19/0001-Experimental-RISC-V-32-bit-No-MMU-support.patch
> >  create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
> >  create mode 100644 package/elf2flt/0006-Added-RISC-V-32-bit-compilation-support.patch
> >  create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch
>
> You can add a
> Tested-By: Waldemar Brodkorb <wbx@openadk.org>
>
> One minor note, add a startup description for noMMU in
> board/qemu/riscv32-virt/readme.txt.
>
> best regards
>  Waldemar

Thanks for the testing and note. I have sent the refined patch in a
separate reply.

best regards,
Yimin Gu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
