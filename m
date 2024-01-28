Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AAAC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 20:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3157040965;
	Sun, 28 Jan 2024 20:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3157040965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3zHxpcbQuHH; Sun, 28 Jan 2024 20:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3EE4093E;
	Sun, 28 Jan 2024 20:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3EE4093E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A49A1BF3FD
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F01840391
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F01840391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hcMgYC-rhLL for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 20:09:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 062234016D
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 20:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 062234016D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13A4613F81D;
 Sun, 28 Jan 2024 21:09:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Jan 2024 21:09:24 +0100
Date: Sun, 28 Jan 2024 21:09:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <Zba0dJ_wMNPDP5X6@landeda>
References: <20240128183755.3322967-1-abiliojr@gmail.com>
 <CAFOYHZAFjAyu38jik9KSX8CfVdjRHJE4yPdgSC6tNY=C3UAnqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFOYHZAFjAyu38jik9KSX8CfVdjRHJE4yPdgSC6tNY=C3UAnqA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706472568;
 bh=isSUiqbXbJFHE+DzfvUVO08TkzQHHMLxCup872dAt04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGEGobRw/0+EyUo3Q3O3PFej3lyw3//KnF4TlXTjuNEjO4Ji4M5GWsoKiuhX5NKw/
 xILPK62JiQyaWJW/Mp/p2q1j0cW7wXRmXrekpYj8lUhyz/iYfz25HfMmnlawEX4Sy7
 RkpgUlFooMEHX//s6txXr6jI8/dqbzgYEA3WyzqQLavD+IvQFEQGYzhe4kuWSdDFcZ
 trqfnLIPNZp5ddzQlnMqWaTBU3Go81nvKK8s3+FTMogbGUP2zn5BOktymW+WiTnW7l
 +68zwFgvVJg1vN5t3N7/txEyZxcRaKhYyZu/fiXVRQeQPK+TvFHw/rm6oiRQ4mjgSH
 Z+FtstWp00V+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NGEGobRw
Subject: Re: [Buildroot] [PATCH] package/micropython: make use of recent
 micropython-lib
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
Cc: buildroot <buildroot@buildroot.org>, Abilio Marques <abiliojr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chris, All,

On 2024-01-29 07:58 +1300, Chris Packham spake thusly:
> On Mon, 29 Jan 2024, 7:30 am Abilio Marques, <[1]abiliojr@gmail.com> wrote:
[--SNIP--]
>     This commit also ensures that the libraries in micropython-lib will
>     be updated together with newer versions of micropython.
[--SNIP--]
> One thought I had was to build micropython as a host package and use that to
> install the libs into the target rootfs.

Yes, this is also my opinion: use host-micropython, if possible.

I see that micropython already depends on host-python3, though. Would
host-micropython be sufficient in lieu of host-python3, to build target
micropython?

And would host-python3 be needed to build host-micropython? Or can we
get along with just the system python3? If we can use the system pytho,
then we can make the dependency on BR2_PYTHON3_HOST_DEPENDENCY rather
than hard-code host-python3.

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
