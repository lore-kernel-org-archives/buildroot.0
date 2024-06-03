Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774A4C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CF664099B;
	Mon,  3 Jun 2024 18:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWoysYTMlBLT; Mon,  3 Jun 2024 18:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E774F40B2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E774F40B2F;
	Mon,  3 Jun 2024 18:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20B301BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BBE0408A9
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ud-u2H-Q3Gv for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A41D040893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41D040893
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A41D040893
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:44:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 792CA13F8A9;
 Mon,  3 Jun 2024 20:44:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 20:44:16 +0200
Date: Mon, 3 Jun 2024 20:44:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zl4PAPnPgRHHsaan@landeda>
References: <20240531194025.122135-1-ju.o@free.fr> <Zloux27_r6DqP0JF@landeda>
 <d8ea34fee435e9e86a3033554cf72c2c@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8ea34fee435e9e86a3033554cf72c2c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717440258;
 bh=nnojkMRdbMXepe+I1qaHar5ysNg+SMXvxhnnKhiykdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sua2zP/Tvco+wzCe8pumIZDMqmlG/F4loWDxjXgtbEBy+c8+9/4nQgZcSSNpggSK5
 mQJ7rLYAp8TV6xWRCMutCxx5GdFHr5gOR6pZe8oQnM6/8o4DxNCbpQct7Pa3t7AgPd
 WWjKfMcFPR4YnQwvCTUVbuu3wkrWKGKRf+Sp+COknHjdflb8bRZUWB97v8IADsLLJo
 d4Xm7dRPUnoEHmQNacQcYHM0aPoUnOp6IpMf2B5xi3ohaTN5so8sTbXUcqoNIbHXQD
 RfQnb3adI4jTUQ02jfJf7TEOvmXuej9k6IW0uF5diwaT5chy1nB9TZGJPOphpeWoGd
 9pTZaFEiVoGmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sua2zP/T
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional {Graphics,
 Image}Magick++ support
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

Julien, All,

On 2024-06-03 20:14 +0200, Julien Olivain spake thusly:
> On 31/05/2024 22:10, Yann E. MORIN wrote:
> > On 2024-05-31 21:40 +0200, Julien Olivain spake thusly:
> > > +ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
> > > +OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
> > > +OCTAVE_DEPENDENCIES += graphicsmagick
> > > +else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
> > > +OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
> > > +OCTAVE_DEPENDENCIES += imagemagick
> > > +else
> > > +OCTAVE_CONF_OPTS += --without-magick
> > This is material for the next branch, so should we just add
> > --without-magick on master, for correctness?
> To me, this is another instance of the grey zone between what goes in
> "master" and "next". Peter accepted the same kind of commit in master:
> https://gitlab.com/buildroot.org/buildroot/-/commit/c1723c0dfda041efb3da1d4da94909cbc0003e77
> The branch "next" was already opened.
> I understood that such a change is then a "fix" of Octave
> automatically detecting the presence of those dependencies. The build
> is not broken. It is just the support that might be enabled or not,
> depending on the build order.

Fair enough, that makes sense. No need to respin.

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
