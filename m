Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F9FC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 19:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA9240300;
	Wed,  8 May 2024 19:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTsmZw9cmbUS; Wed,  8 May 2024 19:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D57940304
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D57940304;
	Wed,  8 May 2024 19:18:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8463B1BF3D8
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 19:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DFCF80E3B
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 19:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 247KTAqjZ06w for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 19:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4369180DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4369180DA3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4369180DA3
 for <buildroot@busybox.net>; Wed,  8 May 2024 19:18:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8731813F8A2;
 Wed,  8 May 2024 21:18:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 08 May 2024 21:18:14 +0200
Date: Wed, 8 May 2024 21:18:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZjvP9vE_Yszu9CLd@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-8-ps.report@gmx.net>
 <20240506210623.7c3b3065@windsurf>
 <20240508165357.0a3ead1d@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508165357.0a3ead1d@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715195897;
 bh=qcoPyPffoU4r8cZFeoWBB0I+W8APg081kjbEXDnGN2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZO4dGufFxDTkmrNK0N0Nx/H5d3pDOdgitWxlIxnHFwT9yM9HgJ2kwZkuRPTEJq9xV
 mkVh7lxtjiwkOPC2BBXXU9P+L+zSNloAacdQUo/P6mheLspfARk0I2cjBDXOSO6h/1
 hLR030DKwUQSyg5OpSDVyWHdtQLSEIGGjNyv7kMWqqatwdzmwXpL8gf75+b6O9/4tn
 jYD08JbULHSZHmU7p8j/XpUUEXN/gmkJ4AM0cvfW/UEhE/S3MZ8g35rElyYtfNXoFh
 CECUoZ0ujT2A4SKTHzVa60Lb4wQ9A6xmiTOieXlZm6TUD3+XEmDKBIbDky38Fh91Gr
 RedB3PBwIk34w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZO4dGufF
Subject: Re: [Buildroot] [PATCH v1 7/8] support/kconfig: reference
 environment variables directly (remove 'option env=')
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-08 16:53 +0200, Peter Seiderer via buildroot spake thusly:
> On Mon, 6 May 2024 21:06:23 +0200, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> > On Mon,  6 May 2024 16:45:50 +0200
> > Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
> > > -	default "$(TOPDIR)/dl"
> > > +	default "\$(TOPDIR)/dl"
> > So here the "\$(TOPDIR)" is because we actually don't want the "new"
> > feature to kick in, and we want the value of this variable to be
> > expanded not by kconfig, but by the makefile machinery?
> Yes (sorry, the explaining sentence in the commit log got lost while
> rebasing/squashing)..., without the escape the expanded value is
> written out to the .config file...
> > So this also means that when we do $(BR2_EXTERNAL_BLABLA_PATH) in our
> > .config, it now also need to be \$(BR2_EXTERNAL_BLABLA_PATH) ? If so
> > that's going to break a *lot* of things...

This would also impact BR2_TARGET_GENERIC_ROOT_PASSWD, see the help
text: it can contain a literal string that starts with a $ sign.

> Needs to be tested ;-), but the problem is not in the .config files
> but in the Config.in* files...

So, that only impacts the 'default' entries, right? If a user actually
enters '$FOO' in a configurator, the appropriate, unexpanded value ends
up in the .config?

What would happen with:

    $ cat Config.in
    config BR2_FOO
        string "$(FOO)"

    $ FOO=27 BAR=42 make defconfig
    $ cat .config
    BR2_FOO=????

    $ FOO=27 BAR=42 make menuconfig
        BR2_FOO -> enter literal:  "$(BAR)"
    $ cat .config
    BR2_FOO=????

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
