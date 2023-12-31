Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE50C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E137381501;
	Sun, 31 Dec 2023 22:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E137381501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTsDzzk4vXzv; Sun, 31 Dec 2023 22:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 401D5814BA;
	Sun, 31 Dec 2023 22:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 401D5814BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41BC91BF368
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 195644047C
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 22:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195644047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gS2tPnyabIas for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 22:05:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DF4640477
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 22:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF4640477
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CA1CB35206CF; Sun, 31 Dec 2023 22:55:17 +0100 (CET)
Date: Sun, 31 Dec 2023 22:55:17 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZZHjRSzIb7WUnhUo@waldemar-brodkorb.de>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-5-wbx@openadk.org>
 <ZZHOxLRXJ9U8apJA@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZHOxLRXJ9U8apJA@landeda>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704059718; bh=uXmNvFIKMdbZNDg9Sj7w8Ja9WxSco1siq3lLdXpZgPk=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=lWD3S4XIYRkT0XtK6VeInT65feranEt3Hvxd76PiD9okIJ7ztGZK5x5Dd98vgkumR
 jBejUoagqv0R4O0hKZWROD6mXOJ6Od/M3H5MUvtoSIvW2bwp/0CEQaUcwq1Kw5Y0aN
 1U42Pt2U3FAzNYEaX8mVWGmF51PUA+DPJAPBVPD9YZ1bA0ORvAO/j1nW+dqK2XzxDA
 /38Xgyl8BwXSIWHjZyNuZIWRct5zWtNbFPIpPK+iuG/AhBknq4DsLPQEg6w+QhUFrv
 0YObaj+h6PAWBMSHf9hYAT6BGZ5dx/CMWU0y2W4EbSIqAktEGTRD9EMt4e1V18mn1F
 ml0QXKY7aykJg==
Subject: Re: [Buildroot] [PATCH 4/6] configs/qemu: add qemu_arc_defconfig
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,
Yann E. MORIN wrote,

> Waldemar, All,
> 
> On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Add a bit of explanations in the commit log, especially given the
> following...
> 
> > ---
> [--SNIP--]
> > diff --git a/board/qemu/arc/readme.txt b/board/qemu/arc/readme.txt
> > new file mode 100644
> > index 0000000000..93bb9c2152
> > --- /dev/null
> > +++ b/board/qemu/arc/readme.txt
> > @@ -0,0 +1,8 @@
> > +You need Qemu fork from here:
> > +https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
> 
> So, we are dropping all the arc specific versions for the toolchain
> components, but we eventually introduce a defconfig that relies on an
> arc specific version of qemu, that we do not even package in Buildroot,
> so that users can't even enable host-qemu in Buildroot.
> 
> That is a bit sad...
> 
> What is the rationale for introducing this defconfig, then?

Qemu is more widely known then the nsimdrv. And I think when ARCv3
support is added to Buildroot it can be used to test it, too.

I thought it would be nice to have instead of only rely on the nsim
defconfig we have now.

Can we keep it? What others say?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
