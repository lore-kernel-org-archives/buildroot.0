Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F900C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E6CF40025;
	Mon, 29 Jan 2024 20:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E6CF40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QjWtDw58rE6; Mon, 29 Jan 2024 20:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78781404F4;
	Mon, 29 Jan 2024 20:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78781404F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32FB41BF36D
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A2841477
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18A2841477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Pmi77eGIuxm for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:22:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8608F410A0
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8608F410A0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6787313F81D;
 Mon, 29 Jan 2024 21:22:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Jan 2024 21:22:25 +0100
Date: Mon, 29 Jan 2024 21:22:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <ZbgJAacXmCx1x_kT@landeda>
References: <f0bf5c75-199c-d23b-373a-f2728ecac99e@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0bf5c75-199c-d23b-373a-f2728ecac99e@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706559747;
 bh=vXBna9srUJy+GaP5iTJKMHxW+r2qVjX0rYqS6D2yPYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWgxx/UfbL9n10NXh2n/cganpbhqv6rwSWhZeNC6HfmuQTZ8Uck+rU7mZ8/ApxzXz
 WlZFzgcjznZAems0dxq2h3F0iBa1zp27NRwWZLcTyHsZjH20jLemAckqkNljYRbOrc
 fmLIyC+aITLqTy9haHrEzCekoA7V2oVbSwLeq59A1CRbnCZIbFeN94IT0Eyaffrp+k
 KpbqQyCnIxpZ45ufIEmFWa9ZhWjJdretIyu8WiMOt7jZqoHUTxQYSDVDTOyVVXqnVI
 evLhuraqezyvHxKVFJRR4HVqkh3SW1c+uzEeM01XXRycXJ3LF9sQl1yK994P3g+JDk
 wXfhQFn6KJ6/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GWgxx/Uf
Subject: Re: [Buildroot] host-python-numpy - confused about host openblas
 dependency
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Graeme, All,

On 2024-01-29 11:54 -0800, Graeme Smecher spake thusly:
> Several packages depend on host-python-numpy:
[--SNIP--]
> However, this package appears to rely on a host-openblas dependency
> that's implied but never really spelled out.
[--SNIP--]
> Any suggestions?

See package/python-numpy/python-numpy.mk: it has proper lapack and blas
handling for the target variant, but indeed the host variant is left in
the dark.

> There are enough packages depending on host-numpy that I expect it's
> something unusual on my end.

Or rather just happenstance that you found it first...

> If I force the build to proceed using system pkg-config I can coax it
> into proceeding - but this is clearly a hack.

Indeed it is not the proper solutoin. The proper way is to edit
package/python-numpy/python-numpy.mk and add:
    HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""

Hopefully they are not needed for the host variant, because we not have
host-lapack or host-openblas.

Care to send a patch, please?

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
