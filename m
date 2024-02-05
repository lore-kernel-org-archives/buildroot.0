Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C2C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3C9404A8;
	Mon,  5 Feb 2024 13:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3C9404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaFGDdIjAXpl; Mon,  5 Feb 2024 13:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40EB24053F;
	Mon,  5 Feb 2024 13:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40EB24053F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD7AE1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E874053F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4E874053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41DPOs8jlK0D for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:47:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4E2404A8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4E2404A8
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1DC1713F8A2;
 Mon,  5 Feb 2024 14:47:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 14:47:40 +0100
Date: Mon, 5 Feb 2024 14:47:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcDm_KSpgpqSYJ6u@landeda>
References: <170712853287.18164.6368517214119629150-0@git.sr.ht>
 <02f46330-bc2b-4dec-a933-0e086db94f2c@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02f46330-bc2b-4dec-a933-0e086db94f2c@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707140865;
 bh=QtZ+jTGKKgx87wmiLOm/VRKJO6hEyWa4buAZf3PUnaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r+rD0tZWBSa3NpDBQQqqY7HrSUnod0xs6ajmUNyon4JROj6o3nwT27VH/VCYU8sRD
 /Kbq0+YbM10biJEmZK+OBSuZwgli5+Z1iCTjbQvhOMeBb0ytCJSOW0AN1YdkaeoiZZ
 bc+mzZTLi1RK2uhC20TFpr5IWuqftP3wWRffWbLTGMdctlWYaUNIxQ17Iswkg/t0vw
 kZJo5rxdBbncJ5/bf6KOM5D/udzAMIf6gd7RawronOeOB9bTxJ6b6jQ8QSKb8kJ30N
 c77itgVYtK9O6h2VSdZ8YHhiDETtaZCtxjvgxuW/98N5lHXWVmCxve930+lzzqXS0Z
 Mkn2rv9KyCoTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r+rD0tZW
Subject: Re: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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

Marcus, All,

On 2024-02-05 14:38 +0100, Marcus Hoffmann via buildroot spake thusly:
> Forgot my SoB
> On 21.09.23 22:39, ~bubu wrote:
> > From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> > Calling `setup.py` build builds and installs  an empty package
> > after upstream changed their packaging. Calling setuptools via
> > `python -m build` builds the package correctly.
> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>

Thanks. However, the SoB line needs to match the author of the commit,
and that does not match:
    Author:     Marcus Hoffmann <marcus.hoffmann@othermo.de>
    Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>

Regards,
Yann E. MORIN.

> > ---
> >   package/python-minimalmodbus/python-minimalmodbus.mk | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
> > index 5a6e7733be..cb8a0d8cc9 100644
> > --- a/package/python-minimalmodbus/python-minimalmodbus.mk
> > +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> > @@ -7,7 +7,8 @@
> >   PYTHON_MINIMALMODBUS_VERSION = 2.1.1
> >   PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
> >   PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
> > -PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
> > +PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
> > +PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
> >   PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
> >   PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
