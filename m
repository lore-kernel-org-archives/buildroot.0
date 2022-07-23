Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC5AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9C742415;
	Sat, 23 Jul 2022 19:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE9C742415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YAuNuFGV-4e; Sat, 23 Jul 2022 19:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9BF422CF;
	Sat, 23 Jul 2022 19:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B9BF422CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAF7B1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99F52422CF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F52422CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeBo-mHXBZLV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38200418A5
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38200418A5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:36:31 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v130so3843235oie.13
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFlcwN0kyFfCAlQ2RV39EYna8U+ota+/0irUPkcEl+8=;
 b=cWtb/q8hMulqwEW/+k/ezGinqcUpnoMISEut5TLT1SzS8eZ6uDbkhtxRUdjq/yeiTY
 pRVEil58KY/cy69Kgdsf6onO3akaXoFGGG3NPCpud8GlAyJiEfm5od+20ZyVipS1xtCi
 QHX2XH6/tIG/0J+osnXoAmlbHkPqaQ01ryIOq/ecXHb1fY/ubzDpbTuRjg59F2VQhv8S
 C7k/fqBk0Me/eoH1S/Ls06ee9fwFTpdbM3dKm8bOg6H6UZlHSDhz2RbIPcm5YBjhbhmi
 0uGXKdxDCcDzwKB/+z/D7Y0Qy4JIuA+hQLlBkHtClXqha0UxINGa6feUKUXS3kKEKJuP
 TZSQ==
X-Gm-Message-State: AJIora96jdl6MFSSQ1ojqjFLpL/NfE2nJbwQhZVUvLlKOdPYUYzwva3z
 007ClppS8wGzKus23lniF/IPqMm43KNZEbxfv2w=
X-Google-Smtp-Source: AGRyM1v2geStlf2tjeeDSUsmrFGkwHbfkVUqZS1jPO5hzZbDszgzrRIJvk1rZw2JAPJ4FQtyV1Ouh70lcqHkTIU+ozk=
X-Received: by 2002:a54:488d:0:b0:33a:87b3:31a with SMTP id
 r13-20020a54488d000000b0033a87b3031amr9862797oic.153.1658604989674; Sat, 23
 Jul 2022 12:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
 <20220723211053.69edd126@windsurf>
In-Reply-To: <20220723211053.69edd126@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 23 Jul 2022 13:36:18 -0600
Message-ID: <CADvTj4pD0cQLv4LgWoJ1HkhhTj5MZ10TdGG1hfNANPy0EkeLrw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pFlcwN0kyFfCAlQ2RV39EYna8U+ota+/0irUPkcEl+8=;
 b=OfOU7ma+syHj8o1uM2h8ot4qGN0ktHq37nn2G2RS9oJUKcpj/gdwZWDHXBWUJgbZFS
 74UpLCRqSxnpCvK0H7PpRKDllYwDNvdoK1oDPHuNv7YW9ydTo8cQ4aDpf7A59fVva6Co
 Ls7yRO5mgfy/pAtyjNdMF42YExcT9CLpaeJRFQO6l5fqBdMPDY/VDScLP1IjSysO2Mtu
 RIPReZ0lXCJyaJZq5KuKDjP+9lcOxhusBwTkkYDWcKLHdpXFtGMQemLRN/sq7wFysJ6K
 0DAM0MMhc79b/5xbUwps221Qe6HBIVum7gTvO4bXEZucIrvhnt5lVxXRFLQ56EoJQdZO
 X3ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OfOU7ma+
Subject: Re: [Buildroot] [PATCH 1/4] package/python-typeguard: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jul 23, 2022 at 1:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 17 May 2022 15:59:30 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/Config.in                              |  1 +
> >  package/python-typeguard/Config.in             |  6 ++++++
> >  package/python-typeguard/python-typeguard.hash |  5 +++++
> >  package/python-typeguard/python-typeguard.mk   | 15 +++++++++++++++
> >  4 files changed, 27 insertions(+)
> >  create mode 100644 package/python-typeguard/Config.in
> >  create mode 100644 package/python-typeguard/python-typeguard.hash
> >  create mode 100644 package/python-typeguard/python-typeguard.mk
>
> Series applied, thanks. However, you had forgotten to add yourself in
> the DEVELOPERS for the 3 new packages, so I have done so. Could you try
> to remember for your next new packages to do that?

Oh, I don't actually use these packages, they are just need to fix
python-flask-jsonrpc
that got broken by an update for a package I do use(pyyaml) so I was
just fixing the
pyyaml update breakage essentially by adding them and updating
python-flask-jsonrpc:
https://lore.kernel.org/buildroot/CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com/
https://patchwork.ozlabs.org/project/buildroot/list/?series=300745&submitter=&state=*&q=&archive=both&delegate=

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
