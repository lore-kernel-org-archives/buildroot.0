Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1945EC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C72564090C;
	Fri, 21 Jun 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsnxdvJEVJ5V; Fri, 21 Jun 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F2D40636
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F2D40636;
	Fri, 21 Jun 2024 19:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAADA1BF228
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D69264011D
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgYmkkHFhzCW for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 19:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71D84400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D84400C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71D84400C6
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 19:58:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 659DC13F8C6;
 Fri, 21 Jun 2024 21:58:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jun 2024 21:58:50 +0200
Date: Fri, 21 Jun 2024 21:58:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZnXbepvruXKajEcz@landeda>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <185f954c798e7d8e7e1400a8b39abe1b273e849b.1718382114.git.yann.morin.1998@free.fr>
 <CADvTj4p=iYe8wK4UMnvCSmsV02JesvY9BWQDZOfcbV_PeSAkNQ@mail.gmail.com>
 <Zm9KqRyiYxLxVfwy@landeda>
 <CADvTj4r+O-RTMRMTSWmhW-Tb1UThcjsRM0mA1=H0DsNM3cGuTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4r+O-RTMRMTSWmhW-Tb1UThcjsRM0mA1=H0DsNM3cGuTg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718999932;
 bh=aO1EYaTMg2jtUXNJS0k9nzbzj4gxaF8aR69Vnd8R6Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qmOImL/oWoNbmLLq6geV1J6mCcaTP1zUWy6bJ7NxG8sCLGINtKle4fyjxuvQ217tx
 JV3gRVHsCNZLcg7/G4l7T9KxU0YyIDqH5ZotTplRZ6uPON+IMJOhyKMrWTy63L2lMO
 GOOt3mmzJQhYm90RKM+9zKSJx2TNoVCacrFd5Pu+q3oMs365SVnXRFRNfGmB15VAS6
 mem9iKGsAQyALiuZBQvIxzKQ2sdLt6MPIHd8NS0rB3y9J0FIULNo/oI5zFa+ua2Z8R
 WojyT2FY4Um7oK7dCeHnYXbnJhPAuFpP/8geDoji5E/kpPzaS/LaY4EuDI9RkXFH5L
 R3wK+gBW1B6ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qmOImL/o
Subject: Re: [Buildroot] [PATCH 2/6] utils/update-rust: add script to
 automatically update the rust version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-06-20 12:13 -0600, James Hilliard spake thusly:
[--SNIP--]
> I don't think there's really any meaningful advantage to requests vs
> urllib.request.urlopen which is part of the standard library for this
> particular use case.

requests.get() is shorter! ;-)

So, I ended up keeping use of requests. This script is not part of the
build process; it is jus ta helper script, so it is acceptable that we
depend on a non-stdlib module, especialy such a widely available one as
requests is.

> >     os.path.basename(mk_file)[:-3].upper().replace("-", "_") + "_VERSION"
> >     pathlib.Path(mk_file).name[:-3].upper().replace("-", "_") + "_VERSION"
> > One char longer... ;-)
> pathlib.Path(mk_file).stem.upper().replace("-", "_") + "_VERSION"
> Four characters shorter. ;-)

OK, you win. ;-)

I used that in the final script.

[--SNIP--]
> > Is that really important that the script can be run from anywhere? I
> > don't think so. I can however add a check that the files we want to
> > generate and tweak do already exist, though; that's a good point.
> I'm not sure, but it should be pretty easy to implement, may also
> want to use pathlib types here.

I wanted to keep the script as simple-stupid as possible. Requiring that
it be run from Buildroot's top dir is not too strong a limitation, and
adding support for running from anywhere would just add more complexity
(evenm if not too much). So, I erred on the simplicity side, and just
catches the case where a file is not found, assuming then that we're not
running from the top dir.

Thank you for the review in any case, it is always interesting to be
challenged and to explain the choices. Thanks!

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
