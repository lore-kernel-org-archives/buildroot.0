Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD3C54736
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A155840493;
	Tue, 27 Aug 2024 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G9z0lkeBwl5; Tue, 27 Aug 2024 20:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511B4404CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511B4404CC;
	Tue, 27 Aug 2024 20:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0431BF28B
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD3081227
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mgdbcj5MUunA for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 20:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7135D8121E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7135D8121E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7135D8121E
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 20:07:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6798B13F879;
 Tue, 27 Aug 2024 22:07:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Aug 2024 22:07:04 +0200
Date: Tue, 27 Aug 2024 22:07:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zs4x6LWMJfdWqApz@landeda>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
 <20240823181741.499173f2@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823181741.499173f2@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724789229;
 bh=ojTxDX3un20Jv/TbCP+Mk39m7E3vgcMzNDTRM+ek7Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZltgYscTjbuWkzdz5TYnl7q0ZpBiX+2Jqg0m6YDrObPgbelrKEa0pavAJZyed6eCo
 F9I7k6eCjM42abzHM1UhyNRRkAO+0Q/6nVfync9dolU1iNnR43r7lO1e7Sk2aJJyAk
 YAtHmsNTMuCZOjgWuiDpXNVbj4Z+LA/OmL3jSFknIlakaf3pXttEzeTPFKbAM/by11
 8wPte3FNb4Jay23AJRfoLURKtLokp2pEoW0VK7ITRLQA0/7i5Fm52GOyGY6Apa7avd
 9Hj9uZqesfRMuFTv8Z666OpZ3PkXkWtMyqFgYOhI9BsDzI78uBbOZLR6Khw0eXkTXZ
 Qp94HlCM+OCsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZltgYscT
Subject: Re: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-23 18:17 +0200, Thomas Petazzoni spake thusly:
> On Thu, 22 Aug 2024 20:37:40 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
[--SNIP--]
> We also need to change busybox.mk to ensure that tinyinit is built
> before Busybox:
> 
> # Packages that provide commands that may also be busybox applets:
> BUSYBOX_DEPENDENCIES = \
> 	...
> 	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \

Good catch! We also need that for tini, then.

> > diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
> > new file mode 100644
> > index 000000000000..2ceb8e191e23
> > --- /dev/null
> > +++ b/package/tinyinit/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_TINYINIT
> > +	bool "tinyinit"
> > +	depends on BR2_INIT_NONE
> > +	help
> > +	  A Linux tiny initialization script suitable for resource
> > +	  limited systems, which can be used as an alternative to the
> > +	  one provided by Busybox.
> > +
> > +comment "tinyinit needs BR2_INIT_NONE, i. e. no init system installed"
> > +	depends on !BR2_INIT_NONE
> I find this a bit odd. In the end, shouldn't we simply promote tinyinit
> as an init implementation, and have its own BR2_INIT_TINYINIT entry?

As Dario already pointed out, that was my suggestion to drop it from the
init selection.

The reasoning is that we need to know the init system when we need some
infra for it. For example, for busybox/sysvinit, we need to install init
scripts, for systemd, the units, and for openrc, the openrc "units".

And the "None" init choice really is "Custom", in that there is always a
PID-1 process, whether in a real system, a VM, or a container: it is the
first process that is started in that environment. Now, whether that
process is a real init system, a stub, or directly the final applicaiton,
it is still a PID-1, and thus treated as 'init' by the kernel.

The existing tini package is to be used a a PID-1 in containers (I use
it extensively in that situation) and it does not need any infra in
Buildroot (it can only spawn a single child and is a reaper); to my
eyes, tiny-init is also very simple and does not require any infra in
Buildroot. Both tini and tiny-init are cases for a "Custom" init
(currently labelled "None").

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
