Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B853C4332F
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:29:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B88260F4F
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B88260F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8A8B404B6;
	Mon, 27 Sep 2021 19:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQ3evDyoBm9h; Mon, 27 Sep 2021 19:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDD8A40188;
	Mon, 27 Sep 2021 19:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C46761BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E84A605D6
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQR3uNd1N5jp for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3070605D3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:28:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 49DF5780346;
 Mon, 27 Sep 2021 21:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632770936;
 bh=929se9/Q9WB5HGaRh1k306dF4OHyK/k4igjUVmUtoa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tW/Q0xkWSICS/aQrrcROuWNpzTtYneu+30E8Yy52B+Ck26xSG0/Cuy5whKUSJa/vt
 HZ2Tcvnfj6A03wq6uuSvktVVQN9ZcgB6szf+dH+iLNaV25ZCmFsbQmWzJiHXMzeooU
 RvPeDNsroMZqE3J32hgOE45EZZAmpn4482h9IQVMt/llYY+g6cduXS0a+Nxk8xZD8A
 RN7JNtx1gcx+RwRCl9at593+KLUXFMBR5A3S0tSN3Ahoa35TNAzmL5NVItFjX09qLU
 t8sv9RSiivE1698UDlrfH/zIjN/s0Hk5FEiCmhiV/o42xJi5vCTXaLnKb4KGFq7VZk
 cOm8Wtkv9NAnw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 21:28:42 +0200
Date: Mon, 27 Sep 2021 21:28:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20210927192841.GC1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-2-kory.maincent@bootlin.com>
 <20210923200640.GE3176@scaer>
 <CAK4VdL0E-SjUJ9b9B6VSFPdGfu7eR9yxMtx83q+c5DOukqe9xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK4VdL0E-SjUJ9b9B6VSFPdGfu7eR9yxMtx83q+c5DOukqe9xg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/7] board, boot,
 package: remove usage of startup.nsh in EFI partition
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Nicholas Sielicki <sielicki@yandex.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Erico, All,

On 2021-09-24 22:28 +0200, Erico Nunes spake thusly:
> On Thu, Sep 23, 2021 at 10:07 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > +Dick, Erico, Gerome, Nicholas, Peter, Romain:
> >
> > This patch touches boards for which you are registered in the DEVELOPERS
> > file. Could you verify that those boards still boot with this patch
> > applied, please?
> The patch looks ok and on a quick test, both aarch64_efi_defconfig and
> pc_x86_64_efi_defconfig continue to work as usual. So looks good to
> me.

Thanks for the feedback; I've made that a Tested-by tag from you when
applying. :-)

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
