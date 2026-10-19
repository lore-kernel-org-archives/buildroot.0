Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A908CCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 05:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E53380DBF;
	Mon, 19 Oct 2026 05:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siKiA14DOzIx; Mon, 19 Oct 2026 05:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2935080DC4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792389258;
	b=KJlqtw8PoeWNlw9sZA1mViizZCuQmeQojt5dwy29EMX5LqXu3HIMth6RBzd7LhXEwzbG
	 BASyAV/xoag/eaSDHVHcTTx/gwqxhpgkXfs5w9bYi6M+hMagwfWtYZEBtB6vt1nL5ITG+
	 Gc+2IqEwxpxPmtVXbJri2rsALgbX1uqBYScfecGWQxCc4DD88zJNCqw/3huqHzsdCLKVr
	 DOPGsTcH6Uj+6Bgmcv8FfbimZ9PjVJzYvNM0ImnMYrZXoRzrD7wXjSEyMUGdmR6DG69h2
	 M7MQLsObrXkX61K1VGNBuf0/xzJ0mboiHX+j2uSz+J2JcWT5ZqvyRS8Vbbe6qPRSzDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792389258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ONwPdZjoFwLzaUDdWziqPwgihSu9tuKRWC0SNWBfVko=;
	b=bTF8HmYrWltoYKiwUl2DsrKZtHFcentvOghKxYsUIeVKoM/OCGK8w0RSxVLvQkBRhnXs
	 IoMrAjC4WHvpKDntrQMI0L6/LqYXsFRU9TIGMrLP9TqzMrhmWQ+RRqREHLBenZ5Xn/qRl
	 OCvNaSjJh6cEk+ctTRQfyVaWarXQSGu7O0Rjg0hGnQS3kZw76x724rCZlhFNnwGQy5v8W
	 wtsGY7x9LbGUcWm8BSta9qTCHj1Hn9A26AMTc6hE8tikdB2ObX/hPizzRnxLHpuqkUxLx
	 z/Gs+SxW/dKtDw35GPYlhDFsk6ImfSeTpN2+uJYncYBCL2anb0ymf7BW0lDEEUDIljQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792389258;
	bh=ONwPdZjoFwLzaUDdWziqPwgihSu9tuKRWC0SNWBfVko=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TcR9571GWrGtCUFpWVIwc7w/cGHQkYmi3hWmrnGQCyWnd/sMy4QhrauvWe4wXWMMc
	 2nf/zcVpbRoyBj4FBW31IZQfcNXZtGUriPB9txySmBoFGwp1C6ErfGrRBbt92yNMml
	 DYzDNZYT5KzsXeqDUnoK1OrzN1U5e+fE4I2BoUf1zHrbBYDwc9mkgjwVu/9k3TxgVz
	 xnEQt0HKIcCfzM03QoUBsXiF33jpN5OWCsPm25+7c93TYmfYRAqPyZK+4oQr/EXGvk
	 zteoxfOcRtg6xnTBom/bp+0xurFPV3TspIBhocbfKXQnqEsfM3sE/FU0vy5kEdgLRY
	 JbyM7jS9ASFbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2935080DC4;
	Mon, 19 Oct 2026 05:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E757B75
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1A6406A1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIeo7PLdyvDM for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 05:54:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F3D5406A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792389255;
 b=MKwuu0SpVzgPdhdWAOZvdnILIILEsj9qx/837IG7Ma2lxCvjSse7EV6gbFpbtf160clN
 D2Ur7tywv19dxgg0faadkofu3EnrbqqqcZYipW1vuKjlapWZpZbGl7l0j6CdKrV6ZAHyX
 YxsSvDYNGp5WzST/VbSJG6ZV6969Yu/qPXaZX6lUdKumH7WVMcU/fpY4z9qYwkeryhFFu
 cnQtXIlhUxLC8VBOEWJi5WFPViZMEpELUqNZ9NSJoocq8MFq0y3EidEeP6uct+3tQ3QGS
 PotcPVH9AehtynOORhSRmKgZPwfJjeKoZUL7QaVI8cP7G0r54evdBptPiIHCk1ZxNng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792389255;
 h=Received-SPF:Received:DKIM-Signature:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=XlMv5D3BXcDFknNvyb4Rn43+Vezrrt4byhR9p0BoY5w=;
 b=b9098ECuj88Va/rZBSuhsMsWxA30hms4E3mg06/Zpq7c5R/qAdpWA8yIH37GwViwdq/k
 Wuc2vghlTz66XyxRBAbh/m2xn8ZF/OL/7CyP+rSTIftq06CBXqf6p3Lrwhl8iOAPj3sWD
 87O//1wxUnUGmo20rEEQOf+Zy+8O2PxZ014dh2Iiq4TpWACvkyhJsgTc2SbVhRnJwldEb
 t2oSSyAmOyWo4E1h81UsBerbn4YDrM3Sgldiqyetp67ltSrUkB2THYwLrUGBENkrsco35
 8Iol9R7FOgkDNX22eZFmzHt9PvCsIIV7B4Sn1p15rI4M0lW63wpliFqYCYa4T+VWZew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jazwSagO; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F3D5406A0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:54:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c1b2:c247:1f34:4379])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 503535FFB7;
 Mon, 19 Oct 2026 07:54:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Oct 2026 07:53:40 +0200
Date: Mon, 19 Oct 2026 07:53:40 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org,
 Adam Ford <aford173@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <atWwZGNSjbN0GrwD@landeda>
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atUtmzafWnVtVm-t@windsurf>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

Thomas, All,

On 2026-10-18 22:41 +0200, Thomas Petazzoni spake thusly:
> [+Yann since he added libglvnd initially.]

Actually, it was Jakub would introduced it in 2020, I "only" reworked
the package, and it was applied in 2022 with 0378e2e5d9ce
(package/libglvnd: new package).

But that was a long time ago, and my recollecion of the details is
partial... Let's see below...

> On Sun, Oct 18, 2026 at 06:06:51PM +0200, John Ernberg wrote:
> Thanks for this new iteration. It is really annoying that mesa3d needs
> libglvnd, as it prevents from doing the natural thing:
> 	libgl -> libglvnd -> real OpenGL provider -> mesa3d
> In the end this indeed means that the only option is to do something
> like this:
> 	libgl -> libglvnd
> 	      -> real OpenGL provider

Is this for build dependencies?

AFAIR, the actual GL providers do depend on libglvnd at build time,
so we'd have:

    [GL-using package] -> libgl -> libglvnd
                           mesa3d -/

I wonder if should further have this:

    [GL-using package] -> libgl     ->     libglvnd
                              \-> mesa3d -/

... even though the libgl -> mesa3d would be here just to ensure build
ordering, and there would be nothing from mesa3d that the [GL-using
package] would use at build time in practice. I think...

> Now, the questions that come up are:
> - Why do you need libglvnd in the first place? Why don't you just
>   enable mesa3d?
> - Why do we have libglvnd at all? It has been added in 2020, but so
>   far only mesa3d has been made "suitable" to be used behind libglvnd,
>   and since we have only one OpenGL provider able to be used behind
>   libglvnd, the abstraction that libglvnd provides seems quite
>   useless, no?

libglvnd would allow having multiple GL (GLES, EGL, let's call all of
that just "GL" to simplify) providers at the same time on the same
system.

For example, some boards have two GPUs, one integrated and one discrete.

The idea of a series I sent back then [0], was when libglvnd was _not_
enabled in the configuration, then we could have only one GL provider,
i.e. the case currently. But when libglvnd was enabled, then multiple
GL provider could be enabled in the same configuration.

At the time, libglvnd was relatively new, nad only mesa3d had
support for it; the nvidia package we had (and that we still have,
AFAICS) was too old, but newer versions (IIRC) do support being
installed so as to be found by libglvnd.

So, the idea was to bump nvidia-driver, but that stalled for various
reasons...

Then, we need to also check which other GL providers can be configured
with libglnvd support.

> So shouldn't we drop libglvnd entirely?

Depends if Buildroot eventually want to support boards with two GPU, one
integrated and one (or more) discrete. This happens.

[0] https://lore.kernel.org/buildroot/cover.1595839612.git.yann.morin.1998@free.fr/

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
