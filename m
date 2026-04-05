Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC38E9D800
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 16:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A50140971;
	Sun,  5 Apr 2026 16:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8pc1tygCtOt; Sun,  5 Apr 2026 16:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C12940977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775408390;
	bh=1NejRwyQ3gnc3A3yBtlPvnmztaXDp50iGJPzYEKgH3A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q/dDoDbaxW8bW7VJIBz0U6D9O9eoVsWfTSZCNcl6wV6sxGGerZC44Qbx92itXpZCZ
	 UfK/1oEWKIo2TtIFLw4wnr1ZbY6Ha+HEYpo0l/AqxTjoDIFpbdN4U6puuUU4K3Ulqm
	 p/IIgsi3j6NNF7kR1fwp1oNOGDderJrfJx9zUO3uee3HE/fDaVdcpfPljUTMzpmNiN
	 h46AiWppTOde9R+qxOBsSdxr/F3m9wiJDDekyonbVZvQEaP1bWFyig7yno3sekAqLu
	 bziJxUKpJt+1+Vr75zKBQIAuKZMcjKw3Kq7yHxPWQgIok6i5vG4gB+ElXLFhWjSoXk
	 yd5k7GCTk4smw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C12940977;
	Sun,  5 Apr 2026 16:59:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5756E219
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1F640193
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQwBtVPi29s6 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 16:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C82F64018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82F64018E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C82F64018E
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 16:59:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:9112:352a:e442:144c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3B0D4B0053E;
 Sun,  5 Apr 2026 18:59:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Apr 2026 18:59:39 +0200
Date: Sun, 5 Apr 2026 18:59:39 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <adKU-16ILEg2aWbt@landeda>
References: <20240831191919.370005-1-fiona.klute@gmx.de>
 <e09aa58a-2cb0-4ef6-b9fd-1a6a6fd15a21@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e09aa58a-2cb0-4ef6-b9fd-1a6a6fd15a21@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775408384;
 bh=KAIIphXWZcDc4cAhPpPH9dYp5N8x/REFp87glLi7wlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsYEyGV5rRZsY9Ncuq/k5Dk1exgmTk7QB+rpHXI4qimYn4pah2IBNA290oUsd+s3M
 j8YWFC9JQgzs3xlhe/uP4bvvs/n8zTUOy9z4/eBc78+JtLiOMrNr12qL4ykM74yJHC
 OYTmcBpA9YFwKjOnqvjOPMEJ+bR4wjYNmzqXHlkODjFOmciie2gi0gqf/3RM20PVoY
 1KXMPWxyqSGTWRfD6QgJGcTzrHrVPR34LS5cX2ZZ5ai3pH0Xrbe04bzGuwuGN9Iigp
 ufifTSVv3kd81KUerfSdsRjoJfw3E4f9kBHPGohBazi3a+fDhcVRou+0ZcOofDr8pk
 tRKQWhi+VH1Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QsYEyGV5
Subject: Re: [Buildroot] [PATCH next v4 1/1] utils/docker-run: mount and
 pass BR2_EXTERNAL dirs
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2026-04-05 17:48 +0200, Fiona Klute spake thusly:
> Am 31.08.24 um 21:19 schrieb Fiona Klute via buildroot:
> > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> > The BR2_EXTERNAL environment variable is passed into the container,
> > and each path listed in it mounted. This allows using external trees
> > when running a build using utils/docker-run. Testing the existence of
> > the variable instead of a non-empty value allows passing an empty
> > BR2_EXTERNAL variable to disable currently set external trees.
[--SNIP--]
> > diff --git a/utils/docker-run b/utils/docker-run
> > index 1adb02d74e..9579f83ce2 100755
> > --- a/utils/docker-run
> > +++ b/utils/docker-run
> > @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
> >       docker_opts+=( --env BR2_DL_DIR )
> >   fi
> > 
> > +if [ -v BR2_EXTERNAL ]; then

As this is a bit unusual (but perfectly legit!), maybe a little comment
above the code to explain the intent:

    # Test the variable exists, not just that it is non-empty,
    # to be able to propagate an empty BR2_EXTERNAL.

But -v is a bashism (that's OK, we're using bash in the shabang), but
the more usual (and POSIXly correct [0]) way is to use something like:

    if [ "${BR2_EXTERNAL+set}" ]; then

(an empty string evaluates to false).

I prefer we use standard constructs when they exist, and are not too
cumbersome to use, rather than bashisms that do not provie that much of
an improvement.

> > +    docker_opts+=( --env BR2_EXTERNAL )
> > +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> > +        mountpoints+=( "${br2_ext}" )
> > +    done

Why the loop? You can just append-assign the expansion:

    mountpoints+=( ${BR2_EXTERNAL//:/ } )

[0] https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_06_02

Regards,
Yann E. MORIN.

> > +fi
> > +
> >   # shellcheck disable=SC2013 # can't use while-read because of the assignment
> >   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> >       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> > --
> > 2.45.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 

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
