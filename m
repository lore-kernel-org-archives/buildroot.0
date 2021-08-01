Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4ACC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 07:08:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38DA60240
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 07:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C38DA60240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A97F403B3;
	Sun,  1 Aug 2021 07:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLtXX5gDkAzF; Sun,  1 Aug 2021 07:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C026E4035A;
	Sun,  1 Aug 2021 07:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A57CD1BF424
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 07:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91CC14014D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 07:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcasdHJYzyku for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 07:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F210240111
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 07:08:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f047:5d71:3678:2af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CD1542003C1;
 Sun,  1 Aug 2021 09:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627801725;
 bh=1zcCdGpc1crDClAXw003LNs9tZ9TtM0QALV2Y2exLKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUXiajth8I4S8jDhdJrVb7O/sgQ2QAQlxnK830KpoaDnOwsil8Y4VrCZkYb5AzCqa
 KuP2p/Oi320y1R9ux9Zyh1ef7onCZKInEq/NSoGcAR4HsmdTLPl4+9cU9KV/GVvGuV
 ga1NYQ5NUOcGPGRgkXGsJp2FYg6kbg4DyBkEXgosZHRjqIMwXG/7Zu+1m15UgXPN2d
 58yOfwDMfAlBO6LvzfM4OWMy/PEwLx4umJNSW4CQ9Xy3RQ2T/RM/9qJUf4Ntlju5KT
 D/cXNzoqERAhJHW4D3T/WD5sFsDjy5Dmqyx9ftbTY5ORxyr2SEm+V+AYwjZIoSD4M+
 x4bZ3nb19wAhQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 09:08:30 +0200
Date: Sun, 1 Aug 2021 09:08:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210801070830.GP3189549@scaer>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
 <20210729225000.750b323e@windsurf>
 <CA+h8R2onPMjOuvC0U6iM8QbhuAQQ9=aQ-yB-rWQkCbhpxcdiHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2onPMjOuvC0U6iM8QbhuAQQ9=aQ-yB-rWQkCbhpxcdiHw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Ryan Barnett <ryan.barnett@rockwellcollins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Christian, All,

On 2021-07-31 21:59 -0700, Christian Stewart spake thusly:
> Vincent said:
> >I think Yann already calls out what may be going on in this patch
> >https://patchwork.ozlabs.org/project/buildroot/patch/20201219153525.1361175-5-thomas.petazzoni@bootlin.com/
> 
> I think this is probably correct, the .tar.gz needs to have
> deterministic formatting.

Can you try usign the tar helper in support/download/helpers instead?

> In this particular case the user was trying to build on Kali 2.
> 
> Doesn't buildroot compile host-gzip and host-tar for this? I'm
> wondering why it's not the same between host machines.

Since 2020.02, we are no longer building host-tar, unless for very old
versions (i.e. before 1.27), thanks to some tar trickery vy Vincent.
See:

    cbe95b1a455b support/download: add helper to generate a reproducible archive

We also only build host-gzip if the host gzip is pigz (or missing).

> On Thu, Jul 29, 2021 at 1:50 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
> > > This works fine in most cases, however, this causes inconsistent hashes.
> > Based on the difficulties, I would really like to understand a little
> > bit why the archive is not deterministic. Could you compare the
> > contents of the download stuff between your different machines, and the
> > contents of the tarball, and see what changes?
> The two versions are attached. The actual contents of the two are
> identical. But for some reason the formatting of
> embiggen-disk-bad.tar.gz is different:
> 
>   00000030: 8232 63de 4282 92dd acff fb79 6740 eae2
> 
> Starting at "2dd acff" - in "embiggen-disk-good" it's
> 
> 00000030: 8232 63de 4282 96dd acff fb79 6740 eae6

So, I zcat both archives, and the two tar are identical!

    $ sha1sum *.tar
    dbb8338ab4acaff1e232c67d3b46602d61114b53  embiggen-disk-bad.tar
    dbb8338ab4acaff1e232c67d3b46602d61114b53  embiggen-disk-good.tar

So I also hashed the archives you provided, and they too are identical:

    $ sha1sum *.tar.gz
    bd887a60c4ca60e55d062067132ccab7d85e7d95  embiggen-disk-bad.tar.gz
    bd887a60c4ca60e55d062067132ccab7d85e7d95  embiggen-disk-good.tar.gz

Did you mess up when sending the archives?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
